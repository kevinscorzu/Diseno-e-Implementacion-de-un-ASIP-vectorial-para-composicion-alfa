# print(len("11 01 0 000000000000000000 1010 1010"))
# print(len("000000000000000000"))


num = "111111111111111111111110001"


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


def shiftNumber(num, shift):
    largo = len(num)
    if (largo < shift):
        while largo < shift:
            num = '0' + num
            largo += 1
        return num
    else:
        return num

print(complementoADos(num))