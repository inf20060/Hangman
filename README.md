# CESP Programming Hangman
Projektreposetory für die Abgabe in Rechenarchitektur am 05.11.2021

# Authors
Matrikelnummer: 4659023
inf20060@lehre.dhbw-stuttgart.de

# IMPORTANT REGARDING THE VIDEO!!!
* The embedded video is a compressed version which seems to a lower the sound quality a bit. For the uncompressed version use the video in the file explorer
# Presentation Video
[![presentation video](https://user-images.githubusercontent.com/83594477/140370170-f9075ea2-5073-4a61-ad95-1336af9177b1.PNG)](https://user-images.githubusercontent.com/83594477/140371247-c6562024-aa4f-46e8-92af-856268339f6a.mp4)

# Description
Beim dem Spiel „Hangman“ geht es um mindestens zwei Spieler, die das Wort von einem der
Spieler erraten müssen. Derjenige, der das Wort ausdenkt, zeigt den restlichen Spielern die
Länge des Wortes in Form von Unterstrichen an. Denkt sich einer der Spieler das Wort
„Hangman“ aus, so sehen die restlichen Spieler zu Spielbeginn sieben Unterstriche.
Die restlichen Spieler versuchen durch das Raten von Buchstaben das Wort soweit zu
vervollständigen, dass einer der Spieler das Wort erraten kann. Ob dies in Form eines
Wettkampfes oder als Team stattfindet, ist von der Spielergruppe zu entscheiden.
Wird ein falscher Buchstabe geraten, so vervollständigt sich die Zeichnung. Die Anzahl der
Versuche wird ebenfalls meist von der Spielergruppe ausgemacht. Ist die Zeichnung
vollständig, ist das Spiel verloren. Konnte das Wort erraten werden, ist das Spiel gewonnen. 

## What is used?
* Das Programm wurde in RARS entwickelt, getestet und ausgeführt
* Für das Spiel benötigt wird das Keyboard-Interface von RARS
* Für die Programmausgabe wird die Konsole verwendet.

## How to run?
* Der Startpunkt befindet sich in der Controller.asm
* Nach dem Ausführen sollten drei Zeilen erscheinen
  * User Prompt zur Eingabe und die Länge des Wortes als Unterstriche
  * Die Anzahl der Versuche die dem Nutzer zur Verfügung stehen
  * [Das versteckte Wort (zur Vorführung)]
 
  
* Sind die 2[3] Zeilen zu sehen, dann kann durch das Keyboard-Interface das Spiel gespielt werden
* Dazu einfach wie im Video den Buchstaben ins Textfeld eintragen.
* Die Ausgabe des Spiels aktualisiert sich mit der Eingabe eines Buchstaben automatisch
 

Die Ausgabe des versteckten Worts ist aus Vorführungszwecken beabsichtigt. Der Bereich wo die Ausgabe des versteckten Wortes stattfindet ist durch einen Kommentar gekennzeichnet. 
* Das Entfernen dieses Abschnittes führt dazu, dass das Wort einen nicht mehr angezeigt wird.
* Das Entfernen dieses Abschnittes hat keinen Einfluss auf die Ausführbarkeit des Codes

# Unittest
replace function
![replace function unittest](https://github.com/inf20060/Hangman/blob/main/Screenshots/replace.PNG)

after_last_address function
![after_last_address function unittest](https://github.com/inf20060/Hangman/blob/main/Screenshots/after_last_address.PNG)

check function
![check function unittest](https://github.com/inf20060/Hangman/blob/main/Screenshots/check.PNG)

get_random_word function
![get_random_word function unittest](https://github.com/inf20060/Hangman/blob/main/Screenshots/get_random_word.PNG)
