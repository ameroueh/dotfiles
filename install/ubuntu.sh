echo "Installing rcm..."
wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | sudo apt-key add -
echo "deb https://apt.thoughtbot.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list
sudo apt-get update
sudo apt-get install rcm

if [ -z $( command -v nvim ) ]; 
then
	echo "Installing neovim..."
	sudo apt-get install software-properties-common -y
	sudo apt-add-repository ppa:neovim-ppa/stable -y
	sudo apt-get update -y
	sudo apt-get install neovim -y
fi

pip install neovim
pip install flake8
pip install black
