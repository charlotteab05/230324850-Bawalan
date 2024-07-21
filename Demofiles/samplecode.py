import os

directory = "Demofiles"
parent_dir = "/var/www/html"

# Path to the directory to be created
path = os.path.join(parent_dir, directory)

try:
    # Create the directory
    os.makedirs(path)
    print(f"Directory '{directory}' created successfully in {parent_dir}")
except PermissionError:
    print(f"Permission denied: Cannot create directory '{directory}' in {parent_dir}")
except Exception as e:
    print(f"An error occurred: {e}")

