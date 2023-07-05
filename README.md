# Digital processor

Using VHDL program language, this project specifies the behavior of a seven instructions digital processor, listed bellow:

|   Instruction   |              Meaning           | opcode |
| ----------------| -------------------------------| ------ |
| MOV Ra, d       | RF[a] = D[d]                   |  0000  |
| MOV d, RA       | D[d] = RF[a]                   |  0001  |
| ADD Ra, Rb, Rc  | RF[a] = RF[b] + RF[c]          |  0010  |
| MOV Ra, #C      | RF[a] = c                      |  0011  |
| SUB Ra, Rb, Rc  | RF[a] = RF[b] - RF[c]          |  0100  |
| JMPZ Ra, offset | PC = PC + offset if RF[a] = 0  |  0101  |
| JGT Ra, Rb, Rc  | PC = RF[C] if RF[a] > RF[b]    |  0111  |

