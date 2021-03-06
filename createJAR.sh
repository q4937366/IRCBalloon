version=$1
swt_version="4.3"

rm -rvf bin/ &&
rm -rvf lib/swt* &&
mkdir bin &&

# Create JAR for Linux 64bit
cp swt/swt-$swt_version-gtk-linux-x86_64.jar lib/swt.jar &&
sbt clean compile msgfmt assembly &&
cp target/scala-2.10/IRCBalloon-assembly-$version.jar bin/IRCBalloon-linux64-$version.jar &&

# Create JAR for Windows 64bit
cp swt/swt-$swt_version-win32-win32-x86_64.jar lib/swt.jar &&
sbt clean compile msgfmt assembly &&
cp target/scala-2.10/IRCBalloon-assembly-$version.jar bin/IRCBalloon-win64-$version.jar &&

# Create JAR for Windows 32bit
cp swt/swt-$swt_version-win32-win32-x86.jar lib/swt.jar &&
sbt clean compile msgfmt assembly &&
cp target/scala-2.10/IRCBalloon-assembly-$version.jar bin/IRCBalloon-win32-$version.jar &&

# Swtich to default SWT jar
rm -rvf lib/swt* &&
cp swt/swt-$swt_version-gtk-linux-x86_64.jar lib/swt.jar
