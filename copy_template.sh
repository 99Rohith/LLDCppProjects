#!/bin/bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <new_project_name>"
    exit 1
fi

PROJECT_NAME="$1"
TEMPLATE_DIR="Template"

if [ ! -d "$TEMPLATE_DIR" ]; then
    echo "Error: Template directory '$TEMPLATE_DIR' not found!"
    exit 1
fi

if [ -d "$PROJECT_NAME" ]; then
    echo "Project '$PROJECT_NAME' already exists. Aborting."
    exit 1
fi

echo "Creating new project '$PROJECT_NAME' from '$TEMPLATE_DIR'..."
mkdir -p "$PROJECT_NAME"

for item in include src tests build.sh CMakeLists.txt; do
    if [ -e "$TEMPLATE_DIR/$item" ]; then
        cp -R "$TEMPLATE_DIR/$item" "$PROJECT_NAME/"
    fi
done

files_to_update=()
while IFS= read -r -d $'\0' f; do files_to_update+=("$f"); done < <(find "$PROJECT_NAME" -type f \( -name "CMakeLists.txt" -o -name "build.sh" \) -print0)

if [ ${#files_to_update[@]} -gt 0 ]; then
    echo "Replacing 'Template' -> '$PROJECT_NAME' in copied files..."
    for file in "${files_to_update[@]}"; do
        perl -pi -e "s/\\bTemplate\\b/$PROJECT_NAME/g" "$file"
    done
else
    echo "No CMakeLists.txt or build.sh found to update."
fi

if [ -f "$PROJECT_NAME/build.sh" ]; then
    chmod +x "$PROJECT_NAME/build.sh"
fi

echo "Project '$PROJECT_NAME' created successfully!"
echo "Run cd $PROJECT_NAME && ./build.sh to build the project"
