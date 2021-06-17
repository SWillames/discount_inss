EMAIL_FORMAT = /
\A
[a-z0-9]+                     # 1
([-._][a-z0-9]+)*              # 2
(\+[^@]+)?                    # filter
@                             # 3
[a-z0-9]+                     # 4
([.-][a-z0-9]+)*              # 4
\.[a-z]{2,6}                  # 5
\Z
/xi

FULL_NAME_FORMAT = /[a-zA-Z]{2,}\s[a-zA-Z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?/