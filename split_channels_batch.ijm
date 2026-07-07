// images must be all opened in ImageJ to be processed here
n = nImages;
titles = newArray(n);
for (i = 0; i < n; i++) {
    selectImage(i + 1);
    titles[i] = getTitle();
}

// Now loop over stored titles
for (i = 0; i < titles.length; i++) {
    selectWindow(titles[i]);
    getDimensions(width, height, channels, slices, frames);
    if (channels > 1) {
        print("Splitting: " + titles[i]);
        run("Split Channels");
    } else {
        print("Skipping: " + titles[i] + " (only " + channels + " channel)");
    }
}
