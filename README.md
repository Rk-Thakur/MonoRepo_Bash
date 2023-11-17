# Flutter MonoRepo Project Setup

Flutter MonoRepo Project Setup Script

## Description

This shell script automates the creation of a Flutter project with a monorepo architecture. It uses Flutter for the project and Melos to manage packages within the monorepo.

## Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Melos](https://pub.dev/packages/melos)

## Usage

**Clone this repository:**

    ```bash
    git clone https://github.com/your_username/your_script_repo.git
    cd your_script_repo
    ```

**Make the script executable:**

    ```bash
    chmod +x flutter_mono_repo.sh
    ```

**Run the script:**

    ```bash
    ./flutter_mono_repo.sh
    ```

**Follow the prompts to set up your Flutter monorepo.**

The script will interactively guide you through the setup process, prompting you for necessary information and choices.


## Project Structure

Generated project structure:

```bash
your_project/
|-- packages/
| |-- AppName/
| | |-- lib/
| | |-- test/
| | |-- pubspec.yaml
| |-- AppName_components/
| | |-- lib/
| | |-- pubspec.yaml
| |-- AppName_core/
| | |-- lib/
| | |-- pubspec.yaml
| |-- AppName_resources/
| | |-- lib/
| | |-- pubspec.yaml
| |-- AppName_server/
| | |-- lib/
| | |-- pubspec.yaml
|-- melos.yaml
|-- pubspec.yaml
|-- ...
```

### `packages/`

This directory contains individual packages within your monorepo. Each package typically has its own `lib/` for source code, `test/` for tests, and a `pubspec.yaml` file for dependencies and configuration.

### `melos.yaml`

The `melos.yaml` file is the configuration file for Melos, specifying settings and package information for your monorepo.

### `pubspec.yaml`

The `pubspec.yaml` file at the root level is for the overall Flutter project. It may include global dependencies, configuration, and metadata for the entire monorepo.

## DartFrog Server Package
All the steps has already been done in the script. If required:

Project includes a server package using DartFrog, follow these additional steps:

**Navigate to the Server Package:**

    ```bash
    cd packages/package2/server
    ```

**Install DartFrog CLI:**

    ```bash
    dart pub global activate dart_frog_cli
    ```

**Create the Server:**

    ```bash
    dart_frog create .
    ```

**Run the Server:**

    ```bash
    dart_frog serve
    ```

**Access the Server:**

   Once the server is running, you can access it at `http://localhost:8080` by default.

## Contributions

Contributions are welcome! If you find issues or have suggestions, please open an [issue](https://github.com/Rk-Thakur/MonoRepo_Bash/issues) or submit a [pull request](https://github.com/Rk-Thakur/MonoRepo_Bash/pulls).

