# utils/validator.py
import re

def is_valid_url(url):
    pattern = re.compile(
        r"^(http|https)://"
        r"(\w+\.)+\w+(/\S*)?$"
    )
    return bool(pattern.match(url))
