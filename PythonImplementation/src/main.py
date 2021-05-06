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
    print(deg.shape)
    Bsize=B/size
    Gsize=G/size
    Rsize=R/size
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
                dR[x][y] = int(x-y)
                dB[x][y] = int(x+y)
                dG[x][y] = int(x-y)
    for y in range(size):
        for x in range(size):
            dR[x][y] = dR[x][y]*int(Rsize)
            dB[x][y] = dB[x][y]*int(Rsize)
            dG[x][y] = dG[x][y]*int(Rsize)
    return [dR,dG,dB]

def composicionAlfa(transparenciaDegradado, pixelesDegradado):
    imagen = cv2.imread("/home/skryfall/Projects/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/PythonImplementation/src/choco.png")
    pixelesImagen = imagen

    #degradado = cv2.imread("/home/skryfall/Projects/Degradado-Composicion/src/degradado.jpg")

    #pixelesDegradado = degradado

    resultado = np.zeros((200,200,3))

    a = (100-transparenciaDegradado)/100
    b = transparenciaDegradado/100
    for i in range(200):
        for j in range(200):
            resultado[i][j][0] = int(imagen[i][j][0]*a )
            resultado[i][j][0] = resultado[i][j][0] + int(degradado[i][j][0] * b)
            resultado[i][j][1] = int(imagen[i][j][1] * (1 - transparenciaDegradado) + degradado[i][j][1] * transparenciaDegradado)
            resultado[i][j][2] = int(imagen[i][j][2] * (1 - transparenciaDegradado) + degradado[i][j][2] * transparenciaDegradado)

    cv2.imwrite("/home/skryfall/Projects/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/PythonImplementation/src/deg.jpg", pixelesDegradado)
    cv2.imwrite("/home/skryfall/Projects/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/PythonImplementation/src/holi.jpg", resultado)

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

    if intensidadRojo != -1 or intensidadVerde != -1 or intensidadAzul != -1 or transparenciaDegradado != -1 or orientacion != "":
        degradado = generacionDegradado(intensidadRojo, intensidadVerde, intensidadAzul, orientacion, 200)
        composicionAlfa(transparenciaDegradado, degradado) 
    else:
        print("Inserte bien los argumentos >:v")
