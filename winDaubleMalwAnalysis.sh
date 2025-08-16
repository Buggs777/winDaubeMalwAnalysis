#!/bin/bash
EXE="$1"
if [[ -z "$EXE" ]]; then
    echo "Usage: $0 <executable>"
    exit 1
fi


cat << "EOF"
          _       ____              _          
__      _(_)_ __ |  _ \  __ _ _   _| |__   ___ 
\ \ /\ / / | '_ \| | | |/ _` | | | | '_ \ / _ \
 \ V  V /| | | | | |_| | (_| | |_| | |_) |  __/
  \_/\_/ |_|_| |_|____/ \__,_|\__,_|_.__/ \___|
                                               
    _                _           _     
   / \   _ __   __ _| |_   _ ___(_)___ 
  / _ \ | '_ \ / _` | | | | / __| / __|
 / ___ \| | | | (_| | | |_| \__ \ \__ \
/_/   \_\_| |_|\__,_|_|\__, |___/_|___/
                       |___/           

EOF

OUTDIR="${EXE}_analysis"
mkdir -p "$OUTDIR"

# Basic recon
# 1) capa 
echo -e "\n[1] Capa launched, please wait..."
capa "$EXE" | tee "$OUTDIR/capa.txt"
echo -e "\n[2] Hash"
echo ">> SHA256SUM <<"
sha256sum "$EXE" | tee "$OUTDIR/sha256.txt"
echo -e "\n>> MD5SUM <<"
md5sum "$EXE"     | tee "$OUTDIR/md5.txt"

##############
echo -e "\n[3] Quick infos"
rabin2 -I "$EXE" | tee "$OUTDIR/info.txt"
rabin2 -S "$EXE" > "$OUTDIR/sections.txt"
rabin2 -i "$EXE" > "$OUTDIR/imports.txt"
rabin2 -rs "$EXE" > "$OUTDIR/resources.txt"
rabin2 -E "$EXE" > "$OUTDIR/entrypoint.txt"

# 4) Encoded strings
echo -e "\n[4] Floss launched, please wait..."
floss -q "$EXE" > "$OUTDIR/floss.txt"


echo -e "\n\n[[ Analysis Over, find the ressources in the folder $OUTDIR ]]"
