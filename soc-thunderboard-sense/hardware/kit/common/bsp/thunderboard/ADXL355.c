/*!
 *****************************************************************************
 * @file:    ADXL355.c
 * @brief:   ADXL355 accelerometer IC
 * @version: $Revision$
 * @date:    $Date$
 *-----------------------------------------------------------------------------
 *
Copyright (c) 2016-2017 Analog Devices, Inc.

All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:
  - Redistributions of source code must retain the above copyright notice,
    this list of conditions and the following disclaimer.
  - Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimer in the documentation
    and/or other materials provided with the distribution.
  - Modified versions of the software must be conspicuously marked as such.
  - This software is licensed solely and exclusively for use with processors
    manufactured by or for Analog Devices, Inc.
  - This software may not be combined or merged with other code in any manner
    that would cause the software to become subject to terms and conditions
    which differ from those listed here.
  - Neither the name of Analog Devices, Inc. nor the names of its
    contributors may be used to endorse or promote products derived
    from this software without specific prior written permission.
  - The use of this software may or may not infringe the patent rights of one
    or more patent holders.  This license does not release you from the
    requirement that you obtain separate licenses from these patent holders
    to use this software.

THIS SOFTWARE IS PROVIDED BY ANALOG DEVICES, INC. AND CONTRIBUTORS "AS IS" AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, NON-INFRINGEMENT,
TITLE, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN
NO EVENT SHALL ANALOG DEVICES, INC. OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, PUNITIVE OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, DAMAGES ARISING OUT OF CLAIMS OF INTELLECTUAL
PROPERTY RIGHTS INFRINGEMENT; PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 *****************************************************************************/

/***************************** Include Files **********************************/
#include <stdio.h>



#include "ADXL355.h"
#include "em_usart.h"
#include "em_gpio.h"
#include "em_cmu.h"

/****************************** Global Data ***********************************/

int32_t volatile i32SensorX;
int32_t volatile i32SensorY;
int32_t volatile i32SensorZ;
int32_t volatile i32SensorT;
uint32_t volatile ui32SensorX;
uint32_t volatile ui32SensorY;
uint32_t volatile ui32SensorZ;
uint32_t volatile ui32SensorT;
uint32_t sensor_data[9];

volatile uint32_t ui32timer_counter = 0;

float adxl355Scale;

#define ADXL355_USART_INITSYNC                                                             \
  {                                                                                         \
    usartEnable,  /* Enable RX/TX when init completed                                  */   \
    0,            /* Use current configured reference clock for configuring baudrate   */   \
    200000,      /* 1 Mbits/s                                                         */   \
    usartDatabits8, /* 8 databits                                                        */ \
    true,         /* Master mode                                                       */   \
    true,         /* Send least significant bit first                                  */   \
    usartClockMode0,/* Clock idle low, sample on rising edge                             */ \
    false,        /* Not USART PRS input mode                                          */   \
    usartPrsRxCh0, /* PRS channel 0                                                     */  \
    false,        /* No AUTOTX mode                                                    */   \
    true,        /* No AUTOCS mode                                                    */   \
    100,            /* Auto CS Hold cycles                                               */   \
    100             /* Auto CS Setup cycles                                              */   \
  }

/***************************************************************************//**
 * @brief
 *    Initializes the SPI bus in order to communicate with the ICM20648
 *
 * @return
 *    Returns zero on OK, non-zero otherwise
 ******************************************************************************/
uint32_t ADXL355_spiInit(void)
{
  USART_TypeDef *usart = USART1;
  USART_InitSync_TypeDef init = ADXL355_USART_INITSYNC;

  /* Enabling clock to USART */
  CMU_ClockEnable(cmuClock_HFPER, true);
  CMU_ClockEnable(cmuClock_USART1, true);
  CMU_ClockEnable(cmuClock_GPIO, true);

  /* IO configuration */
  GPIO_PinModeSet(gpioPortC, 6, gpioModePushPull, 0);    /* TX - MOSI */
  GPIO_PinModeSet(gpioPortC, 7, gpioModeInput, 0);    /* RX - MISO */
  GPIO_PinModeSet(gpioPortC, 8, gpioModePushPull, 0);    /* Clock */
  GPIO_PinModeSet(gpioPortC, 9, gpioModePushPull, 0);    /* CS */

  USART_Reset(USART1);

  /* Initialize USART, in SPI master mode. */
  USART_InitSync(usart, &init);

  /* Enable pins at correct UART/USART location. */
  usart->ROUTEPEN   = USART_ROUTEPEN_RXPEN | USART_ROUTEPEN_TXPEN | USART_ROUTEPEN_CLKPEN;
  usart->ROUTELOC0  = (usart->ROUTELOC0 & ~(_USART_ROUTELOC0_TXLOC_MASK | _USART_ROUTELOC0_RXLOC_MASK | _USART_ROUTELOC0_CLKLOC_MASK) );
  usart->ROUTELOC0 |= (11 << _USART_ROUTELOC0_TXLOC_SHIFT);
  usart->ROUTELOC0 |= (11 << _USART_ROUTELOC0_RXLOC_SHIFT);
  usart->ROUTELOC0 |= (11 << _USART_ROUTELOC0_CLKLOC_SHIFT);

  return 0;
}
/************************* Global scope functions *****************************/
#define CLOCKSPEED 48000000 //40Mhz clock
void delay(int delay_ms)
{
 int volatile i;//40000 is 1ms for 40Mhz clock.

 while(delay_ms--){
	 i = CLOCKSPEED * (1/1000); //1ms delay
	 while(i--);
 }
}

//API to toggle CS
void toggle_CS (int del)
{
	   delay(del*2);
	   GPIO_PinOutSet( gpioPortC, 9 );

	   delay(del);
	   GPIO_PinOutClear(gpioPortC, 9);
}

/**
   @brief Initialization the accelerometer sensor

   @return none

**/
int ADXL355_Init(void)
{
	//uint8_t ui8temp;
	int volatile ui32test;
    int volatile i =0;
   //DioPulPin(CSACC_PORT, CSACC_PIN_NUMBER, 0);          /* Disable the internal pull up on CSACC pin */
   //DioOenPin(CSACC_PORT, CSACC_PIN_NUMBER, 1);          /* Set CSACC pin as output */
   //GPIO_PinModeSet(BOARD_BUTTON_LEFT_PORT, BOARD_BUTTON_LEFT_PIN, gpioModePushPull, 0);
	ADXL355_spiInit();
   //DioPulPin(INT1ACC_PORT, INT1ACC_PIN_NUMBER, 0);         /* Disable the internal pull up on INT1ACC pin */
   //DioOenPin(INT1ACC_PORT, INT1ACC_PIN_NUMBER, 0);         /* Set INT1ACC pin as input */
   GPIO_PinModeSet(gpioPortF, 3, gpioModeInput, 0);

   //DioPulPin(INT2ACC_PORT, INT2ACC_PIN_NUMBER, 0);         /* Disable the internal pull up on INT2ACC pin */
   //DioOenPin(INT2ACC_PORT, INT2ACC_PIN_NUMBER, 0);         /* Set INT2ACC pin as input */
   GPIO_PinModeSet(gpioPortF, 4, gpioModeInput, 0);

   //DioPulPin(DATARDYACC_PORT, DATARDYACC_PIN_NUMBER, 0);         /* Disable the internal pull up on DRDY2ACC pin */
   //DioOenPin(DATARDYACC_PORT, DATARDYACC_PIN_NUMBER, 0);         /* Set DRDY pin as input */
   GPIO_PinModeSet(gpioPortF, 5, gpioModeInput, 0);

   //SPI_Write(RANGE, 0x81, 0x00, SPI_WRITE_ONE_REG);          /* Set sensor range within RANGE register */

   GPIO_PinOutClear(gpioPortC, 9);

   delay(1);
   GPIO_PinOutSet(gpioPortC, 9);
   delay(1);
   GPIO_PinOutClear(gpioPortC, 9);

   //For Writing to a register Bit 0 --> 0
   //For Reading a register    Bit 0 --> 1


   //Initializing the sensor
   USART_Tx(USART1, (POWER_CTL<<1)| 0x0);// Data sent : 0x5A
   USART_Tx(USART1,0x1 );

   USART_Tx(USART1, (RANGE<<1)|0x0);// Data sent : 0x58
   USART_Tx(USART1, 0x81);
   adxl355Scale = 256000.0f;

   USART_Tx(USART1, (FILTER<<1)| 0x0);// Data sent : 0x50
   USART_Tx(USART1,0x04 );

   USART_Tx(USART1, (POWER_CTL<<1)| 0x0); // Data sent : 0x5A
   USART_Tx(USART1,0x0 );

   //Making sure buffer got empty
   while(!((USART1->STATUS)&(0x1<< 6)));

   toggle_CS(350); //100ms


   /* Quick verification test for boards */

   /* Reading Device ID :  REGISTER ADD :  0x00  VALUE EXPECTED : 0xAD */
	   USART_Tx(USART1, (DEVID_AD<<1)| 0x1); //Data sent 0x01
	   USART_Tx(USART1, 0xAA);

	   ui32test = (uint8_t)USART_Rx(USART1);
	   //if(ui32test != 0xAD)

	   toggle_CS(350); //100ms


	   /* Reading Device ID :  REGISTER ADD :  0x01  VALUE EXPECTED : 0x1D */
	   USART_Tx(USART1, (DEVID_MST<<1)| 0x1); // Data sent : 0x03
	   USART_Tx(USART1, 0xAA);

	   ui32test = (uint8_t)USART_Rx(USART1);
	  // if(ui32test != 0xAD)
	   toggle_CS(350); //100ms

	  	 /* Reading Device ID :  REGISTER ADD :  0x02  VALUE EXPECTED : 0xED */
	   USART_Tx(USART1, (PARTID<<1)| 0x1); //Data Sent : 0x06
	   USART_Tx(USART1, 0xAA);

	   ui32test = (uint8_t)USART_Rx(USART1);
	   //if(ui32test != 0xAD){
	   toggle_CS(350); //100ms

     delay(4000);
	// while(1)
	 {


    ADXL355_Start_Sensor();
	   /* Reading Device ID :  REGISTER ADD :  0x04  Check Bit 0 */
	   USART_Tx(USART1, (FIFO_STATUS<<1)| 0x1); //Data Sent : 0x09
	   USART_Tx(USART1, 0xAA);

	   ui32test = (uint8_t)USART_Rx(USART1);



	   //Wait till DRDY is present
	   while(!(ui32test & 0x01));


	   toggle_CS(350); //100ms

	  	 /* Reading Device ID :  REGISTER ADD :  0x11  FIFO register , read 9 bytes later */
	   USART_Tx(USART1, 0x23);

	   for(i = 0; i<3;i++)
	   {

		 USART_Tx(USART1, 0xAA);
		 sensor_data[i] = (uint8_t)USART_Rx(USART1);
		 USART_Tx(USART1, 0xAA);
		 sensor_data[i+1] = (uint8_t)USART_Rx(USART1);
		 USART_Tx(USART1, 0xAA);
		 sensor_data[i+2] = (uint8_t)USART_Rx(USART1);

	   }
	 }

	 toggle_CS(350); //

	 /* Reading Device ID :  REGISTER ADD :  0x08  VALUE EXPECTED : 0x1D */
	 	   USART_Tx(USART1, (XDATA3<<1)| 0x1); // Data sent : 0x11
	 	   USART_Tx(USART1, 0xAA);

	 	   ui32test = (uint8_t)USART_Rx(USART1);
	 	   USART_Tx(USART1, (XDATA2<<1)| 0x1); // Data sent : 0x13
		   USART_Tx(USART1, 0xAA);

		   ui32test = (uint8_t)USART_Rx(USART1);
		   USART_Tx(USART1, (XDATA1<<1)| 0x1); // Data sent : 0x15
	       USART_Tx(USART1, 0xAA);

		   ui32test = (uint8_t)USART_Rx(USART1);
	 	  // if(ui32test != 0xAD)
	 	   toggle_CS(350); //100ms

   GPIO_PinOutSet( gpioPortC, 9 );


   return 0;
}

/**
   @brief Turns on accelerometer measurement mode.

   @return none

**/
void ADXL355_Start_Sensor(void)
{
   uint8_t ui8temp;

   USART_Tx(USART1, (POWER_CTL<<1)| 0x1);

   USART_Tx(USART1, 0xAA);

   //ui8temp = (uint8_t)SPI_Read(POWER_CTL, SPI_READ_ONE_REG);       /* Read POWER_CTL register, before modifying it */
   ui8temp = (uint8_t)USART_Rx(USART1);
   ui8temp = ui8temp & 0xFE;                                          /* Set measurement bit in POWER_CTL register */

   USART_Tx(USART1, (POWER_CTL<<1)| 0x0);
   //SPI_Write(POWER_CTL, ui8temp, 0x00, SPI_WRITE_ONE_REG);          /* Write the new value to POWER_CTL register */
   USART_Tx(USART1,ui8temp );
}


/**
   @brief Puts the accelerometer into standby mode.

   @return none

**/
void ADXL355_Stop_Sensor(void)
{
   uint8_t ui8temp;

   USART_Tx(USART1, (POWER_CTL<<1)| 0x1);

   USART_Tx(USART1, 0xAA);
   //ui8temp = (uint8_t)SPI_Read(POWER_CTL, SPI_READ_ONE_REG);        /*Read POWER_CTL register, before modifying it */
   ui8temp = (uint8_t)USART_Rx(USART1);
   ui8temp = ui8temp | 0x01;                                          /* Clear measurement bit in POWER_CTL register */

   USART_Tx(USART1, (POWER_CTL<<1)| 0x0);
   //SPI_Write(POWER_CTL, ui8temp, 0x00, SPI_WRITE_ONE_REG);          /* Write the new value to POWER_CTL register */
   USART_Tx(USART1,ui8temp );
}

/**
   @brief Reads the accelerometer data.

   @return none

**/
void ADXL355_Data_Scan(void)
{
	  uint32_t ui32valueL = 0;
	  uint32_t ui32valueM __attribute__((unused)) = 0;
	  uint32_t ui32valueH = 0;

	  USART_Tx(USART1, (XDATA3<<1)| 0x1);

	  USART_Tx(USART1, 0xAA);
	  USART_Tx(USART1, 0xAA);
	  USART_Tx(USART1, 0xAA);

	  ui32valueH = (uint32_t)USART_Rx(USART1);
	  ui32valueM = (uint32_t)USART_Rx(USART1);
	  ui32valueL = (uint32_t)USART_Rx(USART1);

	  ui32SensorX = ((ui32valueH << 16) | (ui32valueL << 8) | ui32valueL);

      //ui32SensorX = SPI_Read(XDATA3, SPI_READ_THREE_REG);

	  USART_Tx(USART1, (YDATA3<<1)| 0x1);

	  USART_Tx(USART1, 0xAA);
	  USART_Tx(USART1, 0xAA);
	  USART_Tx(USART1, 0xAA);

	  ui32valueH = (uint32_t)USART_Rx(USART1);
	  ui32valueM = (uint32_t)USART_Rx(USART1);
	  ui32valueL = (uint32_t)USART_Rx(USART1);

	  ui32SensorY = ((ui32valueH << 16) | (ui32valueL << 8) | ui32valueL);

      //ui32SensorY = SPI_Read(YDATA3, SPI_READ_THREE_REG);

	  USART_Tx(USART1, (YDATA3<<1)| 0x1);

	  USART_Tx(USART1, 0xAA);
	  USART_Tx(USART1, 0xAA);
	  USART_Tx(USART1, 0xAA);

	  ui32valueH = (uint32_t)USART_Rx(USART1);
	  ui32valueM = (uint32_t)USART_Rx(USART1);
	  ui32valueL = (uint32_t)USART_Rx(USART1);

	  ui32SensorY = ((ui32valueH << 16) | (ui32valueL << 8) | ui32valueL);

      //ui32SensorZ = SPI_Read(ZDATA3, SPI_READ_THREE_REG);
      //ui32SensorT = SPI_Read(TEMP2, SPI_READ_TWO_REG);
      i32SensorX = ADXL355_Acceleration_Data_Conversion(ui32SensorX);
      i32SensorY = ADXL355_Acceleration_Data_Conversion(ui32SensorY);
      i32SensorZ = ADXL355_Acceleration_Data_Conversion(ui32SensorZ);

}


/**
   @brief Convert the two's complement data in X,Y,Z registers to signed integers

   @param ui32SensorData - raw data from register

   @return int32_t - signed integer data

**/
int32_t ADXL355_Acceleration_Data_Conversion (uint32_t ui32SensorData)
{
   int32_t volatile i32Conversion = 0;

   ui32SensorData = (ui32SensorData  >> 4);
   ui32SensorData = (ui32SensorData & 0x000FFFFF);

   if((ui32SensorData & 0x00080000)  == 0x00080000){

         i32Conversion = (ui32SensorData | 0xFFF00000);

   }
   else{
         i32Conversion = ui32SensorData;
   }

   return i32Conversion;
}
