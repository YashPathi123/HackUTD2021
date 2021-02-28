import json

import requests

BASE = "http://127.0.0.1:5000/"

# Putting 1 random users in user DB.
'''
input()
response = requests.put(BASE + "user/rvilla",
                        {'firstname': 'Rishi', 'lastname': 'Villa', 'university': 'University of Texas at Dallas', 'password': 'rishivilla'})
print(response.json())

input()
response = requests.put(BASE + "user/rvilla",
                        {'firstname': 'Rishi', 'lastname': 'Villa', 'university': 'University of Texas at Dallas', 'password': 'rishivilla', 'id': 1})
print(response.json())

input()
response = requests.put(BASE + "user/ypathi",
                        {'firstname': 'Yash', 'lastname': 'Pathi', 'university': 'University of Texas at Dallas', 'password': 'BOOP', 'id': 2})
print(response.json())
'''
'''
input()
response = requests.put(BASE + "user/rvilla", {'firstname': 'Rishi', 'lastname': 'Villa', 'university': 'University of Texas at Dallas', 'password': 'rishivilla'})
print(response.json())

input()
response = requests.put(BASE + "user/ypathi", {'firstname': 'Yash', 'lastname': 'Pathi', 'university': 'University of Texas at Dallas', 'password': 'YashP'})
print(response.json())

input()
response = requests.get(BASE + "user/rvilla")
print(response.json())

input()
response = requests.get(BASE + "user/ypathi")
print(response.json())




input()
response = requests.get(BASE + "userid/rvilla")
print(response.json())
'''
'''
input()
response = requests.get(BASE + "posts/ypathi")
print(response.json())

input()
response = requests.get(BASE + "posts/ypathi")
print(response.json())

input()
responseid = response.json()
#print(responseid['id'])
responseid=responseid['id']
print(responseid)
input()
response1 = requests.put(BASE + "posts/ypathi", {'description': 'Broken water pipes', 'urgencyrating': 5, 'id': responseid})
print(response1.json())


'''
'''
input()
response = requests.put(BASE + "posts/rvilla", {'description': 'Hey guys, I am a sophomore pursuing a computer science major. I am currently working on a project involving express, aws, and mongodb. This is what we have so far, We store the interests of people as well as their faces in a database. When you hover over their face with your camera, it shows a list of interests that are shared between the two individuals.Getting the AR to work nicely was a lot harder than we thought and took a large chunk of our time. We also needed to transfer large amounts of data in a very short time so compressing and reducing the quality just enough for the application to still work was a hard balance to find. Please contact me if you are interested in the idea or any of the technologies used. The vision for this project is open-ended so feel free to add to it.', 'priority': 'low'})
print(response.json())

input()
response = requests.put(BASE + "posts/ypathi", {'description': 'Pipes need to be fixed', 'priority': 'high'})
print(response.json())

input()
response = requests.get(BASE + "postsGetDes/2")
print(response.json())
'''
'''
input()
response = requests.get(BASE + "posts/rvilla")
print(response.json())

input()
response = requests.get(BASE + "postsGetDes/2")
print(response.json())

input()
response = requests.patch(BASE + "posts/ypathi", {'replies': 'Please use a wrench to fix your pipe', 'link': ''})
print(response.json())


'''
input()
response = requests.get(BASE + "posts/ypathi")
print(response.json())