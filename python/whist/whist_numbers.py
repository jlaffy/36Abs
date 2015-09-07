# at hand 1 and every fourth hand, player to deal
import random

suits = ['Diamonds', 'Clubs', 'Hearts', 'Spades']


def calculate_score(dictList):
    for name, dictname in dictList:
        expected = dictname['Expected']
        observed = dictname['Observed']
        scoreChange = dictname['Score Change']
        scoreCum = dictname['Score']

        for expect in expected:
            for observe in observed:
                if expect == observe == 0:
                    score = 1
                elif expect == observe:
                    score = 2 * expect
                else:
                    if expect > observe:
                        score = 2 * (observe - expect)
                    elif expect < observe:
                        score = 2 * (expect - observe)

        scoreChange.append(score)
        totalScore = sum(scoreChange)
        scoreCum.append(totalScore)
        print name, dictname


def tricks(dictList, names="", trickType='Expected'):
    print "=== " + trickType + ' Tricks ==='

    for name, dictname in dictList:
        trickNumber = raw_input(name + ': ')
        trickList = dictname[trickType]
        print dictname
        trickList.append(int(trickNumber))

    if trickType == 'Expected':
        tricks(dictList, trickType='Observed')
    elif trickType == 'Observed':
        calculate_score(dictList)
        start_hand(dictList, names)


def player_to_deal(names, trickList, dictList):
    if len(trickList) == 0:
        dealer = random.choice(names)
        for i, a in enumerate(names):
            if names[i] == dealer:
                index = i
    elif len(trickList) > 0:
        index = index % len(names)
        dealer = names[index]

    print dealer + ' to deal.'
    index = index + 1
    tricks(dictList, names)


def start_hand(dictList, names, trickType='Expected'):
    for name, dictname in dictList:
        trickList = dictname[trickType]
        hand = len(trickList) + 1
    print '======== HAND ' + str(hand) + ' ========'
    print 'Trump suit: ' + random.choice(suits)

    player_to_deal(names, trickList, dictList)


def name_dicts(names):
    dictList = []

    for name in names:
        dictnamePair = (name, {
            'Expected': [],
            'Observed': [],
            'Score Change': [],
            'Score': []
        })

        dictList.append(dictnamePair)
    start_hand(dictList, names)


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
    inputNames = []
    names = []

    for i in range(int(number) + 1)[1:]:
        i = str(i)
        inputName = raw_input('Name player ' + i + ': ')
        inputNames.append(inputName)

    for inputName in inputNames:
        name = inputName.capitalize()
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
