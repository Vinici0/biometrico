"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const node_windows_2 = require("node-windows");
// Crea un nuevo objeto de servicio
const svc = new node_windows_2.Service({
    name: "Junta de Agua v2",
    description: "Junta de Agua v2",
    script: "C:\\Users\\VINICIO BORJA\\Desktop\\biometrico\\dist\\app.js", // Ruta al archivo compilado
});
// Escucha el evento "install", que indica que el proceso está disponible como servicio
svc.on("uninstall", () => {
    console.log("Encendido");
    svc.start();
});
// Instala el servicio
svc.uninstall();
