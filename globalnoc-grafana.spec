Name: globalnoc-grafana
Version: 1.0.0
Release: 1%{?dist}
Summary: A package that deployes .repo file to enable grafana installation.
License: GRNOC
Group: GRNOC
URL: https://github.com/GlobalNOC/vce
Source0: globalnoc-grafana-%{version}.tar.gz

%description

%prep
%setup -q -n globalnoc-grafana-%{version}


%build

%install
rm -rf $RPM_BUILD_ROOT
%{__install} -d -p %{buildroot}/etc/yum.repos.d

%{__install} etc/yum.repos.d/grafana.repo %{buildroot}/etc/yum.repos.d/grafana.repo

%clean
rm -rf $RPM_BUILD_ROOT


%files
%defattr(644,root,root,755)
/etc/yum.repos.d/grafana.repo
%doc

%post
%changelog

