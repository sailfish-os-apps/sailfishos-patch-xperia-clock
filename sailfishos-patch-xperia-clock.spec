Name:          sailfishos-patch-xperia-clock
Version:       0.2
Release:       2
Summary:       Xperia clock
Group:         System/Tools
Vendor:        fravaccaro
Distribution:  SailfishOS
Requires:      sailfish-version >= 2.0.5, patchmanager
Packager: fravaccaro <fravaccaro@jollacommunity.it>
URL:           www.jollacommunity.it
License:       GPL

%description
Enable Xperia-like clock in the lockscreen.

%files
%defattr(-,root,root,-)
/usr/share/*

%preun
patchmanager -u sailfishos-xperia-clock
patchmanager -u sailfishos-xperia-clock-12

%postun
if [ $1 = 0 ]; then
    // Do stuff specific to uninstalls
rm -rf /usr/share/patchmanager/patches/sailfishos-xperia-clock
rm -rf /usr/share/patchmanager/patches/sailfishos-xperia-clock-12
else
if [ $1 = 1 ]; then
    // Do stuff specific to upgrades
echo "Upgrading"
patchmanager -u sailfishos-xperia-clock
patchmanager -u sailfishos-xperia-clock-12
fi
fi

%changelog
* Tue Apr 4 2017 0.2
- Date repositioned.

* Tue Apr 4 2017 0.1
- First build.
