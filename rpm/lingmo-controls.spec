%global majver 1
%global minver 0

Name:          lingmo-controls
Version:       %{majver}.%{minver}.0
Release:       1%{?dist}
Summary:       Lingmo Desktop QML Controls Library

License:       LGPL-2.1-or-later
URL:           https://lingmo.org
Source0:       %{name}-%{version}.tar.xz

BuildRequires: cmake >= 3.21
BuildRequires: qt6-qtbase-devel >= 6.5
BuildRequires: qt6-qtdeclarative-devel >= 6.5

BuildRequires: lingmo-theme-devel >= 1.0.0
BuildRequires: gcc-c++

%description
A set of QML controls for the Lingmo Desktop that uses Lingmo.Theme
for all visual properties. Provides Button, TextField, CheckBox,
RadioButton, Switch, Slider, ProgressBar, ScrollBar, Menu, Dialog,
and ToolButton components.

%package -n qml6-lingmo-controls
Summary:       QML6 bindings for Lingmo.Controls
Requires:      qml6-lingmo-theme >= 1.0.0
%description -n qml6-lingmo-controls
QML6 module providing Lingmo.Controls backed by Lingmo.Theme design tokens.

%package devel
Summary:       Development files for lingmo-controls
Requires:      qml6-lingmo-controls = %{version}-%{release}
%description devel
Development headers, CMake config, and pkg-config files for lingmo-controls.

%prep
%autosetup

%build
%cmake \
    -DBUILD_TESTING=ON \
    -DBUILD_EXAMPLES=OFF \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
%cmake_build

%install
%cmake_install

%check
%ctest

%files
%license LICENSE
%doc README.md CHANGELOG.md
%{_libdir}/qt6/qml/Lingmo/Controls/
%{_libdir}/cmake/LingmoControls/
%{_libdir}/libLingmoControls.so.*

%files devel
%{_includedir}/LingmoControls/
%{_libdir}/libLingmoControls.so
%{_libdir}/cmake/LingmoControls/*.cmake

%changelog
* Tue Jun 30 2026 Lingmo Desktop Team <team@lingmo.org> - 1.0.0-1
- Initial release
