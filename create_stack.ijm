// example number of slices = 45
n = 45;
original = getTitle();
run("New...", "name=Stack width="+getWidth()+" height="+getHeight()+" slices="+n+" type=8-bit");
stack = getTitle();
selectWindow(original);

for (i = 1; i <= n; i++) {
    selectWindow(original);
    run("Copy");
    selectWindow(stack);
    setSlice(i);
    run("Paste");
}
