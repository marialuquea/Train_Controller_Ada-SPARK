# A Train controller written in Ada-SPARK

* Uses Preconditions and Postconditions in order to create a safety critical system
* Compiles at SPARK gold level guaranteeing the absence of run time errors
* Has a console based GUI from where you can control the train, actions will not be accepted unless the preconditions are satisfied.

---

## How to run the program

> UNIX based system

- Execute [file](https://github.com/marialuquea/FASE/blob/master/src/main.adb) from your terminal, with `./main`.

> Windows based system:

- Compile and run code in GNAT programming studio.

---

## Controller Structure
* Program specification with preconditions and postconditions: [file](https://github.com/marialuquea/FASE/blob/master/src/trains.ads)
* Program implementation with procedures and functions: [file](https://github.com/marialuquea/FASE/blob/master/src/trains.adb)
* Main script: [file](https://github.com/marialuquea/FASE/blob/master/src/main.adb)
