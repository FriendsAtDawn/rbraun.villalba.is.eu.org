#!/usr/bin/env bash

# Script para generar index.html en cada carpeta de manera recursiva
# Uso: ./generar_indices.sh [directorio_raiz]

ROOT="${1:-.}"

find "$ROOT" -type d | while read -r dir; do
    echo "Generando índice en: $dir"

    {
        echo "<!DOCTYPE html>"
        echo "<html><head><meta charset='UTF-8'><title>Índice de $dir</title></head><body>"
        echo "<h2>Contenido de $dir</h2>"
        echo "<ul>"

        for f in "$dir"/*; do
            [ -e "$f" ] || continue
            base=$(basename "$f")

            # Saltar el index.html generado
            [ "$base" = "index.html" ] && continue

            if [ -d "$f" ]; then
                # Si es carpeta, link a su index.html
                echo "  <li>[📂] <a href=\"$base/index.html\">$base/</a></li>"
            else
                # Si es archivo normal
                echo "  <li>[📄] <a href=\"$base\">$base</a></li>"
            fi
        done

        echo "</ul>"
        echo "</body></html>"
    } > "$dir/index.html"
done
