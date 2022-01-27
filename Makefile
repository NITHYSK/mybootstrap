AS	= nasm
ASFLAGS	= -f bin
SRC	= boot.asm
TARGET	= boot.bin
QEMU	= qemu-system-x86_64
QEMUFL	= -drive file=$(TARGET),format=raw,if=floppy

$(TARGET):	$(SRC)
	$(AS) $(ASFLAGS) -o $@ $<

test:	$(TARGET)
	$(QEMU) $(QEMUFL)

clean:
	rm $(TARGET)

.PHONY:	test clean
