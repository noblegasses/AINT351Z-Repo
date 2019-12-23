import numpy as np
from numpy import random
class state:
    def __init__(self, state,grid):
        if (state > 0 and state < 12 and state != 2):
            a = np.argwhere(grid == state)
            self.__X = a[0,1]
            self.__Y = a[0,0]
            self.__worldmap = grid
        else:
            print('invalid input')
            raise ValueError
    def coords(self):
        print(self.__X, self.__Y)
    def return_state(self):
        return self.__worldmap[self.__Y, self.__X]
    def move(self, direction):
        valid = False
        self.__reward = reward_state(self.return_state(), direction)
        if direction == 1 and self.__worldmap[self.__Y-1, self.__X] !=0:
            print('moving North')
            valid = True
            self.__Y -= 1
        elif direction == 2 and self.__worldmap[self.__Y, self.__X+1] !=0:
            print('moving East')
            valid = True
            self.__X += 1
        elif direction == 4 and self.__worldmap[self.__Y, self.__X-1] !=0:
            print('moving West')
            valid = True
            self.__X -= 1
        elif direction == 3 and self.__worldmap[self.__Y+1, self.__X] !=0:
            print('moving South')
            valid = True
            self.__Y += 1
        if valid == False:
            return [valid, self.__reward]
        else:
            return [self.return_state(), self.__reward]
def reward_state(state, action):
    if state == 5 and action == 3:
        return 10
    else:
        return 0
def initQ (state, action):
    return random.rand(state, action)/10
    
