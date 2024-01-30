import os
import platform
import subprocess

def main():
    dotfiles_dir = os.path.expanduser('~/dotfiles')
    system_type = platform.system()

    print("Setting up your dotfiles...")

    if system_type == "Windows":
        # Windows specific commands
        subprocess.call(['cmd', '/c', 'mklink', '/H', os.path.expanduser('~\\.vimrc'), os.path.join(dotfiles_dir, 'vimrc')])
        # Use 'mklink /J' for directory junctions (similar to symlinks for directories) in Windows
    else:
        # Unix/Linux/MacOS specific commands
        os.symlink(os.path.join(dotfiles_dir, 'vimrc'), os.path.expanduser('~/.vimrc'), target_is_directory=False)
        # For directories, use target_is_directory=True

    print("Dotfiles setup completed.")

if __name__ == "__main__":
    main()

