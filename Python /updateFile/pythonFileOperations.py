#understand file operations, how to open and read and write and make modifications. 

#Task - Update server.conf file when "max connection" : increases from 200 

# What will be the algorithm

# 1 read the file 
# 2 variable - list
# 3 open the file in write mode 
# 4 update max_connection value in the conf file. 


# few function are in build and no need to do pip install or import it in our file like opening a file or closing a file 

def update_server_config (file_path, key, value) :

    with open ( file_path, 'r') as file :

        lines = file.readlines()

    with open ( file_path, 'w') as file :

        for line in lines:

            if key in lines :

                file.write(key + "=" + value)

            else :

                file.write(line)

# will call the function now 

update_server_config("server.conf" , "MAX_CONNECTIONS", "1000")

    


             
