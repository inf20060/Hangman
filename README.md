# CESP Programming Hangman
Projektrepo für die Abgabe in Rechenarchitektur am 05.11.2021

# Authors
Matrikelnummer: 4659023  
Mail: inf20060@lehre.dhbw-stuttgart.de

# IMPORTANT REGARDING VIDEO AND CODE!!!
* The embedded video is a compressed version which seems to a lower the sound quality a bit. For the uncompressed version use the video in the file explorer
* The comments appear to be formated differently than in RARS. In RARS a setting of 3 spaces per tab is used. This may affect the appearence of comments in
  other text editors or github. Like in the images in the documentation the comments are fine for me in RARS.
# Presentation Video
[![presentation video](https://user-images.githubusercontent.com/83594477/140370170-f9075ea2-5073-4a61-ad95-1336af9177b1.PNG)](https://user-images.githubusercontent.com/83594477/140371247-c6562024-aa4f-46e8-92af-856268339f6a.mp4)

# Description
Bei dem Code handelt es sich um eine Eingeschränkte Umsetzung des Spiels Hangman in RISC-V Assembler. Hangman ist ein Spiel, das von mindestens zwei Spielern gespielt wird. Dabei denkt sich einer Spieler ein Wort aus. Dieses Länge des Wortes präsentiert der Spieler den anderen durch Unterstriche.
  
Die anderen Spieler haben die Aufgabe, durch das Erraten von einzelnen Buchstaben, herauszufinden um welches Wort es sich dabei handelt. Gewonnen haben die Spieler, wenn sie das Wort erraten haben. Verloren haben sie dagegen, wenn sie eine bestimmte Anzahl an Fehlversuchen machen. Die Anzahl an Fehlversuchen wird durch den Hangan angezeigt, der sich bei jedem Fehlversuch um einen Strich vervollständigt.

![Hangman](https://user-images.githubusercontent.com/83594477/140392018-9eea97ef-1a24-4ae5-8609-090af4108f17.jpg)

## What's the difference between the real version
* Das Spiel wird gespielt im Einzelspieler gegen den Computer
* Der Computer nimmt ein zufälliges Wort aus einer Liste heraus und präsentiert das dem Spieler
* Es gibt keine Zeichnung von den Hangman. Die Fehlversuche werden als nummerischer Wert ausgegeben
* Der Zeichensatz beschränkt sich auf lateinische Kleinbuchstaben von 'a' bis 'z'

## What is used?
* Das Programm wurde in RARS entwickelt, getestet und ausgeführt
* Für das Spiel benötigt wird das Keyboard-Interface von RARS
* Für die Programmausgabe wird die Konsole verwendet.

## How to run?
* Der Startpunkt befindet sich in der Controller.asm
* Nach dem Ausführen sollten 2[3] Zeilen erscheinen  
  * User Prompt zur Eingabe und die Länge des Wortes als Unterstriche
  * Die Anzahl der Versuche die dem Nutzer zur Verfügung stehen
  * [Das versteckte Wort (zur Vorführung)]
 
  
* Sind die 2[3] Zeilen zu sehen, dann kann über das Keyboard-Interface das Spiel gespielt werden
* Dazu einfach wie im Video den Buchstaben ins Textfeld eintragen
* Die Ausgabe des Spiels aktualisiert sich mit der Eingabe eines Buchstaben automatisch
  
  
!!! Um das Spiel neuzustarten muss das Programm neu gestartet werden  
!!! Wie das Spiel gespielt wird kann auch dem Video entnommen werden

Die Ausgabe des versteckten Worts ist aus Vorführungszwecken beabsichtigt. Der Bereich, wo die Ausgabe des versteckten Wortes stattfindet, ist durch einen Kommentar  in der Controller.asm [main function] gekennzeichnet
* Das Entfernen dieses Abschnittes führt dazu, dass das Wort nicht mehr angezeigt wird.
* Das Entfernen dieses Abschnittes hat keinen Einfluss auf die Ausführbarkeit des Codes

# Files
## Code - Files
* Hangman/controller.asm         - Main-Datei. Koordiniert den Spielablauf
* Hangman/words.asm              - Wort-Operationen und Nachrichten-Handler
* Hangman/game.asm               - Enthält Spielfunktionen
* Hangman/interactive.asm        - Nimmt User-Input entgegen
  
## Unittest - Files  
replace[game.asm]:  
* Hangman/unittest_replace.asm   - Unittest der replace function in game.asm
* Hangman/unittest_replace.json  - Zugehörige JSON 
* screenshots/replace.png        - Unittest Image  
    
after_last_address[words.asm]:  
* Hangman/unittest_after_last_address.asm   - Unittest der after_last_address function in words.asm
* Hangman/unittest_after_last_address.json  - Zugehörige JSON
* screenshots/after_last_address.png        - Unittest Image  
  
check[game.asm]:  
* Hangman/unittest_check.asm   - Unittest der check function in game.asm
* Hangman/unittest_check.json  - Zugehörige JSON
* screenshots/check.png        - Unittest Image  
  
get_random_word[words.asm]:  
* Hangman/unittest_get_random_word.asm   - Unittest der get_random_word function in words.asm
* Hangman/unittest_get_random_word.json  - Zugehörige JSON
* screenshots/get_random_word.png        - Unittest Image  
  
  
## Others - Files
* dokumentation              - Dokumentation zum Code
* präsentationsvideo         - Präsentationsvideo

# Unittest
replace function
![replace function unittest](https://github.com/inf20060/Hangman/blob/main/Screenshots/replace.PNG)

after_last_address function
![after_last_address function unittest](https://github.com/inf20060/Hangman/blob/main/Screenshots/after_last_address.PNG)

check function
![check function unittest](https://github.com/inf20060/Hangman/blob/main/Screenshots/check.PNG)

get_random_word function
![get_random_word function unittest](https://github.com/inf20060/Hangman/blob/main/Screenshots/get_random_word.PNG)
