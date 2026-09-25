Name:           tosho-cli
Version:        3.8.0
Release:        2%{?dist}
Summary:        A Linux CLI anime streaming tool using AnimeTosho and TorBox

License:        GPLv3
URL:            https://github.com/sphxre-1/tosho-cli
Source0:        %{url}/archive/refs/heads/main.tar.gz

Requires:       bash
Requires:       curl
Requires:       jq
Requires:       fzf
Requires:       mpv
Requires:       socat
Requires:       syncplay

BuildArch:      noarch

%description
tosho-cli is a powerful command-line interface for searching and streaming anime.
It resolves metadata via AniList and AniDB, scrapes AnimeTosho for the best 
releases, and streams them instantly via TorBox and mpv.

%prep
%setup -q -n tosho-cli-main

%build
# Nothing to build, it's a bash script

%install
mkdir -p %{buildroot}%{_bindir}
install -m 755 tosho-cli %{buildroot}%{_bindir}/tosho-cli

%files
%license LICENSE
%doc README.md
%{_bindir}/tosho-cli

%changelog
* Thu Sep 24 2026 sphxre <sphxre@example.com> - 3.8.0-1
- Initial RPM release
