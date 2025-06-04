# Docker Menu Script (Bash + dialog)

This is a simple interactive Bash script that uses `dialog` to provide a terminal-based menu for managing Docker on macOS (via OrbStack or similar). It allows you to toggle Docker on/off, check its current status, and list running containers in a user-friendly interface.

---

## 🧰 Features

- Toggle Docker (start/stop) using `orb start docker` and `orb stop docker`
- Display current Docker status via `orb status`
- List names of currently running containers using `docker ps`
- Terminal-based graphical interface using `dialog`

---

## 📦 Prerequisites

Make sure you have the following installed:

- [OrbStack](https://orbstack.dev) or another tool that provides `orb` CLI
- Docker (managed by OrbStack)
- `dialog` package (for TUI interface)

To install `dialog`:

### RedHat / CentOS / Fedora

```bash
sudo dnf install dialog
# or
sudo yum install dialog
```

### Debian / Ubuntu

```bash
sudo apt install dialog
```

---

## 🚀 Usage

1. Make the script executable:

```bash
chmod +x docker_menu.sh
```

2. Run the script:

```bash
./docker_menu.sh
```

3. Use the arrow keys or numbers to select an option:

- **Toggle Docker (Start/Stop)** — Starts or stops Docker using `orb`
- **Show Docker Status** — Checks whether Docker is running
- **List Running Containers** — Shows names of currently running Docker containers
- **Exit** — Closes the menu

---

## 📝 Notes

- The script relies on the output format of `orb status` to include the string `docker: running`. If this differs in your setup, you may need to adjust the parsing logic in the `get_docker_status` function.
- It is intended for use with OrbStack or similar macOS setups. It may not work as expected on Linux unless `orb` is available and behaves similarly.

---

## 📄 License

This script is provided as-is, under the MIT license. Feel free to modify and reuse it.
