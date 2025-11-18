# server-stats.sh

Script en **Bash** para analizar estadísticas básicas de rendimiento en cualquier servidor Linux.  
Este script muestra información de CPU, memoria RAM, discos y procesos que consumen más recursos.

---

## 🔗 Proyecto
Repositorio: https://github.com/wezd1308/Scripts_bash/tree/main/server-stasts  

Página del proyecto: https://roadmap.sh/projects/server-stats

---

## 📌 Descripción
El script realiza las siguientes tareas:

1. Muestra el **uso total de CPU** utilizando `mpstat`.
2. Calcula y muestra el **porcentaje de memoria RAM usada**.
3. Lista el **uso de discos** (espacio usado y disponible).
4. Muestra los **5 procesos que más consumen CPU**.
5. Muestra los **5 procesos que más consumen memoria RAM**.

Cada sección está separada por una función de salto de línea para mejorar la legibilidad.

---

## 🚀 Requisitos
Antes de ejecutar el script, asegúrate de contar con:

- Bash
- `mpstat` (paquete `sysstat`)
- Comandos estándar: `free`, `df`, `ps`, `awk`

Instalación de sysstat:

```bash
sudo apt install sysstat
```

---

## 📂 Uso

1. Clona este repositorio:

```bash
git clone https://github.com/wezd1308/Scripts_bash.git
cd server-stasts
```

2. Da permisos de ejecución al script:

```bash
chmod +x server-stats.sh
```

3. Ejecuta el script:

```bash
./server-stats.sh
```

---

## 🧠 ¿Qué hace cada parte del script?

### 🖥️ Uso de CPU
```bash
mpstat -P ALL | head -n 4
```
Obtiene estadísticas de uso de CPU por núcleo.

---

### 🧵 Función de salto de línea
Función usada para separar secciones y mejorar la legibilidad.

---

### 🧠 Uso de memoria
Se obtiene la memoria total y usada, y se calcula el porcentaje:

```bash
porcentaje=$(( usada * 100 / total ))
```

---

### 💾 Uso de disco
```bash
df -h | grep -E '^Filesystem|^/dev/sd*'
```
Muestra particiones principales y su uso.

---

### 🔥 Top 5 procesos por CPU
```bash
ps -Ao user,uid,comm,pid,pcpu,tty --sort=-pcpu | head -n 6
```

---

### 🧩 Top 5 procesos por memoria
```bash
ps aux --width 30 --sort -rss | head -6
```

---




