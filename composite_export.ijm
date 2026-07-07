// Iterates through a user-selected input directory, formats dual-channel 
// images into a standardized composite view, applies 0.2% saturated contrast,
// and saves the processed images as TIFFs to a user-selected output directory.

// 1. Prompt user for Input and Output directories
inputDir = getDirectory("Choose Input Directory (Raw Images)");
outputDir = getDirectory("Choose Output Directory (Processed Images)");

// 2. Get list of files in the input directory
list = getFileList(inputDir);

// 3. Enable Batch Mode (runs in background for faster processing and saves RAM)
setBatchMode(true);

// 4. Loop through all files in the directory
for (i = 0; i < list.length; i++) {
    // Only process .nd files (avoids tiff)
    file = toLowerCase(list[i]);
    if (endsWith(file, ".nd")) {
        
        // Open the image
        path = inputDir + list[i];
        run("Bio-Formats Importer", "open=[" + path + "] autoscale color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT windowless=true");
        // Apply standardized display settings
        Stack.setDisplayMode("composite");
        run("Green");
        run("Enhance Contrast", "saturated=0.2");
        run("Next Slice [>]");
        run("Red");
        run("Enhance Contrast", "saturated=0.2");
        
        // Save the processed image to the output directory
        saveAs("Tiff", outputDir + list[i]);
        
        // Close the image to free up memory before the next loop
        close();
    }
}

// 5. Disable Batch Mode and notify user in the Log window
setBatchMode(false);
print("Batch composite processing complete!");
print("Saved to: " + outputDir);
