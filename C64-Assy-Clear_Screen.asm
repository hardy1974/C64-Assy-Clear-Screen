;Code for clearing the screen, if 'gameinplay' is set to '1' then top row is ignored

gameinplay = $0650

clrscr                                                  ;Clear screen routine
                    ldx            #$00
clearscn
                    lda            #$20					        ;Load 'Space' character into Accumulator
                    ldy            gameinplay		    		;Load value of 'gameinplay' into Y Register
                    cpy            #$01				    	    ;Is 'gameinplay' set to '1'?
                    bne            clrall				        ;If not, jump to clrall
                    sta            $0428,x				      ;If it is, begin the clear screen on row 2
                    jmp            contclr
clrall              sta            $0400,x
contclr             sta            $0500,x
                    sta            $0600,x
                    sta            $0700,x
                    inx
                    bne            clearscn
                    ldx            #$00
                    rts
