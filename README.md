# NASM for gigachads

MMy assembler exam's practice.

## What is it?

This is NASM & TASM code samples & mekefile to build them.

```sh
# If you need to build your realmode "operating system":
make bin FILE=real/realmode.asm
# If you need to build and run it:
make bin run FILE=real/realmode.asm
# If you need to run only:
make run FILE=real/realmode.asm
# If you need to build, run and remove binary after executing:
make bin run clean FILE=real/realmode.asm


# And if you need to build your linux executable:
make elf FILE=linux/linux.asm
# The rest is similar to realmode build:
make elf run clean FILE=linux/linux.asm

# DOS works differently:
make dos FILE=dos/dos.asm
# Remember:
# 1. tasm.exe and tlink.exe must be in this folder
# 2. FILE must contain FAT-16 path from here
```

## Wtf?

TASM & DOS sucks.
