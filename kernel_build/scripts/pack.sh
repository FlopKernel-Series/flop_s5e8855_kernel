#!/bin/bash
#
# Packaging functions
#

create_anykernel_zip() {
    if [ "$DO_ZIP" != "1" ]; then
        return 0
    fi

    echo -e "\nINFO: Building AnyKernel3 zip..."

    # Clone AK3 if needed
    if [ ! -d "$AK3_DIR" ]; then
        echo "INFO: Cloning AnyKernel3..."
        git clone -q -b "$AK3_BRANCH" --depth=1 "$AK3_URL" "$AK3_DIR"
    fi

    cd "$AK3_DIR"
    
    # Copy kernel Image
    if [ -f "$IMAGES_DIR/Image" ]; then
        cp -f "$IMAGES_DIR/Image" Image
    else
        echo "ERROR: Kernel Image not found!"
        return 1
    fi

    # Copy DTBO if exists
    if [ -f "$IMAGES_DIR/dtbo.img" ]; then
        cp -f "$IMAGES_DIR/dtbo.img" dtbo.img
    fi

    # Copy vendor_boot if exists
    if [ -f "$IMAGES_DIR/vendor_boot.img" ]; then
        cp -f "$IMAGES_DIR/vendor_boot.img" vendor_boot.img
    fi

    # Create zip
    ZIP_NAME="$KDIR/kernel_build/gts10fewifi-${KERNEL_VARIANT}-${DATE}.zip"
    zip -r9 -q "$ZIP_NAME" * -x .git .github README.md

    cd "$KDIR"

    echo "INFO: AnyKernel3 zip created!"
    echo "INFO: Output: $(realpath "$ZIP_NAME") ($(du -h "$ZIP_NAME" | cut -f1))"

    # Cleanup AK3 directory
    rm -rf "$AK3_DIR"

    return 0
}

create_odin_tar() {
    if [ "$DO_TAR" != "1" ]; then
        return 0
    fi

    echo -e "\nINFO: Creating Odin tar package..."

    if [ ! -f "$IMAGES_DIR/boot.img" ]; then
        echo "WARNING: No boot.img found, skipping tar creation"
        return 1
    fi

    # Collect files to package
    local tar_files="boot.img"
    local tar_desc="boot.img"

    # Add vendor_boot unless GKI-only build
    if [ "$DO_GKI_ONLY" != "1" ] && [ "$DO_VENDOR_BOOT" == "1" ] && [ -f "$IMAGES_DIR/vendor_boot.img" ]; then
        tar_files="$tar_files vendor_boot.img"
        tar_desc="$tar_desc + vendor_boot.img"
    fi

    # Add dtbo.img if it exists
    if [ -f "$IMAGES_DIR/dtbo.img" ]; then
        tar_files="$tar_files dtbo.img"
        tar_desc="$tar_desc + dtbo.img"
    fi

    # Add GKI suffix if GKI-only build
    local variant_suffix=""
    if [ "$DO_GKI_ONLY" == "1" ]; then
        variant_suffix="-gki"
    fi

    TAR_NAME="$KDIR/kernel_build/gts10fewifi-${KERNEL_VARIANT}${variant_suffix}-${DATE}.tar"

    echo "INFO: Packaging $tar_desc..."
    tar -C "$IMAGES_DIR" -cf "$TAR_NAME" $tar_files
    echo "INFO: Odin tar created!"
    echo "INFO: Output: $(realpath "$TAR_NAME") ($(du -h "$TAR_NAME" | cut -f1))"

    return 0
}
