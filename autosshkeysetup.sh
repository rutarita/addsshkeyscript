#!/bin/bash

read -r -p "Enter your email adress" email
read -r -p "Enter your name" name

echo "Use default location for the key!!"

ssh-keygen -t rsa -b 4096 -C "$email"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_rsa

cat ~/.ssh/id_rsa.pub

read -r -p "Press enter when you added this key to your remote git repository"

git config --global user.name "$name"
git config --global user.email "$email"
