import numpy as np
import cv2
import tkinter as tk
from tkinter import *
from PIL import ImageTk, Image

imagen = np.zeros((200, 200, 3))

fileR = open(f"outputR.txt", "r")
fileG = open(f"outputG.txt", "r")
fileB = open(f"outputB.txt", "r")

for i in range(200):
    for j in range(200):
        lineR = fileR.readline()
        lineG = fileG.readline()
        lineB = fileB.readline()

        imagen[i][j][0] = int(lineB, 16)
        imagen[i][j][1] = int(lineG, 16)
        imagen[i][j][2] = int(lineR, 16)

fileR.close()
fileG.close()
fileB.close()

cv2.imwrite("resultado.jpg", imagen)


class Window1(Frame):
    def __init__(self, master):
        self.master = master
        self.new_window()
        Frame.__init__(self, master)
        self.master = master
        self.pack(fill=BOTH, expand=1)

        load = Image.open("./puppies.jpg")
        render = ImageTk.PhotoImage(load)
        img = Label(self, image=render)
        img.image = render
        img.place(x=0, y=0)

    def new_window(self):
        self.newWindow = tk.Toplevel(self.master)
        self.app = Window2(self.newWindow)


class Window2(Frame):
    def __init__(self, master):
        self.master = master
        self.master.geometry("205x205")
        self.master.title('Despues')
        Frame.__init__(self, master)

        self.pack(fill=BOTH, expand=1)

        load = Image.open("./resultado.jpg")
        render = ImageTk.PhotoImage(load)
        img = Label(self, image=render)
        img.image = render
        img.place(x=0, y=0)


def main():
    root = tk.Tk()
    app = Window1(root)
    root.wm_title("Antes")
    root.geometry("205x205")
    root.mainloop()


main()
