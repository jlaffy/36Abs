import collections
from prettytable import PrettyTable

# upon running script:
# info function where default measures are defined
# and if names or rounds are to be changed at any point throughout the
# game, what to type.
# score_sheet = PrettyTable()


# def call_method(object, name):
        getattr(object, name)()

# s = score()
# m = manual()
# t = table()

# call_method(s, 'score')
# call_method(t, 'table')
# call_method(m, 'manual')

def yes_or_no(
    confirmation,
    yes_fun=None,
    no_fun=None,
    ask_fun=None,
    arg1=None,
    arg2=None
):
    if confirmation == 'y':
        yes_fun(arg1)
    elif confirmation == 'n':
        no_fun(arg2)
    else:
        ask_fun(arg1)


def nested_dict():
    return collections.defaultdict(nested_dict)


def name_dicts(names):
    for name in names:
        name = nested_dict()
        return name
    return name


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

    confirm_names(names, more='more ')


def change_names(names):
    changes = raw_input(
        'Which name(s) do you want to change? '
        'Multiple names should be space-separated.: '
    )

    changes = changes.split(' ')
    tmpNames = names

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


def confirm_names(names, more=''):
    confirmation = raw_input(
        'Do you wish to change any ' + more + 'player names? (y or n): '
    )
    yes_or_no(
        confirmation,
        yes_fun=change_names,
        no_fun=name_dicts,
        ask_fun=confirm_names,
        arg1=names,
        arg2=names
    )


def name_players(number):
    names = []

    for i in range(int(number) + 1)[1:]:
        i = str(i)
        name = raw_input('Name player ' + i + ': ')
        names.append(name)

    confirm_names(names)


def confirm_number(number):
    number = str(number)

    confirmation = raw_input(
        'The number you entered is ' + number + '. Is this correct? (y or n): '
        )

    yes_or_no(
        confirmation,
        yes_fun=name_players,
        no_fun=get_player_number,
        ask_fun=confirm_number,
        arg1=number
    )


def get_player_number(arg=None):
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


welcome()
