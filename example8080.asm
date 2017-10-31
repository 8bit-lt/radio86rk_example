.org 100h
main:
        ; Очистка экрана
        mvi c, 01Fh
        call 0F809h

        ; Вывод текста "Нажмите любую клавишу"
        lxi h, a_navmite
        call 0F818h

loop:
        ; Ожидание нажатия клавиши и сохранение её в пееменную pressed_key
        call 0F803h
        sta pressed_key

        ; Вывод текста "Вы нажали"
        lxi h, a_wy_navali
        call 0F818h

        ; Вывод переменной pressed_key в 16 ричном виде
        lda pressed_key
        call 0F815h

        ; Перевод строки
        lxi h, a_eol
        call 0F818h

        ; Переход на метку loop
        jmp loop

pressed_key: .db 0

a_navmite: .db "navmite lybu` klawi{u",13,10,0

a_wy_navali: .db "wy navali ",0

a_eol: .db 13,10,0

.end
