## 1. GitHub Repository Link
https://github.com/yvonexyrinenobleza-netizen/flutter_basics_lab

## 2. The last three build() called lines from Activity 2.

1. build() called: 4 glasses
2. build() called: 5 glasses
3. build() called: 6 glasses

## 3. Your observations from the experiments in Activities 2, 3 and 5.

Activity 2 — Water Tracker

At first, the number of glasses was 0. When I pressed the button, the number increased. When I reached 6 glasses, the tracker showed that I had reached my goal. I learned that setState() updates the screen when the value changes.

Activity 3 — Weather Dashboard

The weather information was arranged using Rows and Columns. The four stat boxes were placed beside each other using Expanded. When I removed Expanded, the layout changed. I learned that these widgets help arrange the items properly on the screen.

Activity 5 — Settings Page

I tried switching between light mode and dark mode. The colors of the page changed when I switched the theme. I also tested the Save button and saw the SnackBar message. I learned that Flutter can change the app's appearance using ThemeData.


## 4. Your answers to the ten review questions.

### 1. What is the difference between a StatelessWidget and a StatefulWidget? Give one example of each from this lab.

A StatelessWidget does not change its data. An example is ProfileCard in Activity 1. A StatefulWidget can change its data. An example is the Water Tracker in Activity 2.

### 2. Why is a StatefulWidget written as two classes? What does each class do?

The first class defines the widget. The second class manages the state and builds the screen.

### 3. In Activity 2, what happened when you changed _glasses outside setState()? Why?

The screen did not update automatically because setState() was not used to tell Flutter about the change.

### 4. Looking at the Debug Console in Activity 2, when is build() called?

The build() method is called when the screen needs to be created or updated.

### 5. Explain the main axis and the cross axis of a Row and of a Column.

In a Row, the main axis is horizontal and the cross axis is vertical. In a Column, the main axis is vertical and the cross axis is horizontal.

### 6. In Activity 3, what happened when you removed Expanded from a StatBox? What does Expanded do?

The StatBox layout changed because it no longer shared the available space in the same way. Expanded helps the widget use the available space.

### 7. Why do we use GridView.builder for the menu instead of a Column with many children?

GridView.builder arranges the menu items in a grid and builds items when needed. It is useful for displaying many items.

### 8. How do Stack and Positioned create the Best seller badge in Activity 4?

Stack places widgets on top of each other. Positioned places the Best seller badge in a specific position.

### 9. What is the difference between customizing with ThemeData and with a style on one widget? Give one example of each from Activity 5.

ThemeData changes the general appearance of the app, like its colors. A widget style changes only one widget, like the style of one button.

### 10. When you flip the dark-mode switch in Activity 5, which widget holds the state, and how does the change reach MaterialApp?

The State object of ThemeDemoApp holds the dark-mode value. When the switch changes, setState() updates the value and MaterialApp uses the selected theme.


