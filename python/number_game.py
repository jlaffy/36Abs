import random

def input_valid(hirange, lowrange):
    guess = ""
    while guess == "":
        guess = try_input(hirange, lowrange)
    return guess

def try_input(hirange, lowrange):
    t = raw_input('Guess a number between 0 and 100: ')
    try:
        t = int(t)
    except:
        print "The number you entered was incorrect"
        return ""
    if t < lowrange or t > hirange:
        print "You must enter a number within the current range"
        return ""
    else:
        return t

def guess_game():
    hirange = 100
    lowrange = 0
    chosen = random.randint(0,100)
    game_over = False

    while game_over == False:
        g = input_valid(hirange, lowrange)

        if g == chosen:
            print 'oh no! you said the chosen number: ' + str(chosen) + '. You lose!'
            game_over = True

        elif g >= chosen:
            hirange = (g - 1)

            if hirange == chosen:
                print 'oh no! i said the chosen number: ' + str(chosen) + '. You win!'
                game_over = True

            else:
                print str(lowrange)+' < chosen < '+ str(hirange)

        elif g <= chosen:
            lowrange = (g + 1)

            if lowrange == chosen:
                print 'oh no! i said the chosen number: ' + str(chosen) + '. You win!'
                game_over = True

            else:
                print str(lowrange)+' < chosen < '+ str(hirange)

play_again = raw_input("Would you like to play again? Enter 'y' or 'n'")

def next_game():
    while play_again != 'y' or play_again != 'n':
        play_again = raw_input("Would you like to play again? Enter 'y' or 'n'")

    elif play_again == 'y':
        guess_game()

guess_game()
next_game()
