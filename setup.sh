#!/bin/bash

echo "🔮 Iniciando instalación ceremonial del bot cazador..."

# Verificar entorno
if [ -n "$PREFIX" ]; then
    echo "🧪 Entorno detectado: Termux"
    pkg update && pkg install -y git python
elif [ "$(uname)" = "Linux" ]; then
    echo "🧪 Entorno detectado: Linux (WSL/VPS)"
    sudo apt update && sudo apt install -y git python3 python3-pip
else
    echo "⚠️ Entorno no reconocido. Ritual abortado."
    exit 1
fi

# Clonar repositorio
echo "📦 Clonando botscaza desde GitHub..."
git clone https://github.com/Mikeslpmex/botscaza.git
cd botscaza || { echo "❌ Fallo al entrar al directorio botscaza"; exit 1; }

# Instalar dependencias
echo "🔧 Instalando dependencias..."
pip install -r requirements.txt || pip3 install -r requirements.txt

# Activar bot cazador
echo "🎯 Activando bot cazador..."
python bot.py || python3 bot.py

echo "✅ Instalación completada. El cazador está despierto."
