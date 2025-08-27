import os
import shutil

def copy_wallpapers():
    image_extensions = ('.jpg', '.jpeg', '.png')
    wallpapers_dir = "/home/twoface/Pictures/wallpapers"
    dest_dir = "./assets"

    os.makedirs(dest_dir, exist_ok=True)

    for root, _, files in os.walk(wallpapers_dir):
        for file in files:
            if file.lower().endswith(image_extensions):
                source_path = os.path.join(root, file)
                destination_path = os.path.join(dest_dir, file)
                shutil.copy2(source_path, destination_path)
                print(f"Copied: {source_path} -> {destination_path}")

def copy_config_dir(config_name):
    src = os.path.expanduser(f"~/.config/{config_name}")
    dst = os.path.join(os.path.dirname(__file__), config_name)
    
    if os.path.exists(dst):
        shutil.rmtree(dst)
    
    if os.path.exists(src):
        shutil.copytree(src, dst)
        print(f"Copied: {src} -> {dst}")
    else:
        print(f"Skipped (not found): {src}")

def copy_dotfile(filename):
    src = os.path.expanduser(f"~/{filename}")
    dst = os.path.join(os.path.dirname(__file__), filename)
    
    if os.path.isfile(src):
        shutil.copy2(src, dst)
        print(f"Copied: {src} -> {dst}")
    else:
        print(f"Skipped (not found): {src}")

def copy_dir(path, name=None):
    src = os.path.expanduser(path)
    dst_name = name or os.path.basename(src)
    dst = os.path.join(os.path.dirname(__file__), dst_name)

    if os.path.exists(dst):
        shutil.rmtree(dst)

    if os.path.exists(src):
        shutil.copytree(src, dst)
        print(f"Copied: {src} -> {dst}")
    else:
        print(f"Skipped (not found): {src}")

def copy_dotfiles():
    copy_wallpapers()

    # ~/.config directories
    config_dirs = [
        "sway",
        "waybar",
        "fuzzel",
        "nvim",
        "mako",
        "gtk-3.0",
        "gtk-4.0",
        "qt5ct",
        "qt6ct",
    ]

    # ~ dotfiles
    dotfiles = [
        ".bashrc",
        ".profile",
        ".gitconfig",
    ]

    for config in config_dirs:
        copy_config_dir(config)

    for dotfile in dotfiles:
        copy_dotfile(dotfile)

    # Themes and Fonts
    other_dirs = {
        "~/.themes": "themes",
    }

    for path, name in other_dirs.items():
        copy_dir(path, name)

if __name__ == "__main__":
    copy_dotfiles()
