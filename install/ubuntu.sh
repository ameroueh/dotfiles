wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | sudo apt-key add -
echo "deb https://apt.thoughtbot.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list
sudo apt-get update
sudo apt-get install rcm

sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:neovim-ppa/stable -y
sudo apt-get update -y
sudo apt-get install neovim -y

pip install neovim
