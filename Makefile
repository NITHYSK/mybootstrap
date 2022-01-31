OVMF	= ~/ovmf/OVMF.fd
FILESYS	= fs
QEMU	= qemu-system-x86_64
QEMUFL	= -bios $(OVMF) -drive file=fat:rw:fs,media=disk,format=raw
CC	= x86_64-w64-mingw32-gcc
CFLAGS	= -Wall -Wextra -e efi_main -nostdinc -nostdlib -fno-builtin -Wl,--subsystem,10
TARGET	= main.efi
SRC	= main.c

$(TARGET):	$(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

test:	$(TARGET)
	rm -r fs
	mkdir -p fs/EFI/BOOT
	cp $(TARGET) fs/EFI/BOOT/BOOTX64.EFI
	$(QEMU) $(QEMUFL)

clean:
	rm $(TARGET)

.PHONY:	test clean
