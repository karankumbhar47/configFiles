import os
import sys
import json

arguments = sys.argv

jsonPath = arguments[1]
coursePath = arguments[2]

# Read the JSON file
with open(jsonPath) as json_file:
    file_data = json.load(json_file)


path = os.path.join(coursePath, "courseName")
os.makedirs(path, exist_ok=True)  # Create the directory if it doesn't exist

## Sort the file data based on the index
#sorted_file_data = sorted(file_data, key=lambda x: x[0])
#files_in_directory = os.listdir(coursePath)
#print(files_in_directory)
#print(file_data)
#path = coursePath
## Iterate over the sorted file data and rename the files
#for new_index, (_, name) in enumerate(file_data, start=1):
#    # Find the file in the directory
#    files_in_directory = os.listdir(coursePath)
#    matching_files = [file for file in files_in_directory if name in file]
#    print(matching_files)
#    if matching_files:
##        # Rename the file with the desired index
#        old_file_name = matching_files[0]
#        old_file_name = os.path.join(path,old_file_name)
#        new_file_name = f'{new_index}_{name}'
#        new_file_name = os.path.join(path,new_file_name)
#        print(old_file_name,"==>",new_file_name)
#        #os.rename(old_file_name, new_file_name)
#    else:
#        print("\n",new_index,"\n")

for item in file_data:
    for key, value in item.items():
        try:
            print(key,value,item)
            old_file_name = value 
            old_file_name = os.path.join(coursePath,old_file_name)
            new_file_name = f'{key}_{value}'
            new_file_name = os.path.join(path,new_file_name)
            #print(old_file_name,"==>",new_file_name)
            print(old_file_name)
            print(new_file_name)
            #os.rename(old_file_name, new_file_name)     
        except Exception as e:
            print(e) 
            print(key)
            #print(value,end="\n")
        #print(key,value)
        #filename = value
        #new_filename = f"{key}_{filename}"
        #os.rename(filename, new_filename)
        #item[key] = new_filename
        
