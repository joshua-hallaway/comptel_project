1. Complete the [[GammaLib Setup]]
2. Activate **conda** environment with
```Bash
conda activate dSph-dark-matter
```
3. Confirm prefix with
```Bash
echo $CONDA_PREFIX
```
4. Clone the **GitHub** repository with
```Bash
cd ~
git clone https://github.com/ctools/ctools.git
cd ctools
```
5. Generate **ctools** build system with
```Bash
./autogen.sh
```
6. Configure **ctools** with
```Bash
./configure --prefix=$CONDA_PREFIX
```
7. Built **ctools** with
```Bash
make -j$(nproc)
```
8. Ensure build passes all tests with
```Bash
make check
```
9. Install **ctools** to the **conda** environment with
```Bash
make install
```
10. Verify installation with
```Bash
python -c "import ctools; print(ctools.__version__)"
```
11. Check tools with
```Bash
which ctobssim
which ctlike
which ctmodel
```
