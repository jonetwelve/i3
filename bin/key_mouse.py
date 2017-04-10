#!/usr/bin/env python
# coding=utf-8


import pyautogui
import warnings
import sys
import random


warnings.filterwarnings('ignore')



class KeyMouse( object ):
    def __init__(self, inpt):
        self.inpt = inpt
        self.width, self.height = pyautogui.size(  )

    def run(self):
        if self.inpt.lower() == 'x':
            self.show_mouse()
        elif self.inpt.lower() == 'u':
            self.scroll_up()
        elif self.inpt.lower() == 'd':
            self.scroll_down()
        elif self.inpt == 'j':
            self.move_down()
        elif self.inpt == 'J':
            self.move_down(True)
        elif self.inpt == 'h':
            self.move_left()
        elif self.inpt == 'H':
            self.move_left(True)
        elif self.inpt == 'k':
            self.move_up()
        elif self.inpt == 'K':
            self.move_up(True)
        elif self.inpt == 'l':
            self.move_right()
        elif self.inpt == 'L':
            self.move_right(True)
        elif self.inpt == 'zuo':
            self.left_click()
        elif self.inpt == 'you':
            self.right_click()
        elif self.inpt == 'm':
            self.move_middle()
            

    def move_left( self, lang = False ):
        if lang:
            sk = 100
        else:
            sk = 11
        x,y = pyautogui.position()
        x -= sk
        pyautogui.moveTo(x,y)


    def move_right( self, lang = False ):
        if lang:
            sk = 100
        else:
            sk = 11
        x,y = pyautogui.position()
        x += sk
        pyautogui.moveTo(x,y)

    def move_up( self, lang = False ):
        if lang:
            sk = 100
        else:
            sk = 11
        x,y = pyautogui.position()
        y -= sk
        pyautogui.moveTo(x,y)

    def move_down( self, lang = False ):
        if lang:
            sk = 100
        else:
            sk = 11
        x,y = pyautogui.position()
        y += sk
        pyautogui.moveTo(x,y)

    def move_middle(self):
        pyautogui.moveTo(self.width / 2, self.height / 2)

    def left_click( self ):
        pyautogui.click()

    def right_click( self ):
        pyautogui.rightClick()

    def scroll_up( self ):
        pyautogui.scroll(10)

    def scroll_down( self):
        pyautogui.scroll(-10)

    def show_mouse( self):
        x, y = pyautogui.position()
        i = 15
        while i > 0:
            new_x = x + random.randint(0,52)
            new_y = y + random.randint(0,52)
            pyautogui.moveTo(new_x, new_y)
            i-=1
        pyautogui.moveTo(x,y)



inpt = sys.argv[1] if len(sys.argv) > 1 else 'x'
obj = KeyMouse(inpt)
obj.run(  )
