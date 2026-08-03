1. Complete the [[Ubuntu Setup]]
2. Inside of the **Ubuntu** terminal activate the **conda** environment with
```Bash
conda activate dSph-dark-matter
```
3. Confirm **conda** prefix with
```Bash
echo $CONDA_PREFIX
```
3. Clone **GammaLib** from **GitHub** with
```Bash
cd ~
git clone https://github.com/gammalib/gammalib.git
cd gammalib
```
4. Generate the build with
```Bash
./autogen.sh
```
5. Configure **GammaLib** with
```Bash
./configure --prefix=$CONDA_PREFIX
```
6. Build **GammaLib** with
```Bash
make -j$(nproc)
```
7. Ensure build finished and passed all 22 tests with
```Bash
make check
```
8. Install **GammaLib** to **conda** environment with
```Bash
make install
```
9. Verify install with
```Bash
python -c "import gammalib; print(gammalib.__version__)"
```
