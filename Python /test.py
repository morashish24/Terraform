folders = input ("Please provide folder names with spaces").split()

for folder in folders:
  files = os.files(folder)
  
  print (files)