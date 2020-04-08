import sys, subprocess

locJSON = sys.argv[1]
nombreJSON = sys.argv[2]
locResultado = sys.argv[3]

comandoR = 'Rscript "D:/Datos de Usuario/rgamezv/Downloads/prueba/prueba.R" "{}" "{}" "{}"'.format(locJSON, nombreJSON, locResultado)

def main():
    print(comandoR)
    subprocess.run(comandoR)

if __name__ == '__main__':
    main()