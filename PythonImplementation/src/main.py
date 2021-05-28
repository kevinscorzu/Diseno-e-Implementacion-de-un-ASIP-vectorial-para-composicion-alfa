import sys
from PIL import Image
import numpy as np
import time
import cv2
import matplotlib.pyplot as plt


def generacionDegradado(R,G,B,pos,size):
    R = R*255/100
    G = G*255/100
    B = B*255/100
    #R porcentaje de rojo
    #G porcentaje de verde
    #B porcentaje de azul
    dR = np.zeros((size,size))
    dG = np.zeros((size,size))
    dB = np.zeros((size,size))

    if(pos=="v"): #horizontal
        for y in range(size):
            for x in range(size):
                dR[x][y] = int(x)
                dB[x][y] = int(x)
                dG[x][y] = int(x)
    if(pos=="h"): #vertical
        for y in range(size):
            for x in range(size):
                dR[x][y] = int(y)
                dB[x][y] = int(y)
                dG[x][y] = int(y)
    if(pos=="d"):#angular
        for y in range(size):
            for x in range(size):
                dR[x][y] = int(x+y)
                dB[x][y] = int(x+y)
                dG[x][y] = int(x+y)
    if(pos=="p"):
        for y in range(size):
            for x in range(size):
                dR[x][y] = int(y)
                dB[x][y] = int(x)
                dG[x][y] = int(x+y)

    deg = np.zeros((200, 200, 3))
    for y in range(size):
        for x in range(size):
            deg[x][y][0] = int(dB[x][y] * B / size)
            deg[x][y][1] = int(dB[x][y] * G / size)
            deg[x][y][2] = int(dR[x][y] * R / size)
            if x == 199 and y == 2:
                print(deg[x][y][0])
                print(deg[x][y][1])
                print(deg[x][y][2])

    return deg


def composicionAlfa(transparenciaDegradado, pixelesDegradado):
    imagen = cv2.imread("puppies.jpg")
    resultado = np.zeros((200, 200, 3))
    print(np.shape(degradado))
    print(np.shape(imagen))
    a = (100 - transparenciaDegradado)
    b = transparenciaDegradado
    for i in range(200):
        for j in range(200):
            resultado[i][j][0] = int((imagen[i][j][0] * a + degradado[i][j][0] * b) / 100)
            resultado[i][j][1] = int((imagen[i][j][1] * a + degradado[i][j][1] * b) / 100)
            resultado[i][j][2] = int((imagen[i][j][2] * a + degradado[i][j][2] * b) / 100)
            # print(resultado[i][j][2])

    cv2.imwrite("deg.jpg", pixelesDegradado)
    cv2.imwrite("holi.jpg", resultado)

    offset = 0
    for num in range(4):
        print(num)
        fileR = open(f"ROM_R{num}.txt", "w")
        fileG = open(f"ROM_G{num}.txt", "w")
        fileB = open(f"ROM_B{num}.txt", "w")
        for i in range(50):
            for j in range(200):
                r = hex(imagen[i + offset][j][0])[2:] if len(hex(imagen[i + offset][j][0])[2:]) == 2 \
                    else ("0" + hex(imagen[i + offset][j][0])[2:])
                fileB.write(f"{r}\n")
                g = hex(imagen[i + offset][j][1])[2:] if len(hex(imagen[i + offset][j][1])[2:]) == 2 \
                    else ("0" + hex(imagen[i + offset][j][1])[2:])
                fileG.write(f"{g}\n")
                b = hex(imagen[i + offset][j][2])[2:] if len(hex(imagen[i + offset][j][2])[2:]) == 2 \
                    else ("0" + hex(imagen[i + offset][j][2])[2:])
                fileR.write(f"{b}\n")
        offset += 50
        fileR.close()
        fileG.close()
        fileB.close()


if __name__ == "__main__":
    intensidadRojo = -1
    intensidadVerde = -1
    intensidadAzul = -1
    transparenciaDegradado = -1
    orientacion = ""

    for i in range(len(sys.argv)):
        if sys.argv[i] == "-ir":
            intensidadRojo = float(sys.argv[i + 1])
        if sys.argv[i] == "-iv":
            intensidadVerde = float(sys.argv[i + 1])
        if sys.argv[i] == "-ia":
            intensidadAzul = float(sys.argv[i + 1])
        if sys.argv[i] == "-td":
            transparenciaDegradado = float(sys.argv[i + 1])
        if sys.argv[i] == "-o":
            orientacion = sys.argv[i + 1]
    print(intensidadRojo, intensidadVerde, intensidadAzul, orientacion)
    if intensidadRojo != -1 or intensidadVerde != -1 or intensidadAzul != -1 or transparenciaDegradado != -1 or orientacion != "":
        degradado = generacionDegradado(intensidadRojo, intensidadVerde, intensidadAzul, orientacion, 200)
        composicionAlfa(transparenciaDegradado, degradado) 
    else:
        print("Inserte bien los argumentos >:v")
