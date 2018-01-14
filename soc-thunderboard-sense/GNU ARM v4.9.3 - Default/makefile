################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include protocol/bluetooth_2.7/lib/EFR32MG1P/GCC/subdir.mk
-include platform/emlib/src/subdir.mk
-include platform/emdrv/tempdrv/src/subdir.mk
-include platform/emdrv/sleep/src/subdir.mk
-include platform/emdrv/gpiointerrupt/src/subdir.mk
-include platform/emdrv/dmadrv/src/subdir.mk
-include platform/Device/SiliconLabs/EFR32MG1P/Source/GCC/subdir.mk
-include platform/Device/SiliconLabs/EFR32MG1P/Source/subdir.mk
-include hardware/kit/common/drivers/subdir.mk
-include hardware/kit/common/bsp/thunderboard/rfs/subdir.mk
-include hardware/kit/common/bsp/thunderboard/imu/subdir.mk
-include hardware/kit/common/bsp/thunderboard/bosch/BMP280_driver/subdir.mk
-include hardware/kit/common/bsp/thunderboard/subdir.mk
-include hardware/kit/common/bsp/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: soc-thunderboard-sense.axf

# Tool invocations
soc-thunderboard-sense.axf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GNU ARM C Linker'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -T "C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\efr32mg1p132f256gm48.ld" -Xlinker --gc-sections -Xlinker -Map="soc-thunderboard-sense.map" -mfpu=fpv4-sp-d16 -mfloat-abi=softfp --specs=nano.specs -o soc-thunderboard-sense.axf -Wl,--start-group "./advertisement-callback.o" "./aio.o" "./app.o" "./app_ble.o" "./app_ble_adv.o" "./app_callback.o" "./application_properties.o" "./batt.o" "./connection-callback.o" "./connection.o" "./es.o" "./gatt_db.o" "./iaq.o" "./imus.o" "./main.o" "./power.o" "./pti.o" "./radio_ble.o" "./ui.o" "./hardware/kit/common/bsp/bsp_stk.o" "./hardware/kit/common/bsp/thunderboard/ADXL355.o" "./hardware/kit/common/bsp/thunderboard/bap.o" "./hardware/kit/common/bsp/thunderboard/board_4160.o" "./hardware/kit/common/bsp/thunderboard/ccs811.o" "./hardware/kit/common/bsp/thunderboard/icm20648.o" "./hardware/kit/common/bsp/thunderboard/mic.o" "./hardware/kit/common/bsp/thunderboard/si1133.o" "./hardware/kit/common/bsp/thunderboard/si7021.o" "./hardware/kit/common/bsp/thunderboard/util.o" "./hardware/kit/common/bsp/thunderboard/util_supply.o" "./hardware/kit/common/bsp/thunderboard/bosch/BMP280_driver/bmp280.o" "./hardware/kit/common/bsp/thunderboard/imu/imu.o" "./hardware/kit/common/bsp/thunderboard/imu/imu_dcm.o" "./hardware/kit/common/bsp/thunderboard/imu/imu_fuse.o" "./hardware/kit/common/bsp/thunderboard/imu/imu_math.o" "./hardware/kit/common/bsp/thunderboard/rfs/rfs.o" "./hardware/kit/common/drivers/i2cspm.o" "./hardware/kit/common/drivers/retargetio.o" "./hardware/kit/common/drivers/retargetserial.o" "./platform/Device/SiliconLabs/EFR32MG1P/Source/GCC/startup_efr32mg1p.o" "./platform/Device/SiliconLabs/EFR32MG1P/Source/system_efr32mg1p.o" "./platform/emdrv/dmadrv/src/dmadrv.o" "./platform/emdrv/gpiointerrupt/src/gpiointerrupt.o" "./platform/emdrv/sleep/src/sleep.o" "./platform/emdrv/tempdrv/src/tempdrv.o" "./platform/emlib/src/em_adc.o" "./platform/emlib/src/em_cmu.o" "./platform/emlib/src/em_core.o" "./platform/emlib/src/em_cryotimer.o" "./platform/emlib/src/em_crypto.o" "./platform/emlib/src/em_emu.o" "./platform/emlib/src/em_gpio.o" "./platform/emlib/src/em_i2c.o" "./platform/emlib/src/em_ldma.o" "./platform/emlib/src/em_letimer.o" "./platform/emlib/src/em_msc.o" "./platform/emlib/src/em_prs.o" "./platform/emlib/src/em_rmu.o" "./platform/emlib/src/em_rtcc.o" "./platform/emlib/src/em_system.o" "./platform/emlib/src/em_timer.o" "./platform/emlib/src/em_usart.o" "C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\protocol\bluetooth_2.7\lib\EFR32MG1P\GCC\libbluetooth.a" "C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\platform\radio\rail_lib\autogen\librail_release\librail_efr32xg1_gcc_release.a" "C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\protocol\bluetooth_2.7\lib\EFR32MG1P\GCC\libmbedtls.a" "C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\protocol\bluetooth_2.7\lib\EFR32MG1P\GCC\libpsstore.a" "C:\Users\veda\SimplicityStudio\v4_workspace\soc-thunderboard-sense\protocol\bluetooth_2.7\lib\EFR32MG1P\GCC\binapploader.o" -lm -Wl,--end-group -Wl,--start-group -lgcc -lc -lnosys -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

	@echo 'Building hex file: soc-thunderboard-sense.hex'
	arm-none-eabi-objcopy -O ihex "soc-thunderboard-sense.axf" "soc-thunderboard-sense.hex"
	@echo ' '

	@echo 'Building bin file: soc-thunderboard-sense.bin'
	arm-none-eabi-objcopy -O binary "soc-thunderboard-sense.axf" "soc-thunderboard-sense.bin"
	@echo ' '

	@echo 'Building s37 file: soc-thunderboard-sense.s37'
	arm-none-eabi-objcopy -O srec "soc-thunderboard-sense.axf" "soc-thunderboard-sense.s37"
	@echo ' '

	@echo 'Running size tool'
	arm-none-eabi-size "soc-thunderboard-sense.axf"
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(C_DEPS) soc-thunderboard-sense.axf
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
