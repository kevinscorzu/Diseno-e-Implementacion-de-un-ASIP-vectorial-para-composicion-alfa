import numpy as np
import cv2

offset = 0
imagen = np.zeros((200, 200, 3))
for num in range(4):
    fileR = open(f"ROM_R{num}.txt", "r")
    fileG = open(f"ROM_G{num}.txt", "r")
    fileB = open(f"ROM_B{num}.txt", "r")
    for i in range(50):
        for j in range(200):
            lineR = fileR.readline()
            imagen[i + offset][j][0] = int(lineR, 16)
            lineG = fileG.readline()
            imagen[i + offset][j][1] = int(lineG, 16)
            lineB = fileB.readline()
            imagen[i + offset][j][2] = int(lineB, 16)
    offset += 50
    fileR.close()
    fileG.close()
    fileB.close()

cv2.imwrite("resultado.jpg", imagen)
print(imagen)