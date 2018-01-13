################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../hardware/kit/common/bsp/thunderboard/imu/imu.c \
../hardware/kit/common/bsp/thunderboard/imu/imu_dcm.c \
../hardware/kit/common/bsp/thunderboard/imu/imu_fuse.c \
../hardware/kit/common/bsp/thunderboard/imu/imu_math.c 

OBJS += \
./hardware/kit/common/bsp/thunderboard/imu/imu.o \
./hardware/kit/common/bsp/thunderboard/imu/imu_dcm.o \
./hardware/kit/common/bsp/thunderboard/imu/imu_fuse.o \
./hardware/kit/common/bsp/thunderboard/imu/imu_math.o 

C_DEPS += \
./hardware/kit/common/bsp/thunderboard/imu/imu.d \
./hardware/kit/common/bsp/thunderboard/imu/imu_dcm.d \
./hardware/kit/common/bsp/thunderboard/imu/imu_fuse.d \
./hardware/kit/common/bsp/thunderboard/imu/imu_math.d 


# Each subdirectory must supply rules for building sources it contributes
hardware/kit/common/bsp/thunderboard/imu/imu.o: ../hardware/kit/common/bsp/thunderboard/imu/imu.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__STACK_SIZE=0x800' '-D__HEAP_SIZE=0xD00' '-DRADIO_BLE=1' '-DEFR32MG1P132F256GM48=1' -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emlib\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp\thunderboard" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\Device\SiliconLabs\EFR32MG1P\Include" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\tempdrv\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\dmadrv\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\EFR32MG1_BRD4160A\config" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp\thunderboard\imu" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\dmadrv\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\drivers" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\protocol\bluetooth_2.7\ble_stack\inc\common" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\CMSIS\Include" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emlib\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\gpiointerrupt\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\radio\rail_lib\common" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\radio\rail_lib\chip\efr32" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\sleep\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp\thunderboard\bosch\BMP280_driver" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\Device\SiliconLabs\EFR32MG1P\Source" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\tempdrv\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\common\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp\thunderboard\rfs" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\bootloader\api" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\uartdrv\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\protocol\bluetooth_2.7\ble_stack\inc\soc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\gpiointerrupt\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\Device\SiliconLabs\EFR32MG1P\Source\GCC" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\sleep\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\app\bluetooth_2.7\common\stack_bridge" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"hardware/kit/common/bsp/thunderboard/imu/imu.d" -MT"hardware/kit/common/bsp/thunderboard/imu/imu.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

hardware/kit/common/bsp/thunderboard/imu/imu_dcm.o: ../hardware/kit/common/bsp/thunderboard/imu/imu_dcm.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__STACK_SIZE=0x800' '-D__HEAP_SIZE=0xD00' '-DRADIO_BLE=1' '-DEFR32MG1P132F256GM48=1' -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emlib\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp\thunderboard" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\Device\SiliconLabs\EFR32MG1P\Include" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\tempdrv\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\dmadrv\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\EFR32MG1_BRD4160A\config" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp\thunderboard\imu" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\dmadrv\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\drivers" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\protocol\bluetooth_2.7\ble_stack\inc\common" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\CMSIS\Include" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emlib\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\gpiointerrupt\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\radio\rail_lib\common" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\radio\rail_lib\chip\efr32" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\sleep\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp\thunderboard\bosch\BMP280_driver" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\Device\SiliconLabs\EFR32MG1P\Source" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\tempdrv\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\common\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp\thunderboard\rfs" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\bootloader\api" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\uartdrv\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\protocol\bluetooth_2.7\ble_stack\inc\soc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\gpiointerrupt\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\Device\SiliconLabs\EFR32MG1P\Source\GCC" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\sleep\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\app\bluetooth_2.7\common\stack_bridge" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"hardware/kit/common/bsp/thunderboard/imu/imu_dcm.d" -MT"hardware/kit/common/bsp/thunderboard/imu/imu_dcm.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

hardware/kit/common/bsp/thunderboard/imu/imu_fuse.o: ../hardware/kit/common/bsp/thunderboard/imu/imu_fuse.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__STACK_SIZE=0x800' '-D__HEAP_SIZE=0xD00' '-DRADIO_BLE=1' '-DEFR32MG1P132F256GM48=1' -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emlib\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp\thunderboard" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\Device\SiliconLabs\EFR32MG1P\Include" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\tempdrv\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\dmadrv\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\EFR32MG1_BRD4160A\config" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp\thunderboard\imu" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\dmadrv\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\drivers" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\protocol\bluetooth_2.7\ble_stack\inc\common" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\CMSIS\Include" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emlib\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\gpiointerrupt\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\radio\rail_lib\common" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\radio\rail_lib\chip\efr32" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\sleep\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp\thunderboard\bosch\BMP280_driver" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\Device\SiliconLabs\EFR32MG1P\Source" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\tempdrv\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\common\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp\thunderboard\rfs" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\bootloader\api" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\uartdrv\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\protocol\bluetooth_2.7\ble_stack\inc\soc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\gpiointerrupt\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\Device\SiliconLabs\EFR32MG1P\Source\GCC" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\sleep\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\app\bluetooth_2.7\common\stack_bridge" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"hardware/kit/common/bsp/thunderboard/imu/imu_fuse.d" -MT"hardware/kit/common/bsp/thunderboard/imu/imu_fuse.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

hardware/kit/common/bsp/thunderboard/imu/imu_math.o: ../hardware/kit/common/bsp/thunderboard/imu/imu_math.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__STACK_SIZE=0x800' '-D__HEAP_SIZE=0xD00' '-DRADIO_BLE=1' '-DEFR32MG1P132F256GM48=1' -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emlib\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp\thunderboard" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\Device\SiliconLabs\EFR32MG1P\Include" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\tempdrv\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\dmadrv\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\EFR32MG1_BRD4160A\config" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp\thunderboard\imu" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\dmadrv\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\drivers" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\protocol\bluetooth_2.7\ble_stack\inc\common" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\CMSIS\Include" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emlib\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\gpiointerrupt\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\radio\rail_lib\common" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\radio\rail_lib\chip\efr32" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\sleep\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp\thunderboard\bosch\BMP280_driver" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\Device\SiliconLabs\EFR32MG1P\Source" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\tempdrv\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\common\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp\thunderboard\rfs" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\bootloader\api" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\uartdrv\inc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\protocol\bluetooth_2.7\ble_stack\inc\soc" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\hardware\kit\common\bsp" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\gpiointerrupt\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\Device\SiliconLabs\EFR32MG1P\Source\GCC" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\emdrv\sleep\src" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\app\bluetooth_2.7\common\stack_bridge" -I"C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\bootloader" -O2 -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"hardware/kit/common/bsp/thunderboard/imu/imu_math.d" -MT"hardware/kit/common/bsp/thunderboard/imu/imu_math.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

