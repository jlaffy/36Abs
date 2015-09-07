# import random
import collections
# print table every 4 rounds
# if 'table' is entered, print anyway
# print scores after every round
# if 'scores' is entered, print scores
# ask to play again after
# default rounds is 12, ask whether this should be modified
# after before last player guess is entered, print last player can't say 'X'
# after last player guess is entered, print  'X' over or under
# help function, explaining above.
# at start of new round, say hand 'X', player 'X' to shuffle.


def nested_dict():
    return collections.defaultdict(nested_dict)


def name_dicts(names):
    for name in names:
        name = nested_dict()
        return name
        print type(name)


def new_names(change, tmpNames):
    names = []
    for tmpName in tmpNames:
        if tmpName not in change:
            name = tmpName
        if tmpName in change:
            name = raw_input(
                'Replace ' + tmpName + ' with: '
            )
        names.append(name)

    for name in names:
        print name

    confirm = raw_input('Any more changes? (y or n): ')

    if confirm == 'y':
        change_names(names)
    elif confirm == 'n':
        name_dicts(names)
    else:
        new_names(n


def change_names(tmpNames):
    changes = raw_input(
        'Which name(s) do you want to change? '
        'Multiple names should be space-separated.: '
    )

    changes = changes.split(' ')
    for change in changes:
        if change in tmpNames:
            pass
        elif change not in tmpNames:
            print 'Name does not exist. Try again.'
            change_names(tmpNames)
        else:
            print 'Separate names by " " only.'
            change_names(tmpNames)
    new_names(changes, tmpNames)


def confirm_names(names):
    confirm = raw_input(
        'Do you wish to change any player names? (y or n): '
    )
    if confirm == 'y':
        tmpNames = names
        change_names(tmpNames)
    elif confirm == 'n':
        print names
        name_dicts(names)
    else:
        confirm_names(names)


def name_players(number):
    names = []
    for i in range(int(number) + 1)[1:]:
        i = str(i)
        name = raw_input('Name player ' + i + ': ')
        names.append(name)
    confirm_names(names)


def confirm_number(number):
    number = str(number)
    confirm = raw_input(
        'The number you entered is ' + number + '. Is this correct? (y or n): '
        )
    if confirm == 'y':
        name_players(number)
    elif confirm == 'n':
        get_player_number()
    else:
        confirm_number(number)


def get_player_number():
    number = raw_input('How many players today?: ')
    try:
        number = int(number)
    except:
        print 'Enter an integer this time.'
        get_player_number()
    confirm_number(number)


def welcome():
    print 'ello ello. Welcome to Whist.'
    get_player_number()


# def score(player):
#     observed, expected = player.values()
#     for observe in observed.values():
#         for expect in expected.values():
#             for value in range(len(observe)):
#                 if observe[value] == expect[value] and observe[value] == 0:
#                     score = 1
#                 elif observe[value] > expect[value]:
#                     score = -2 * (observe[value] - expected)
#                 elif observe[value] < expect[value]:
#                     score = 2 * (observe[value] - expect[value])
#                 else:
#                     score = 2 * observe[value]
#                 player["score"][hand] = score
#
# def expect(player, number, hand):
#     tricks = [number]
#     player["expect"][hand] = tricks
#
# def observe(player, number, hand):
#     tricks = [number]
#     player["observe"][hand] = tricks
#     score(player)
#
# def sum():
#     for player in players

welcome()
