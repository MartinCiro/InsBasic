#!/bin/bash
TARBALL=$(wget -qO- https://github.com/argouml-tigris-org/argouml/releases/ | grep -oP 'VERSION_[0-9_]+' | sort -t_ -k2,2nr -k3,3nr -k4,4nr | head -n 1 | awk '{gsub(/VERSION_/,""); print "https://github.com/argouml-tigris-org/argouml/releases/download/VERSION_" $0 "/ArgoUML-" gensub(/_/,".","g") ".tar.gz"}')

validar() {
    nom=$1
    rut=$2
    if [ -d "$rut/$nom" ]; then
        echo "Actualmente cuenta con una versión instalada, se eliminará..."
        sudo rm -rf "$rut/$nom"
    fi
}

if [ "root" != "$(whoami)" ]; then
    echo "You must run this command as root" 1>&2
    exit 1
fi

set -x

#Download Argo github
wget -q $TARBALL

#save name in variable
	

#Elimino el nombre de la extension con sed
VERSION=$(echo $nm | sed 's/\.tar\.gz$//' | tr '[:upper:]' '[:lower:]')

#validar $VERSION /usr/local/
tar -xzf $nm -C /usr/local/

# Move and create a valid symlink
ln -s /usr/local/$VERSION/argouml.sh /usr/local/bin/argouml

# Desktop shortcut
SHORTCUT="[Desktop Entry]
Name=ArgoUML ${VERSION}
Exec=/usr/local/${VERSION}/argouml.sh
Icon=/usr/local/${VERSION}/icon/ArgoIcon128x128.png
Terminal=false
Type=Application
Encoding=UTF-8
Categories=Utility;Java;Development;UML"

echo $SHORTCUT > /usr/share/applications/$VERSION.desktop

rm -fr Argo*

set +x

echo "Finish!"
exit 0
