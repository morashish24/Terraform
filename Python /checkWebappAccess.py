import requests 

def check_website_status (url ) :
  try:
    response = requests.get(url,timeout=5)
    if response.status_code == 200 :
      print (f"website {url} is UP!")
      
    else:
      print(f"Website {url} is DOWN! Stauts code: {response.status_code}")
  except:
    
    requests.exceptions.RequestException as e:
      
      print(f"Website {url} is DOWN! Error: {e}")
      
      if __name__=="__main__":
        
        
  website_url = "https://example.com"
  
  
check_website_status(website_url)    