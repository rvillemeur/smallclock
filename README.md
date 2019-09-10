# smallclock
an animated clock using morphic and string in pharo.

This project was a test for
- using subprocess in pharo
- create a small animation with morphic
- add a sub-menu entry to the global top menu

```smalltalk
Metacello new
				baseline: 'SmallClock';
				repository: 'github://rvillemeur/smallclock/src';
				load
```

![](https://github.com/rvillemeur/smallclock/blob/master/clock1.PNG) goes to ![](https://github.com/rvillemeur/smallclock/blob/master/clock2.PNG) when the user move the mouse, and clock goes back to normal when the user pause the mouse.
