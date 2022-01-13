AS	= nasm
ASFLAGS	= -f bin
SRC	= boot.asm
TARGET	= boot.bin
QEMU	= qemu-system-x86_64

$(TARGET):	$(SRC)
	$(AS) $(ASFLAGS) -o $@ $<

test:	$(TARGET)
	$(QEMU) $<

clean:
	rm $(TARGET)

.PHONY:	test clean
