import string


def encode(input_str, offset):
    return map(lambda c: (string.lowercase.index(c) + offset) % 26, input_str)


def decode(indexes, offset):
    return "".join(map(lambda i: string.lowercase[(i - offset) % 26], indexes))


def encode_imp(input_str, offset):
    result = []
    for c in input_str:
        result.append((string.lowercase.index(c) + offset) % 26)
    return result


def decode_imp(indexes, offset):
    result = ""
    for i in indexes:
        result += string.lowercase[(i - offset) % 26]
    return result


def encode_lc(input_str, offset):
    return [(string.lowercase.index(c) + offset) % 26 for c in input_str]


def decode_lc(indexes, offset):
    return "".join(string.lowercase[(i - offset) % 26] for i in indexes)


print decode(encode("thelazycrazybrownfoxthingjumped", 123), 123)
print decode_imp(encode_imp("thelazycrazybrownfoxthingjumped", 123), 123)
print decode_lc(encode_lc("thelazycrazybrownfoxthingjumped", 123), 123)
