// 1. Get current image info
// Note that image last opened will be automatically chosen as current image
title = getTitle();
imageDir = getDirectory("image");

if (imageDir == "") {
    exit("Please save your image first so the macro knows where to look!");
}

// 2. Get the parent directory (one level up)
parentDir = File.getParent(imageDir);

// 3. Define the new ROI directory path
roiDir = parentDir + File.separator + "ROI" + File.separator;

// 4. Create the ROI folder if it doesn't exist
if (!File.exists(roiDir)) {
    File.makeDirectory(roiDir);
}

// 5. Clean filename and save in ImageJ format
name = File.nameWithoutExtension;
count = roiManager("count");

if (count == 0) {
    exit("The ROI Manager is empty!");
} else if (count == 1) {
    roiManager("Save", roiDir + name + ".roi");
} else {
    roiManager("Save", roiDir + name + ".zip");
}

print("ROIs saved to: " + roiDir + name);
