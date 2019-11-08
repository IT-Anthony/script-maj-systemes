#!/usr/bin/env bash

#author             :Mairien Anthony
#version            :1.0.5
#notes              :Mise à jour de dépôts, paquets, et système en vérifiant l'OS utilisé

# Initialisation des variables
os="None"

# On vérifie si le programme est lancé en root ou non
if [ $EUID -ne 0 ]; then
   echo "Woops, on dirait que tu n'es pas connecté en tant que root !"
   exit 1
fi

# Vérification de l'OS par la présence de certain fichier
if [ -e /etc/debian_version ]; then
    os=debian
elif [ -e /etc/fedora-release ]; then
    os=fedora
elif [ -e /etc/centos-release ]; then
    os=centos
elif [ -e /etc/arch-release ]; then
    os=arch
else
    echo "Woops, je n'arrive pas à détecter l'OS utilisé... Tu es sûr d'être sur une Debian/Fedora/CentOS/Archlinux ?"
    exit 1
fi

# Mise à jour des dépôts
if [ $os = debian ]; then
    echo "Mise à jour des dépôts en cours..."
    apt-get update -y
elif [ $os = fedora ]; then
    dnf update -y
    echo "Mise à jour des dépôts en cours..."
elif [ $os = centos ]; then
    dnf update -y
    echo "Mise à jour des dépôts en cours..."
elif [ $os = arch ]; then
    pacman -Syy
    echo "Mise à jour des dépôts en cours..."
fi

# Mise à jour des paquets
if [ $os = debian ]; then
    echo "Mise à jour des paquets en cours..."
    apt-get upgrade -y
elif [ $os = fedora ]; then
    dnf upgrade
    echo "Mise à jour des paquets en cours..."
elif [ $os = centos ]; then
    dnf upgrade
    echo "Mise à jour des paquets en cours..."
elif [ $os = arch ]; then
    pacman -Syu
    echo "Mise à jour des paquets en cours..."
fi
