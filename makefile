#FILE ?=
NAME ?=
OBJ_FILE ?=
OUT_FILE ?=
QEMU_NEEDLE=false
SHELL=/bin/bash

check:
	@if [ -z "$(FILE)" ]; then echo "Ошибка: Укажите файл через FILE=..."; exit 1; fi
	$(eval NAME=$(basename $(FILE)))

elf: check
	$(eval OBJ_FILE=$(basename $(NAME)).o)
	$(eval OUT_FILE=$(basename $(NAME)).elf)
	nasm -f elf64 $(FILE) -o $(OBJ_FILE)
	gcc $(OBJ_FILE) -static -g -o $(OUT_FILE)
	chmod +x $(OUT_FILE)

bin: check
	$(eval OUT_FILE=$(basename $(NAME)).bin)
	$(eval QEMU_NEEDLE=true)
	nasm -f bin $(FILE) -o $(OUT_FILE)

dos: check
	cp $(FILE) ./build.asm
	@dosbox -c $$'mount C: .\nC:\nmake build'
	rm build.asm *.obj *.OBJ *.map *.MAP *.EXE


run:
	@if [ "$(QEMU_NEEDLE)" = true ]; then \
		qemu-system-i386 $(OUT_FILE) -monitor stdio; \
	else \
		./$(OUT_FILE); \
		echo ""; \
	fi

clean:
	rm $(OBJ_FILE) $(OUT_FILE)
