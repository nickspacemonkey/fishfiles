# Override distro-provided update functions after system configuration loads.
function update
    if type -q nala
        sudo nala upgrade -y
    else if type -q apt
        sudo apt update && sudo apt upgrade -y
    else if type -q dnf
        sudo dnf upgrade -y
    else if type -q pacman
        sudo pacman -Syu --noconfirm
    else if type -q zypper
        sudo zypper refresh; and sudo zypper update -y
    else if type -q apk
        sudo apk --no-interactive update; and sudo apk --no-interactive upgrade
    else if type -q nix
        sudo nixos-rebuild switch --upgrade
    else
        echo "No supported package manager is installed."
    end
end
