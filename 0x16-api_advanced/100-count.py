#!/usr/bin/python3
"""
    Query the Reddit API, parses the title of all hot articles, and prints
    in descending order the count of given keywords (case-insensitive)
"""


def count_words(subreddit, word_list, after=None, word_counts=None):
    """
        Prints in descending order the count of given keywords
        (case-insensitive) for a given subreddit
    """
    import requests

    header = {
        "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) \
            AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 \
                Safari/537.36 Edg/119.0.0.0"
    }
    url = 'https://www.reddit.com/r/{}/hot.json?limit=100'.format(subreddit)
    if after:
        url = 'https://www.reddit.com/r/{}/hot.json?limit=100&after={}'.format(
            subreddit, after)

    if word_counts is None:
        word_counts = {}
    try:
        response = requests.get(url, headers=header, allow_redirects=False)
        data = response.json()
        children = data.get('data').get('children')
        for post in children:
            title = post.get('data').get('title')
            for word in word_list:
                title = title.lower()
                word = word.lower()
                if word in title:
                    if word_counts.get(word) is None:
                        word_counts[word] = 0
                    word_counts[word] += title.count(word)
        after = data.get('data').get('after')
        if after:
            count_words(subreddit, word_list, after, word_counts)
        for word, count in sorted(word_counts.items(),
                                  key=lambda item: (-item[1], item[0])):
            print('{}: {}'.format(word, count))
        exit(0)
    except Exception:
        pass
