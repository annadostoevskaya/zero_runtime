; start.asm
global _start
extern main
section main
section     .text
_start:     mov     ecx, [esp]      ; argc in ecx
            mov     eax, esp
            add     eax, 4          ; argv in eax
            push    eax
            push    ecx
            call    main
            add     esp, 8          ; clean the stack
            mov     ebx, eax        ; now call _exit
            mov     eax, 1
            int     80h
