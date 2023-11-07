#!/usr/bin/python3
"""
    Request Reddit API subreddits
"""


def number_of_subscribers(subreddit):
    """Return the number of subscribers for a given subreddit"""
    import requests

    header = {
        "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) \
            AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 \
                Safari/537.36 Edg/119.0.0.0"
    }
    url = 'https://www.reddit.com/r/{}/about.json'.format(subreddit)
    try:
        response = requests.get(url, headers=header, allow_redirects=False)
        subscribers = response.json().get('data').get('subscribers')
        return subscribers
    except Exception:
        return 0
