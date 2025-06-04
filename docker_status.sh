#!/bin/bash

# === Functions ===

get_docker_status() {
  local status_output
  status_output=$(orb status 2>/dev/null)

  if echo "$status_output" | grep -qi "running"; then
    echo "running"
  else
    echo "stopped"
  fi
}

show_status() {
  local status
  status=$(get_docker_status)
  dialog --msgbox "Current Docker status: $status" 7 50
}

toggle_docker() {
  local status
  status=$(get_docker_status)
  if [[ "$status" == "running" ]]; then
    orb stop docker
    dialog --msgbox "Docker has been stopped." 7 50
  else
    orb start docker
    dialog --msgbox "Docker has been started." 7 50
  fi
}

list_running_containers() {
  local containers
  containers=$(docker ps --format "{{.Names}}")

  if [[ -z "$containers" ]]; then
    containers="No running containers."
  fi

  dialog --title "Running Containers" --msgbox "$containers" 15 50
}

# === Main Loop ===
while true; do
  CHOICE=$(dialog --clear --backtitle "Docker Manager" \
    --title "Docker Control Menu" \
    --menu "Choose an option:" 15 60 6 \
    1 "Show Docker Status" \
    2 "Toggle Docker (Start/Stop)" \
    3 "List Running Containers (docker ps)" \
    4 "Exit" \
    3>&1 1>&2 2>&3)

  exit_status=$?

  if [[ $exit_status != 0 ]]; then
    clear
    exit 0
  fi

  case $CHOICE in
    1) show_status ;;
    2) toggle_docker ;;
    3) list_running_containers ;;
    4) clear; exit 0 ;;
  esac
done