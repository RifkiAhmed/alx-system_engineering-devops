#!/usr/bin/python3
"""
    Extend Python script in 0-gather_data_from_an_API.py file to export data
    in the CSV format.
"""


if __name__ == "__main__":
    import csv
    import requests
    from sys import argv

    url = "https://jsonplaceholder.typicode.com"
    userId = argv[1]
    employee = requests.get(
            "{}/users/{}".format(url, userId)).json().get("username")
    tasks = requests.get("{}/todos?userId={}".format(url, userId)).json()

    filename = "{}.csv".format(userId)
    with open(filename, 'w', newline='') as csv_file:
        csvwriter = csv.writer(csv_file, quoting=csv.QUOTE_ALL)
        my_list = []
        for task in tasks:
            my_list.append([
                userId,
                employee,
                task.get("completed"),
                task.get("title")])

        csvwriter.writerows(my_list)
