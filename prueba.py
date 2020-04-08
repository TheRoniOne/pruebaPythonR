import sys, subprocess


locCSV = "D:/Datos de Usuario/rgamezv/Downloads/prueba"
nombreCSV = "telecom.csv"
locResultado = "D:/Datos de Usuario/rgamezv/Downloads/resultadoPrueba"

comandoR = 'Rscript "D:/Datos de Usuario/rgamezv/Downloads/prueba/prueba.R" "{}" "{}" "{}"'.format(locCSV, nombreCSV, locResultado)

def main():
    print(comandoR)
    subprocess.run(comandoR)

if __name__ == '__main__':
    main()