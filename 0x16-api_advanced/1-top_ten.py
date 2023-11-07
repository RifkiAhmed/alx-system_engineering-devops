#!/usr/bin/python3
"""
    Request top ten posts of a subreddit from Reddit API
"""


def top_ten(subreddit):
    """Return the first 10 posts for a given subreddit"""
    import requests

    header = {
        "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) \
            AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 \
                Safari/537.36 Edg/119.0.0.0"
    }
    url = 'https://www.reddit.com/r/{}/hot.json?limit=9'.format(subreddit)
    try:
        response = requests.get(url, headers=header, allow_redirects=False)
        childrens = response.json().get('data').get('children')
        for children in childrens:
            print(children.get('data').get('title'))
    except Exception:
        print(None)
