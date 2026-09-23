_default:
    just --list

# will have to make this more flexible if/when I have non-python packages in here
# outputs the information that changes in a formula when a new version is released (to be pasted into the formula manually)

@_exists package:
    {{ assert(path_exists("Formula" / package + ".rb") == "true", "no local formula for package " + package) }}

# bump an existing package version
@bump package: (_exists package)
    curl -s "https://pypi.org/pypi/{{ package }}/json" | jq '.releases["\(.releases | keys | .[-1])"] | map(select(.packagetype == "sdist"))[0] | {url, sha256: .digests.sha256}'

    echo "Paste those values into ./Formula/{{ package }}.rb"

# generate a new python package formula
@generate package:
    uvx --with {{ package }} --with 'setuptools<82.0.0' --from homebrew-pypi-poet poet -f {{ package }} > "Formula/{{ package }}.rb"

    echo "Ok, now tweak the new formula!"

@commit package: (_exists package)
    git add ./Formula/{{ package }}.rb
    git commit -m "{{ package }} -> $(curl --fail -s "https://pypi.org/pypi/{{ package }}/json" | jq -r '.info.version')"
