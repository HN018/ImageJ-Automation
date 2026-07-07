// Save all currently opened images as TIFF files in user-specified directory
if (nImages==0)
     exit("No images are open");
  dir = getDirectory("Choose a Directory");
  for (n=1; n<=nImages; n++) {
     selectImage(n);
     title = getTitle;
     title = replace(title,"\"","");
     saveAs("tiff", dir+title.replace("/","_"));
  } 
 close("*");
