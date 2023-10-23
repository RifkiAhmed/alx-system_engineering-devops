#!/usr/bin/python3
"""
    Extend Python script in 0-gather_data_from_an_API.py file to export data
    in the JSON format.
"""


if __name__ == "__main__":
    import json
    import requests
    from sys import argv

    url = "https://jsonplaceholder.typicode.com"
    userId = argv[1]
    employee = requests.get(
            "{}/users/{}".format(url, userId)).json().get("username")
    tasks = requests.get("{}/todos?userId={}".format(url, userId)).json()
    my_list = [{
        "task": dict.get("title"),
        "completed": dict.get("completed"),
        "username": employee}
        for dict in tasks]

    filename = "{}.json".format(userId)
    with open(filename, 'w') as json_file:
        json.dump({userId: my_list}, json_file)
