import sys, subprocess
from flask import Flask, request, jsonify
import json

app = Flask(__name__)

locJSON = sys.argv[1]
nombreJSON = sys.argv[2]
locResultado = sys.argv[3]

comandoR = 'Rscript "D:/Datos de Usuario/rgamezv/Downloads/prueba/prueba.R" "{}" "{}" "{}"'.format(locJSON, nombreJSON, locResultado)

@app.route("/calcularResultado", methods = ["POST"])
def calcularResultado():
    requestJSON = request.get_json(force = True)
    with open("miRequest.json", "w", encoding= "utf8") as file:
        json.dump(requestJSON, file)
    subprocess.run(comandoR)
    dirResultado = '{}/resultado.json'.format(locResultado)
    with open(dirResultado, "r") as file:
        resultado = json.load(file)
    return jsonify(resultado)

if __name__ == "__main__":
    app.run(debug= True)