_default:
    just --list

# will have to make this more flexible if/when I have non-python packages in here
# outputs the information that changes in a formula when a new version is released (to be pasted into the formula manually)
@bump package:
    {{ if path_exists("Formula" / package + ".rb") == "false" { error("no formula for package " + package) } else { "" } }}

    curl -s "https://pypi.org/pypi/{{ package }}/json" | jq '.releases["\(.releases | keys | .[-1])"] | map(select(.packagetype == "sdist"))[0] | {url, sha256: .digests.sha256}'
