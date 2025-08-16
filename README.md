# winDaubeMalwAnalysis

`winDaubeMalwAnalysis` is a simple yet effective **Windows malware static analysis script** written in Bash.  
It automates the initial triage of suspicious executables by extracting hashes, binary metadata, strings, imports, resources, and capabilities.  

---

## Features

- [x] Compute file **hashes** (SHA256, MD5)  
- [x] Extract quick info with **rabin2**:
  - Sections  
  - Imports  
  - Resources  
  - Entrypoint  
- [x] Analyze **decoded/obfuscated strings** with [FLOSS](https://github.com/mandiant/flare-floss)  
- [x] Detect malware **capabilities** with [CAPA](https://github.com/mandiant/capa)  
- [x] Save all results in a dedicated folder `<sample>_analysis`  

---

## Dependencies

The script requires the following tools:  

- [`sha256sum`](https://www.gnu.org/software/coreutils/) (coreutils)  
- [`md5sum`](https://www.gnu.org/software/coreutils/) (coreutils)  
- [`rabin2`](https://rizin.re/) (part of **rizin** / **radare2**)  
- [`floss`](https://github.com/mandiant/flare-floss)  
- [`capa`](https://github.com/mandiant/capa)  

### Quick install (Debian/Ubuntu)

```bash
sudo apt update
sudo apt install -y coreutils radare2 python3-pip
```

#### Install FLOSS (prebuilt release)

Instead of building FLOSS from source or using pip, just download the latest precompiled binary:

Go to FLOSS releases

Download the latest floss-vX.Y.Z-linux binary

Make it executable and put it in your $PATH:

## Example
```bash
wget https://github.com/mandiant/flare-floss/releases/download/v3.1.1/floss-v3.1.1-linux -O floss
chmod +x floss
sudo mv floss /usr/local/bin/
```

### Usage
```bash
$ ./winDaubeMalwAnalysis malware.exe

[1] Hashes
sha256sum
d2a3b4e8...  malware.exe
md5sum
1a2b3c4d...  malware.exe

[2] Quick infos
arch     x86
bits     32
class    PE32
...

[+] Analysis complete.
Results available in: malware.exe_analysis
```

## Disclaimer

This tool is provided **for educational and research purposes only**.  
Do **NOT** run malware samples on your host machine without a sandbox, VM, or other isolation.  


## License

MIT License – free to use and modify with attribution.
