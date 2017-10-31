TARGET = example8080

all: $(TARGET).rkr

emu: $(TARGET).rkr
	wine emu/emu.exe $(TARGET).rkr

clean:
	rm -f $(TARGET).bin $(TARGET).rkr $(TARGET).lst makerk

makerk: makerk.c

%.rkr: %.bin makerk
	./makerk 0x100 "$<" "$@"

%.bin: %.asm
	wine tasm.exe -gb -b -85 "$<" "$@"
