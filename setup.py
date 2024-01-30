import os
import platform
import subprocess

def main():
    dotfiles_dir = os.path.expanduser('~/dotfiles')
    system_type = platform.system()

    print("Setting up your dotfiles...")

    create_symlink('vimrc', '.vimrc', dotfiles_dir, system_type)
    # Add other configuration files as needed
    # create_symlink('other_config_file', '.other_config_file', dotfiles_dir, system_type)

    print("Dotfiles setup completed.")

def create_symlink(source_filename, target_filename, dotfiles_dir, system_type):
    source_filepath = os.path.join(dotfiles_dir, source_filename)
    target_filepath = os.path.expanduser(f'~/{target_filename}')

    # If the target file already exists and is a symlink, remove it
    if os.path.islink(target_filepath):
        os.unlink(target_filepath)
    # If it's a file or directory, you might want to back it up instead of removing
    elif os.path.exists(target_filepath):
        backup_filepath = f'{target_filepath}.backup'
        print(f"Backing up existing file: {target_filepath} to {backup_filepath}")
        os.rename(target_filepath, backup_filepath)

    # Create symlink (Unix) or junction/mklink (Windows)
    if system_type == "Windows":
        subprocess.call(['cmd', '/c', 'mklink', '/H', target_filepath, source_filepath])
    else:
        os.symlink(source_filepath, target_filepath)

if __name__ == "__main__":
    main()

