# Techzaster UI Nougat
## Description about the ROM

Techzaster UI is a custom ROM based on LineageOS 14.1 [LineageOS](https://github.com/lineageos) featuring new functions and improvements.
It is designed to make your old device fast and modern with features such as the Techzaster UI Toolbox dark theme and custom launcher.
This custom rom was made with the best Out Of The Box in mind.

**Techzaster UI Nougat™ Made by PLmiki8**

# Credits
[vuki-devexe](https://github.com/vuki-devexe) For Tapzaster Game. <br>
[PLmiki8](https://github.com/PLmiki8) For creating this project. <br>
[Techzaster](https://github.com/techzaster1) For Inspiration. 

# Building Techzaster UI Nougat

Techzaster UI is LineageOS 14.1 with a set of patches (tested on Ubuntu 26.04 WSL)

## 1. Install required items and configure

    sudo apt update && sudo apt install -y git git-lfs curl zip unzip rsync bc bison flex gperf libssl-dev libncurses-dev lib32z1-dev openjdk-8-jdk && git lfs install
    git config --global user.name <name>
    git config --global user.email <email@emal.email>

## 2. Cloning Lineage OS and Techzaster UI source code

    mkdir ~/TechzasterUI && cd ~/TechzasterUI
    repo init -u https://github.com/LineageOS/android.git -b cm-14.1
    git clone https://github.com/PLmiki8/Techzaster-UI-Nougat.git ~/Techzaster-UI-Nougat
    mkdir -p .repo/local_manifests
    cp ~/Techzaster-UI-Nougat/manifest/local_manifests/*.xml .repo/local_manifests/
    repo sync -c -j$(nproc) --no-tags

## 3. Apply Techzaster UI patches for LineageOS source code

    ~/Techzaster-UI-Nougat/scripts/apply.sh
    
## 4. To Do Before Building

Python 2.7 is required: `pyenv install 2.7.18 && pyenv local 2.7.18` in the TechzasterUI folder

Paste this commands to fix other things:

    ln -sf jack-launcher.jar prebuilts/sdk/tools/launcher.jar; find kernel -name unifdef.c -path '*scripts*' -exec sed -i 's/\bconstexpr\b/constexpr_/g' {} +; grep -rl --include=Makefile -- '-Wno-error-implicit-function-declaration' kernel | xargs -r sed -i 's/-Wno-error-implicit-function-declaration/-Wno-error=implicit-function-declaration/'; find kernel -name 'dtc-lexer.lex.c_shipped' -exec sed -i 's/^YYLTYPE yylloc;/extern YYLTYPE yylloc;/' {} +; export JACK_EXTRA_CURL_OPTIONS="-k" ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4g"

## 5. Build

    source build/envsetup.sh
    lunch lineage_<codename>-userdebug
    export WITH_SU=true
    brunch <codename>

## 6. Enjoy Techzaster UI Nougat

In out/target/product/ is device folder with Techzaster UI zip to flash the ROM (needs custom recovery)







