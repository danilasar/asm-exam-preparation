# NASM for gigachads

Gigachad version of assembler exam's practice.

## What is it?

This is NASM code samples & mekefile to build them.

```sh
# If you need to build your realmode "operating system":
make bin FILE=realmode.asm
# If you need to build and run it:
make bin run FILE=realmode.asm
# If you need to run only:
make run FILE=realmode.asm
# If you need to build, run and remove binary after executing:
make bin run clean FILE=realmode.asm


# And if you need to build your linux executable:
make elf FILE=linux.asm
# The rest is similar to realmode build:
make elf run clean FILE=linux.asm
```

## Wtf?

TASM & DOS sucks.
