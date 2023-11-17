# Get the operating system type
os_type=$(uname)

# Check the operating system
if [[ "$os_type" == "Darwin" ]]; then
    # macOS specific commands or paths
    echo "So You are  MAC User!! 💻"
    documents_dir="$HOME/Documents/"
    echo "Folder will be written in: $documents_dir"

elif [[ "$os_type" == "MINGW"* ]]; then
    # Windows specific commands or paths
    echo "So You are Window User!! 🪟"
    documents_dir="D:/"
    echo "Folder will be written in: $documents_dir"
else
    echo "Unsupported operating system."
    exit 1
fi

# Prompt the user for the folder name using read
echo "Enter the App name: "
read -r folder_name
dart pub global activate melos

# Check if the folder name is empty
if [[ -z "$folder_name" ]]; then
    echo "Folder name cannot be empty. Please provide a valid folder name."
    exit 1
fi

# Initialize a variable to track the overall success status
success=0

# Check if a folder with the given name already exists in the Documents folder
if [[ -d "$documents_dir/$folder_name" ]]; then
    echo "A folder with the name '$folder_name' already exists in the Documents folder. Please choose a different name."
    exit 1
fi

# Create the new folder in the Documents folder
mkdir "$documents_dir/$folder_name"
dart pub global activate dart_frog_cli


# Check if the folder creation was successful
if [[ $? -eq 0 ]]; then
    echo "Folder '$folder_name' created successfully in the Documents folder."
else
    echo "Failed to create the folder '$folder_name' in the Documents folder."
    exit 1
fi

# Create a packages folder inside the main folder
packages_folder="$documents_dir/$folder_name/packages"
mkdir "$packages_folder"

# Check if the packages folder creation was successful
if [[ $? -eq 0 ]]; then
    echo "Packages folder created successfully inside the folder '$folder_name'."
else
    echo "Failed to create the packages folder inside the folder '$folder_name'."
    exit 1
fi

# Create pubspec.yaml file inside the folder
pubspec_file="$documents_dir/$folder_name/pubspec.yaml"
touch "$pubspec_file"

# Check if the pubspec.yaml file creation was successful
if [[ $? -eq 0 ]]; then
    echo "pubspec.yaml file created successfully inside the folder '$folder_name'."
else
    echo "Failed to create the pubspec.yaml file inside the folder '$folder_name'."
    exit 1
fi

# Add content to the pubspec.yaml file
cat <<EOT >> "$pubspec_file"
name: $folder_name
description: A new Flutter project
version: 1.0.0
publish_to: 'none'
environment:
  sdk: ">=2.12.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter

dev_dependencies:
  melos: ^0.6.0
  very_good_analysis: ^3.2.0

EOT

# Check if the content addition was successful
if [[ $? -eq 0 ]]; then
    echo "Added content to the pubspec.yaml file."
else
    echo "Failed to add content to the pubspec.yaml file."
    exit 1
fi

# Add melos and very_good_analysis packages using flutter pub add
cd "$documents_dir/$folder_name"
flutter pub add melos very_good_analysis

# Check if the package addition was successful
if [[ $? -eq 0 ]]; then
    echo "Added melos and very_good_analysis packages to the pubspec.yaml file."
else
    echo "Failed to add packages to the pubspec.yaml file."
    exit 1
fi

# Create melos.yaml file inside the folder
melos_yaml_file="$documents_dir/$folder_name/melos.yaml"
touch "$melos_yaml_file"

# Check if the melos.yaml file creation was successful
if [[ $? -eq 0 ]]; then
    echo "melos.yaml file created successfully inside the folder '$folder_name'."
else
    echo "Failed to create the melos.yaml file inside the folder '$folder_name'."
    exit 1
fi

# Add content to the melos.yaml file
cat <<EOT >> "$melos_yaml_file"
name: $folder_name

packages:
  - packages/*
scripts:
    analyze: 
        exec: dart analyze .
EOT

# Check if the melos.yaml content addition was successful
if [[ $? -eq 0 ]]; then
    echo "Added content to the melos.yaml file."
else
    echo "Failed to add content to the melos.yaml file."
    exit 1
fi

# Run melos.yaml file using melos command
cd "$documents_dir/$folder_name"

# Check if melos execution was successful
if [[ $? -eq 0 ]]; then
    echo "Ran melos.yaml file successfully using melos command."
else
    echo "Failed to run melos.yaml file using melos command."
    exit 1
fi

# Navigate to the packages folder
cd "$packages_folder"

# Create folders inside the packages folder
mkdir "$folder_name"
mkdir "$folder_name"_core
mkdir "$folder_name"_resources
mkdir "$folder_name"_components
mkdir "$folder_name"_server

# Check if the folder creation inside packages was successful
if [[ $? -eq 0 ]]; then
    echo "Created the required folders inside the packages folder."
else
    echo "Failed to create the required folders inside the packages folder."
    exit 1
fi

# Navigate to the given name folder inside packages and run `flutter create`
cd "$folder_name"
flutter create .

# Check if `flutter create` was successful
if [[ $? -eq 0 ]]; then
    echo "Ran 'flutter create .' successfully inside the folder '$folder_name'."
else
    echo "Failed to run 'flutter create .' inside the folder '$folder_name'."
    exit 1
fi

# Navigate to the given name resources folder and create additional folders
cd "$packages_folder/$folder_name"_resources

# Create lib, assets, and bin folders inside the given name resources folder
mkdir lib
mkdir assets
mkdir bin

# Check if the folder creation inside given name resources was successful
if [[ $? -eq 0 ]]; then
    echo "Created additional folders inside the 'given_name_resources' folder."
else
    echo "Failed to create additional folders inside the 'given_name_resources' folder."
    exit 1
fi

# Create svg.dart file inside the given name resources/bin folder
resources_svg="$packages_folder/$folder_name"_resources/bin/svg.dart
touch "$resources_svg"

# Check if the pubspec.yaml file creation was successful
if [[ $? -eq 0 ]]; then
    echo "svg.dart file created successfully inside the 'given_name_resources' folder."
else
    echo "Failed to create the svg.dart file inside the 'given_name_resources' folder/bin folder."
    exit 1
fi

# Create pubspec.yaml file inside the given name resources folder
resources_pubspec_file="$packages_folder/$folder_name"_resources/pubspec.yaml
touch "$resources_pubspec_file"

# Check if the pubspec.yaml file creation was successful
if [[ $? -eq 0 ]]; then
    echo "pubspec.yaml file created successfully inside the 'given_name_resources' folder."
else
    echo "Failed to create the pubspec.yaml file inside the 'given_name_resources' folder."
    exit 1
fi

# Add content to the pubspec.yaml file inside the given name resources folder
cat <<EOT >> "$resources_pubspec_file"
name: ${folder_name}_resources
description: Resources for the $folder_name package
version: 1.0.0
publish_to: 'none'
environment:
  sdk: ">=2.12.0 <3.0.0"

flutter:
  assets:
    - assets/

EOT

# Check if the content addition to pubspec.yaml was successful
if [[ $? -eq 0 ]]; then
    echo "Added content to the pubspec.yaml file inside the 'given_name_resources' folder."
else
    echo "Failed to add content to the pubspec.yaml file inside the 'given_name_resources' folder."
    exit 1
fi

# Create pubspec.yaml file inside the given name core folder
core_pubspec_file="$packages_folder/$folder_name"_core/pubspec.yaml
touch "$core_pubspec_file"

# Check if the pubspec.yaml file creation was successful
if [[ $? -eq 0 ]]; then
    echo "pubspec.yaml file created successfully inside the 'given_name_core' folder."
else
    echo "Failed to create the pubspec.yaml file inside the 'given_name_core' folder."
    exit 1
fi

# Add content to the pubspec.yaml file inside the given name core folder
cat <<EOT >> "$core_pubspec_file"
name: ${folder_name}_core
description: Core functionality for the $folder_name package
version: 1.0.0
publish_to: 'none'
environment:
  sdk: ">=2.12.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter

EOT

# Check if the content addition to pubspec.yaml was successful
if [[ $? -eq 0 ]]; then
    echo "Added content to the pubspec.yaml file inside the 'given_name_core' folder."
else
    echo "Failed to add content to the pubspec.yaml file inside the 'given_name_core' folder."
    exit 1
fi

# Create pubspec.yaml file inside the given name components folder
components_pubspec_file="$packages_folder/$folder_name"_components/pubspec.yaml
touch "$components_pubspec_file"

# Check if the pubspec.yaml file creation was successful
if [[ $? -eq 0 ]]; then
    echo "pubspec.yaml file created successfully inside the 'given_name_components' folder."
else
    echo "Failed to create the pubspec.yaml file inside the 'given_name_components' folder."
    exit 1
fi

# Add content to the pubspec.yaml file inside the given name components folder
cat <<EOT >> "$components_pubspec_file"
name: ${folder_name}_components
description: Components for the $folder_name package
version: 1.0.0
publish_to: 'none'
environment:
  sdk: ">=2.12.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter

EOT

# Check if the content addition to pubspec.yaml was successful
if [[ $? -eq 0 ]]; then
    echo "Added content to the pubspec.yaml file inside the 'given_name_components' folder."
else
    echo "Failed to add content to the pubspec.yaml file inside the 'given_name_components' folder."
    exit 1
fi

# Create lib folder inside the given name core folder
mkdir "$packages_folder/$folder_name"_core/lib
mkdir "$packages_folder/$folder_name"_core/lib/src

# Create a Dart file inside the components/lib/ folder
core_file="$packages_folder/$folder_name"_core/lib/"$folder_name"_core.dart
touch "$core_file"

# Check if the Dart file creation was successful
if [[ $? -eq 0 ]]; then
    echo "Created a Dart file '$core_file' inside the 'given_name_components/lib/' folder."
else
    echo "Failed to create the Dart file inside the 'given_name_components/lib/' folder."
    exit 1
fi

# Check if the lib folder creation inside the given name core folder was successful
if [[ $? -eq 0 ]]; then
    echo "Created 'lib' folder inside the 'given_name_core' folder."
else
    echo "Failed to create 'lib' folder inside the 'given_name_core' folder."
    exit 1
fi

# Create lib folder inside the given name components folder
mkdir "$packages_folder/$folder_name"_components/lib
mkdir "$packages_folder/$folder_name"_components/lib/src
mkdir "$packages_folder/$folder_name"_components/lib/src/general

# Create a Dart file inside the components/lib/ folder
dart_file="$packages_folder/$folder_name"_components/lib/"$folder_name"_components.dart
touch "$dart_file"

# Check if the Dart file creation was successful
if [[ $? -eq 0 ]]; then
    echo "Created a Dart file '$dart_file' inside the 'given_name_components/lib/' folder."
else
    echo "Failed to create the Dart file inside the 'given_name_components/lib/' folder."
    exit 1
fi
# Check if the lib folder creation inside the given name components folder was successful
if [[ $? -eq 0 ]]; then
    echo "Created 'lib' folder inside the 'given_name_components' folder."
else
    echo "Failed to create 'lib' folder inside the 'given_name_components' folder."
    exit 1
fi


# Navigate to the given name server folder and create additional folders
cd "$packages_folder/$folder_name"_server

dart_frog create .
# Navigate back to the original location
cd -

# Check if the entire process completed successfully
if [[ $? -eq 0 ]]; then
    echo "Entire process completed successfully."
    cd "$documents_dir/$folder_name"  # Change to the root folder
    code .  # Open the entire folder in VS Code
else
    echo "Some steps in the process failed. Check the error messages above."
fi

melos bootstrap
# Exit with the value of the success variable (0 for success, 1 for failure)
exit $success