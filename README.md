# Tri Rim

An app integrating AgriTech (rainfall patterns chart), HealthTech (bmi calculator), EdTech (self-assesment flashcards)


## Run Locally

Clone the project

```bash
  git clone https://github.com/SilverDragonOfR/TriRim.git
```
Open it using Android Studio Code (make sure to have Flutter SDK)

Install dependencies

```bash
  flutter pub get
```
Start the app using Chrome/Emulator


## Installation

Download the .apk file and run it
## Features and Reusable Widgets

### Home

- A Slider Widget which takes us to new screen on swiping. It can it used as a password unlocker, Payments button, wherever we want the user to "think before clicking."

### Rainfall Chart

- A Fl Line Chart Widget which was used to display the rainfall data. It has various properties witch are aspect ratio, color of line , maxX, maxY, titles, etc. It can be used to make investment charts, sugar level apps.

- A Location Service which performs abstraction and provides location data. It has various uses like Google Maps clone, Weather apps, Night Sky apps

### BMI

- A slider which has a min and max value connected to global variable and dynamic update on dragging. It can be used as donation slider, Hue-Saturation-Brightness slider in image editing app, Volume control in music app

- A Text Box with two texts horizontally and two fonts. It can be used in Notes app, Whatapp clone, pdf editor app

### Flashcard

- One side of a flashcard view. Can be used to make dice, Instagram reels.

- A change outlined button which can handle any given event. Used in Back button, Random number generator app, Camera app.
## Authors

- [@SilverDragonOfR](https://github.com/SilverDragonOfR/)


## Acknowledgements

### Dependencies:
- flutter:
    - sdk: flutter
- flip_card: ^0.7.0
- hive: ^2.2.3
- hive_flutter: ^1.1.0
- location: ^5.0.3
- http: ^1.1.0
- fl_chart: ^0.63.0
- intl: ^0.18.1
- slide_action: ^0.0.2
- cupertino_icons: ^1.0.2

### Dev Dependencies:
- flutter_test:
    - sdk: flutter
- hive_generator: ^2.0.1
- build_runner: ^2.4.6
- flutter_flushbar: ^0.0.2
- flutter_lints: ^2.0.0

### API
- Open Meteo's Free Historical Weather API

### Database
- Hive
