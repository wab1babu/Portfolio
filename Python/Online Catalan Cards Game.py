
# Define the function of the menu:
def outputMenu():
    print("s: start new game")
    print("p: Pull cards for all players")
    print("o: output deck")
    print("h: output players' hand")
    print("e: exchange one card")
    print("d: declare winner")
    print("q: quit")
    return


# Define the program:s:start new game
def startNewGame():
    #Prompt the user to enter three players' names
    player1 = input("Enter player 1's name:\n")
    player2 = input("Enter player 2's name:\n")
    player3 = input("Enter player 3's name:\n")
    return player1,player2,player3

# Build a deck of 48 Catalan cards called card_list
card_suit = ["Clubs", "Golds", "Cups", "Swords"]
card_value = [1,2,3,4,5,6,7,8,9,10,11,12]
card_list = [(m,n) for m in card_suit for n in card_value]

#Create an empty hand of cards for each player
player1_hand=[]
player2_hand=[]
player3_hand=[]


import random
# Define the program: p: Pull cards for all players
def pullCards(card_list):
    if len(card_list) >= 9:
        # shuffle the card_list
        random.shuffle(card_list)
        # pull three cards to each player
        player1_hand.append(card_list[0:3])
        player2_hand.append(card_list[3:6])
        player3_hand.append(card_list[6:9])
        new_player1 = player1_hand[0]
        new_player2 = player2_hand[0]
        new_player3 = player3_hand[0]
    return new_player1,new_player2,new_player3


# Define the program:o: output deck
def outputDesk():
    del card_list[0:9]
    new_card=sorted(card_list)
    for i in new_card:
        suit = i[0]
        num = i[1]
        print(suit,num)


#define the program: h: output players’ hand
def outputHand():
    print(player1)
    for j in new_player1:
        suit_pl = j[0]
        num_pl = j[1]
        print(suit_pl,num_pl)
    print()
    print(player2)
    for j in new_player2:
        suit_pl = j[0]
        num_pl = j[1]
        print(suit_pl,num_pl)
    print()
    print(player3)
    for j in new_player3:
        suit_pl = j[0]
        num_pl = j[1]
        print(suit_pl,num_pl)
    print()


# Define the program:e: exchange one card
def exchangeCard(new_player1,new_player2,new_player3):
    # sort the cards of each player first
    new_hand1 = sorted(new_player1, key=lambda x:x[1])
    new_hand2 = sorted(new_player2, key=lambda x:x[1])
    new_hand3 = sorted(new_player3, key=lambda x:x[1])
    # Each player gives its minimum value card to the next player
    new_player1=[new_hand3[0],new_player1[1],new_player1[2]]
    new_player2=[new_hand1[0],new_player2[1],new_player2[2]]
    new_player3=[new_hand2[0],new_player3[1],new_player3[2]]
    # return the output after exchanging cards
    return new_player1,new_player2,new_player3


# Define the program d: declare winner and quit
def declareWinner():
    # calculate the sum of three cards of each player
    sum_player1 = new_player1[0][1] + new_player1[1][1] + new_player1[2][1]
    sum_player2 = new_player2[0][1] + new_player2[1][1] + new_player2[2][1]
    sum_player3 = new_player3[0][1] + new_player3[1][1] + new_player3[2][1]
    #print the output
    print('{} has {} points.'.format(player1,sum_player1))
    print('{} has {} points.'.format(player2,sum_player2))
    print('{} has {} points.'.format(player3,sum_player3))
    # declare the winner
    if sum_player1 > sum_player2:
        if  sum_player1 > sum_player3:
            print('The winner is {} with {} points!'.format(player1,sum_player1))
        else:
            print('The winner is {} with {} points!'.format(player3,sum_player3))
    else:
        if sum_player2 > sum_player3:
            print('The winner is {} with {} points!'.format(player2,sum_player2))
        else:
            print('The winner is "{}" with {} points!'.format(player3,sum_player3))
    return 


# Write the program that uses those functions here
import sys
'''displaying the following menu options
    and prompt the user to select an option'''
outputMenu()
user_choice = input('Select an option:\n')
while user_choice != 'q':
    if user_choice == 's':
        player1, player2, player3 = startNewGame()
        outputMenu()
        user_choice = input('Select an option:\n')
        while user_choice != 'q':
            if user_choice =='s':
                player1, player2, player3 = startNewGame()
            elif user_choice == 'p':
                new_player1,new_player2,new_player3 = pullCards(card_list)
            elif user_choice == 'o':
                outputDesk()
            elif user_choice == 'h':
                outputHand()
            elif user_choice == 'e':
                new_player1,new_player2,new_player3 = exchangeCard(new_player1,new_player2,new_player3)
            elif user_choice == 'd':
                declareWinner()
                sys.exit()
            outputMenu()
            user_choice = input('Select an option:\n')
    elif user_choice=='p' or user_choice=='o' or user_choice=='h' or user_choice=='e' or user_choice=='d':
        print('Please select option s to start a new game')
        outputMenu()
        user_choice = input('Select an option:\n')
    else:
        outputMenu()
        user_choice=input('Select an option:\n')
