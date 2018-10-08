Name:          sailfishos-patch-xperia-clock
Version:       0.8.0
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

%postun
if [ $1 = 0 ]; then
    // Do stuff specific to uninstalls
        rm -rf /usr/share/patchmanager/patches/sailfishos-xperia-clock
	rm /usr/share/jolla-settings/entries/sailfishos-patch-xperia-clock.json
	rm -rf /usr/share/jolla-settings/pages/sailfishos-patch-xperia-clock

else
if [ $1 = 1 ]; then
    // Do stuff specific to upgrades
echo "Upgrading"
        patchmanager -u sailfishos-xperia-clock
fi
fi

%changelog
* Mon Oct 8 2018 0.8.0
- Added settings page.

* Tue Nov 28 2017 0.7.1
- Fixed top margin.

* Tue Oct 12 2017 0.7
- Update for Sailfish OS 2.1.3.

* Thu Apr 6 2017 0.5
- Fixed clock color in Sneak Peek view.

* Wed Apr 5 2017 0.4
- Weather widget added.

* Tue Apr 4 2017 0.3
- AMPM added on 12h clock.

* Tue Apr 4 2017 0.2
- Date repositioned.

* Tue Apr 4 2017 0.1
- First build.
