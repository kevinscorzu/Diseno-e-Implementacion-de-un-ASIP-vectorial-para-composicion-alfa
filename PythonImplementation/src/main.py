import sys
from PIL import Image
import numpy as np
import time
import cv2
import matplotlib.pyplot as plt

def generacionDegradado(R,G,B,pos,size):
    R = R*255
    G = G*255
    B = B*255
    #R porcentaje de rojo
    #G porcentaje de verde
    #B porcentaje de azul
    deg = np.zeros((size,size,3))
    print(deg.shape)
    if(pos=="v"): #horizontal
        for y in range(size):
            for x in range(size):
                deg[x][y][0] = int(x/size*B)
                deg[x][y][1] = int(x/size*G)
                deg[x][y][2] = int(x/size*R)
    if(pos=="h"): #vertical
        for y in range(size):
            for x in range(size):
                deg[x][y][0] = int(y/size*B)
                deg[x][y][1] = int(y/size*G)
                deg[x][y][2] = int(y/size*R)
    if(pos=="d"):#angular
        for y in range(size):
            for x in range(size):
                deg[x][y][0] = int(x/size*B+y/size*B)
                deg[x][y][1] = int(x/size*G+y/size*G)
                deg[x][y][2] = int(x/size*R+y/size*R)
    if(pos=="p"):
        for y in range(size):
            for x in range(size):
                deg[x][y][0] = int(x/size*B-y/size*B)
                deg[x][y][1] = int(x/size*G+y/size*G)
                deg[x][y][2] = int(x/size*R-y/size*R)

    return deg

def composicionAlfa(transparenciaDegradado, pixelesDegradado):
    imagen = cv2.imread("/home/skryfall/Projects/Diseno-e-Implementacion-de-un-ASIP-vectorial-para-composicion-alfa/PythonImplementation/src/choco.png")
    pixelesImagen = imagen

    #degradado = cv2.imread("/home/skryfall/Projects/Degradado-Composicion/src/degradado.jpg")

    #pixelesDegradado = degradado

    resultado = np.zeros((200,200,3))

    for i in range(200):
        for j in range(200):
            resultado[i][j][0] = int(imagen[i][j][0] * (1 - transparenciaDegradado) + degradado[i][j][0] * transparenciaDegradado)
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
