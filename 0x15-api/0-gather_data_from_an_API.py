#!/usr/bin/python3
"""
    Python script that, using this REST API, for a given employee ID,
    returns information about his/her TODO list progress.
"""


if __name__ == "__main__":
    import requests
    from sys import argv

    url = "https://jsonplaceholder.typicode.com"
    userId = argv[1]
    employee = requests.get(
            "{}/users/{}".format(url, userId)).json().get("name")

    tasks = requests.get("{}/todos?userId={}".format(url, userId)).json()
    tasks_done = [dict.get("title") for dict in tasks if dict.get("completed")]

    print("Employee {} is done with tasks({}/{}):".format(
        employee, len(tasks_done), len(tasks)))
    for task in tasks_done:
        print("\t {}".format(task))
