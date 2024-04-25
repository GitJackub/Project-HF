# Projekt
W ramach projektu bazując na sieci Yolov5 zostały wytrenowane od zera dwa modele yolov5m.pt wykorzystując dataset COCO.\
Pierwszy (main) trenowany był w oparciu o wszystkie kategorie, z czego szybko zrezygnowano ze względu na ilość kategorii.
Drugi (traffic) uczył się na kategoriach: 'car', 'bus', 'truck', 'stop sign', 'motorcycle', 'traffic light'.
Dało to lepsze rezultaty, choć na wykresach ucierpiała precyzja, prawdopodobnie ze względu występowania w tle innego typu obiektów.

Połączenie z bazą danych zostało zrealizowane przez system PostgreSQL oraz bibliotekę Python psycopg2.\
Zmodyfikowany został plik detect.py wykorzystując klasy oraz metody biblioteki.


## Uruchamianie projektu
1. Sklonować do docelowego folderu repozytorium:  ```git clone https://github.com/ultralytics/yolov5.git```
   oraz po przejściu do folderu zainstalować wymagane pliki: ```pip install -r requirements.txt```
2. Sklonować repozytorium projektu:  ```git clone https://github.com/GitJackub/Project-HF.git```
   oraz przenieść pliki do wcześniej utworzonego folderu yolov5 **dokonując podmian**.
3. Zainstalować bibliotekę psycopg2:  ```pip install psycopg2```.
4. Stworzyć bazę danych w systemie **PostgreSQL** (np. wykorzystując pgAdmin 4), a następnie uruchomić po kolei polecenia z pliku **Commands.sql**
5. Skonfigurować plik **database.ini** pod utworzoną bazę danych.
6. Uruchomić testowo komendę:  ```python detect.py --weights runs/train/traffic4/weights/best.pt --conf 0.5 --source detection/img1.jpg```
7. Wykonując polecenie **SELECT**, sprawdzić zliczenie obiektów w bazie i porównać z wynikami w ```runs/detect/exp/img1.jpg```


Credits : https://github.com/ultralytics/yolov5.git
