from KiliASMSintax import KiliASMSintacticAnalizer
from KiliASMLexer import KILIASMLexicalAnalizer
import codecs

escalarRegisterNumber = {
    'R1': '0001',
    'R2': '0010',
    'R3': '0011',
    'R4': '0100',
    'R5': '0101',
    'R6': '0110',
    'R7': '0111',
    'R8': '1000',
    'R9': '1001',
    'R10': '1010',
    'R11': '1011',
    'R12': '1100',
    'R13': '1101',
    'R14': '1110',
    'R15': '1111'

}

vectorialRegisterNumber = {
    'V0': '0000',
    'V1': '0001',
    'V2': '0010',
    'V3': '0011',
    'V4': '0100',
    'V5': '0101',
    'V6': '0110',
    'V7': '0111',


}

DI = {'STR': int('11'+'00'+'01', 2),
      'LDR': int('11'+'01'+'00', 2),
      'MOVR': int('11'+'10'+'00', 2),
      'CMPR': int('11'+'11'+'00', 2),
      'STRV': int('11'+'00'+'11', 2),
      'LDRV': int('11'+'01'+'10', 2),
      }

DT = {'ADD': int('10'+'00'+'00', 2),
      'SUB': int('10'+'01'+'00', 2),
      'MUL': int('10'+'10'+'00', 2),
      'DIV': int('10'+'11'+'00', 2),
      'ADDVV': int('10'+'00'+'10', 2),
      'SUBVV': int('10'+'01'+'10', 2),
      'MULVE': int('10'+'10'+'10', 2),
      'DIVVE': int('10'+'11'+'10', 2),
      }

I = {'MOVI': int('01'+'00'+'00', 2),
      'CMPI': int('01'+'01'+'00', 2)}


N = {'JMP': int('00'+'00'+'00', 2),
     'JEQ': int('00'+'01'+'00', 2),
     'STL': int('00'+'10'+'00', 2)}



stallInst = {'ESP': int('01000', 2)}
bitsBasura18 = '000000000000000000'
bitsBasura14 = '00000000000000'
bitsBasura4 = '0000'

jumpLabels = {}

hexInstructions = []
binInstructions = []

def compile(codigo):
    KILIASMLexicalAnalizer(codigo)

    sintaxResult = KiliASMSintacticAnalizer(codigo)

    print(sintaxResult)

    dir = 0
    for statement in sintaxResult:
        if type(statement) == type(tuple()):  # Si es una tupla significa que es una instruccion norma
            dir += 1
        else:
            jumpLabels.update({statement: hex(dir)})

    hexDirection = []
    instruction = []


    dir = 0
    for statement in sintaxResult:
        if type(statement) == type(tuple()):  # Si es una tupla significa que es una instruccion normal
            hexDirection.append(hex(dir))

            instruction.append(statement)
            analiceInst(statement, hex(dir))
            dir += 1


        else:

            pass
    print(hexInstructions)
    print(binInstructions)
    with open('./OutputFiles/outputFile.txt', 'w') as f:
        for item in hexInstructions:
            f.write("%s\n" % item[2:])


def analiceInst(inst, pc):
    binCode = ''
    labelInstruccion = str(inst[0])
    if labelInstruccion in DI:
        binCode += str(format(DI.get(inst[0]), '#010b'))[4:]

        operando1 = str(inst[1])
        operando2 = str(inst[2])
        if operando1 in escalarRegisterNumber and operando2 in escalarRegisterNumber:
            binCode += bitsBasura18
            binCode += escalarRegisterNumber.get(operando1) + escalarRegisterNumber.get(operando2)


        elif operando1 in vectorialRegisterNumber and operando2 in vectorialRegisterNumber:
            binCode += bitsBasura18
            binCode += vectorialRegisterNumber.get(operando1) + vectorialRegisterNumber.get(operando2)
        else:
            print('El registro ' + operando1 + " o " + operando2 +' no existe')
            return

    elif labelInstruccion in I:
        binCode += str(format(I.get(inst[0]), '#010b'))[4:]
        operando1 = str(inst[1])

        operando2 = inst[2]
        if operando1 in escalarRegisterNumber and isinstance(operando2, int):
            imm = shiftNumber(str(bin(operando2))[2:], 22)
            binCode += imm + escalarRegisterNumber.get(operando1)
        else:
            if not operando1 in escalarRegisterNumber:
                print("El registro "+operando1+" no existe")
                return
            else:
                print("EL inmediato: "+str(operando2)+" es invalido")
                return
    elif labelInstruccion in DT:
        binCode += str(format(DT.get(inst[0]), '#010b'))[4:]
        operando1 = str(inst[1])
        operando2 = str(inst[2])
        operando3 = str(inst[3])
        if operando1 in escalarRegisterNumber and operando2 in escalarRegisterNumber and operando3 in escalarRegisterNumber:
            binCode += bitsBasura14
            binCode += escalarRegisterNumber.get(operando1) + escalarRegisterNumber.get(operando2) + escalarRegisterNumber.get(operando3)
        elif operando1 in vectorialRegisterNumber and operando2 in vectorialRegisterNumber and operando3 in vectorialRegisterNumber:
            binCode += bitsBasura14
            binCode += vectorialRegisterNumber.get(operando1) + vectorialRegisterNumber.get(
                operando2) + vectorialRegisterNumber.get(operando3)
        else:
            print('Los registros ingresados son invalidos')
            return

    elif labelInstruccion in N:
        binCode += str(format(N.get(inst[0]), '#010b'))[4:]
        operando1 = inst[1]
        if operando1 in jumpLabels:
            jumpDir = jumpLabels.get(inst[1])
            pcmenosjmpAdd = int(jumpDir, 16) - int(pc, 16)

            print(pcmenosjmpAdd)

            if (pcmenosjmpAdd < 0):

                pcmenosjmpAdd = bin(abs(pcmenosjmpAdd))[4:]

                complemento = complementoADos(pcmenosjmpAdd)
                binCode += complemento



            else:

                pcmenosjmpAdd = bin(pcmenosjmpAdd)[2:]
                binCode += str(shiftNumber(pcmenosjmpAdd, 27))
        elif(operando1 != "SLT"):
            print("Se va a hacer un stall")
        else:
            print('La etiqueta a la que quiere saltar no existe' + str(operando1))
    else:
        print("La instruccion : " + labelInstruccion+" no se encuentra en los diccionarios")
        return
    binInstructions.append(binCode)


    binCodeTemp = int(binCode, 2)
    hexCode = hex(binCodeTemp)
    lenHexCode = len(hexCode)
    if lenHexCode != 10:
            hexCode = hexCode[2:]
            while lenHexCode < 10:
                hexCode = '0' + hexCode
                lenHexCode += 1
            hexCode = '0x' + hexCode
    hexInstructions.append(hexCode + str(inst) + ' - ' + binCode + ' - ' +str(len(binCode)))









def shiftNumber(num, shift):
    largo = len(num)
    if (largo < shift):
        while largo < shift:
            num = '0' + num
            largo += 1
        return num
    else:
        return num

def complementoADos(num):

    num = shiftNumber(num, 27)
    num = num[::-1]
    num  = list(num)

    unoEncontrado = False
    i = 0
    while i != len(num):
        if num[i] == '1':
            if unoEncontrado == False:
                unoEncontrado = True
                i += 1
            else:
                num[i] = '0'
                i += 1
        elif num[i] == '0':
            if unoEncontrado == False:
                i += 1

            else:
                num[i] = '1'
                i += 1
        else:
            print('El numero no es binario')

    num = "".join(num)[::-1]

    return num


# def getRegNumber(inst):


test = 'code'
fp = codecs.open(test, "r", "utf-8")
cadena = fp.read()
fp.close()

# print(int('010',2))

compile(cadena)