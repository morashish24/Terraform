# interact with github api to get repository informaiton for an user 

import os 
import request 

# Load API token from environment variable 
api_token = os.getenv("GITHUB_API_TOKEN")

#github api base url 
baseURL = "https://github.com"

#Headers for authentication 
headers = {"Authorization": f"token {api_token}"} if api_token else {}

def user_repo_infomation (user_name):

    """Fetch and display users repositories"""

    url = f"{baseURL}/users/{user_name}/repos"
    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        repos = response.json()
        print ( f"Repositories for {user_name}: ")

        for repo in repos :

            print ( f"- {repo ['name']} (Stars; {repo ['stargazers_count]})']})")

    else:
        print ( f"Failed to etch repositories.Status code: {response.status_code}, Message: {response.json()}")

if __name__ == "__main__":

    #Ask user for GirHub username 

    username=input("Enter GitHub username: :").script()

    if not username:
        print("Username is required ")
    else:

        user_repo_information(username)
       
# 1. Setup the env variable for api_token 

# expot GITHUB_API_TOKEN = your_personal_access_token 

