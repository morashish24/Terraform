folders = input ("Please provide folder names with spaces").split()

for folder in folders:
  files = os.files(folder)
  
  print ("listing files for the folder= " + files)
  
  for file in files : 
    print (file)

    Edited from Tab 