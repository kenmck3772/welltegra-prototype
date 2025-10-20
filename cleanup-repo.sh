#!/bin/bash

# Well-Tegra Repository Cleanup Script
# This script organizes files and removes redundant content safely

echo "🧹 Starting Well-Tegra repository cleanup..."

# Step 1: Create organized directory structure
echo "📁 Creating organized directory structure..."

# Create media subfolder for better organization
mkdir -p assets/media
mkdir -p assets/icons

# Step 2: Move files that are currently in wrong locations
echo "📦 Moving files to correct locations..."

# Move root-level media files to assets (only if they exist)
if [ -f "favicon.ico" ]; then
    echo "Moving favicon.ico to assets/"
    mv favicon.ico assets/
fi

if [ -f "favicon.png" ]; then
    echo "Moving favicon.png to assets/"
    mv favicon.png assets/
fi

# Move whitepaper to docs if it's in root
if [ -f "WellTegra-WhitePaper-v1_1.md" ]; then
    echo "Moving whitepaper to docs/"
    mv WellTegra-WhitePaper-v1_1.md docs/
fi

# Step 3: Organize existing assets into subfolders
echo "🗂️  Organizing assets into subfolders..."

# Move video files to media subfolder
for video in assets/*.mp4; do
    if [ -f "$video" ]; then
        echo "Moving $(basename $video) to assets/media/"
        mv "$video" assets/media/
    fi
done

# Move icon files to icons subfolder
for icon in assets/favicon* assets/apple-touch-icon* assets/*icon*; do
    if [ -f "$icon" ] && [[ ! "$icon" == *"/media/"* ]]; then
        echo "Moving $(basename $icon) to assets/icons/"
        mv "$icon" assets/icons/
    fi
done

# Step 4: Remove redundant files (safely)
echo "🗑️  Removing redundant files..."

# Remove README files that aren't the main one
if [ -f "README.html" ]; then
    echo "Removing README.html"
    rm -f README.html
fi

if [ -f "README.txt" ]; then
    echo "Removing README.txt"
    rm -f README.txt
fi

# Remove patch files
echo "Removing any .patch files..."
rm -f *.patch

# Step 5: Update asset references (create a note)
echo "📝 Creating update notes..."
cat > CLEANUP_NOTES.md << EOF
# Repository Cleanup Complete

## Files Moved:
- Video files: assets/media/
- Icon files: assets/icons/
- Whitepaper: docs/

## Files Removed:
- Redundant README files
- Temporary .patch files

## Next Steps:
1. Update HTML files to reference new asset paths
2. Update service worker cache paths
3. Test all functionality
4. Commit changes

## Asset Path Updates Needed:
- Update favicon references to: assets/icons/favicon.png
- Update video references to: assets/media/[filename]
EOF

echo "✅ Cleanup complete!"
echo "📋 Check CLEANUP_NOTES.md for next steps"
echo "🔍 Run 'git status' to see changes"
echo "💾 Commit with: git add . && git commit -m 'Admin: Reorganize repository structure'"