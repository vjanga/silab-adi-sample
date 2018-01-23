################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../platform/Device/SiliconLabs/EFR32MG1P/Source/system_efr32mg1p.c 

OBJS += \
./platform/Device/SiliconLabs/EFR32MG1P/Source/system_efr32mg1p.o 

C_DEPS += \
./platform/Device/SiliconLabs/EFR32MG1P/Source/system_efr32mg1p.d 


# Each subdirectory must supply rules for building sources it contributes
platform/Device/SiliconLabs/EFR32MG1P/Source/system_efr32mg1p.o: ../platform/Device/SiliconLabs/EFR32MG1P/Source/system_efr32mg1p.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__STACK_SIZE=0x800' '-D__HEAP_SIZE=0xD00' '-DRADIO_BLE=1' '-DEFR32MG1P132F256GM48=1' -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/emlib/src" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/hardware/kit/common/bsp/thunderboard" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/Device/SiliconLabs/EFR32MG1P/Include" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/emdrv/tempdrv/inc" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/emdrv/dmadrv/inc" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/hardware/kit/EFR32MG1_BRD4160A/config" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/hardware/kit/common/bsp/thunderboard/imu" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/emdrv/dmadrv/src" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/hardware/kit/common/drivers" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/protocol/bluetooth_2.7/ble_stack/inc/common" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/CMSIS/Include" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/emlib/inc" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/emdrv/gpiointerrupt/inc" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/radio/rail_lib/common" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/radio/rail_lib/chip/efr32" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/emdrv/sleep/inc" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/hardware/kit/common/bsp/thunderboard/bosch/BMP280_driver" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/Device/SiliconLabs/EFR32MG1P/Source" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/emdrv/tempdrv/src" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/emdrv/common/inc" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/hardware/kit/common/bsp/thunderboard/rfs" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/bootloader/api" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/emdrv/uartdrv/inc" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/protocol/bluetooth_2.7/ble_stack/inc/soc" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/hardware/kit/common/bsp" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/emdrv/gpiointerrupt/src" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/Device/SiliconLabs/EFR32MG1P/Source/GCC" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/emdrv/sleep/src" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/app/bluetooth_2.7/common/stack_bridge" -I"/Users/sushant/Documents/GitHub/silab-adi-sample/soc-thunderboard-sense/platform/bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/Device/SiliconLabs/EFR32MG1P/Source/system_efr32mg1p.d" -MT"platform/Device/SiliconLabs/EFR32MG1P/Source/system_efr32mg1p.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


