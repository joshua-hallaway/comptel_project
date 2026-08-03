1. Open **PowerShell** as administrator
2. Install a **Windows Subsystem for Linux** by running
```Powershell
wsl --install
```
3. Reboot System
4. Launch the **WSL** in **PowerShell** by running
```Powershell
ubuntu
```
5. Set **Ubuntu** username and password when prompted
6. Ensure system is up to date in **Ubuntu** by running
```Bash
sudo apt update
sudo apt upgrade -y
```
7. Install required development tool for GammaLib and ctools by running
```Bash
sudo apt install -y \
    build-essential \
    git \
    pkg-config \
    autoconf \
    automake \
    libtool \
    make \
    swig \
    python3-dev \
    libcfitsio-dev \
    libreadline-dev \
    libncurses-dev
```
8. Install **Miniconda** by running
```Bash
cd ~
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```
9. Reboot **Ubuntu** by running
```Bash
source ~/.bashrc
```
10. Verify it installed correctly by running
```Bash
conda --version
```
11. Create and enter a dedicated **conda** work environment by running
```Bash
conda create -n dSph-dark-matter python=3.10 -y
conda activate dSph-dark-matter
```
12. Connect **VS Code** to **Ubuntu** by running
```Bash
code .
```
13. Close **VS Code** and return to the **Ubuntu** terminal and make and enter a project folder by running
```Bash
mkdir ~/comptel_project
cd ~/comptel_project
```
14. Go to **GitHub** and make a new repository titled `comptel_project`
15. Return to the **Ubuntu** terminal and initialize **Git** by running
```Bash
git init
git remote add origin git@github.com:joshua-hallaway/comptel_project.git
```
