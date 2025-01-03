folders = input ("Please provide folder names with spaces").split()

for folder in folders:
  
  try:
    files = os.files(folder)
  except FileNotFoundError:
    print("Please provide a valid folder name"+ folder)
    break
  except PermissionError:
    print ("You dont have enough permission" + folder)
    break
  
  print ("listing files for the folder= " + files)
  
  for file in files : 
    print (file)

    Edited from Tab 