import 'dart:io';
import 'dart:core';
import 'dart:math';
import 'dart:convert';

void main() {
/*In a previous exercise we explored the idea of using a list of lists as a “data structure” to store information about a tic tac toe game. 
  In a tic tac toe game, the “game server” needs to know where the Xs and Os are in the board, 
  to know whether player 1 or player 2 (or whoever is X and O) won.

  There has also been an exercise (17) about drawing the actual tic tac toe 
  gameboard using text characters.

  The next logical step is to deal with handling user input. When a player (say player 1, who is X) 
  wants to place an X on the screen, they can’t just click on a terminal. 
  So you are going to approximate this clicking simply by asking the user for a 
  coordinate of where they want to place their piece. */

  void drawGameField(List<List<String?>> drawField, int currentPlayer) {
    var move;
    currentPlayer == 1 ? move = 'X' : move = 'O';

    stdout.write("Choose coordinate to play your move: ");
    List? makeChoice = stdin.readLineSync()!.split(" ");

    drawField[int.parse(makeChoice[0])][int.parse(makeChoice[1])] = move;
    print(drawField);
  }

  List<List<String?>> initialBoard = List.generate(
    3,
    (_) => List.generate(3, (_) => ' '),
  );
  drawGameField(initialBoard, 1);
/*As you may have guessed, we are trying to build up to a full tic-tac-toe board.
For now, we will simply focus on checking whether someone has WON the game, 
not worrying about how the moves were made.
If a game of Tic Tac Toe is represented as a list of lists, like so:
game = [[1, 2, 0],
        [2, 1, 0],
        [2, 1, 1]]
where a 0 means an empty square, a 1 means that player 1 put their token in that space, 
and a 2 means that player 2 put their token in that space.
Your task: given a 3 by 3 list of lists that represents a Tic Tac Toe game board, 
tell whether anyone has won, and tell which player won, if any.

A Tic Tac Toe win is 3 in a row - either in a row, a column, or a diagonal. 
Don’t worry about the case where TWO people have won - assume 
that in every board there will only be one winner. */

  List<List<int>> gameBoard = [
    [1, 2, 0],
    [2, 1, 0],
    [2, 1, 0]
  ];

  bool rowCheck(List<List<int>> checkEachRow) {
    for (List<int> row in checkEachRow) {
      if (row.toSet().length == 1) return true;
    }
    return false;
  }

  List<List<int>> transpose(List<List<int>> checkEachColumn) {
    return [
      for (var i = 0; i < checkEachColumn.length; i++)
        [for (List<int> r in checkEachColumn) r[i]]
    ];
  }

  List<List<int>> diagonals(List<List<int>> checkDiagonal) {
    return [
      [for (var i = 0; i < checkDiagonal.length; i++) checkDiagonal[i][i]],
      [
        for (var i = 0; i < checkDiagonal.length; i++)
          checkDiagonal[i].reversed.toList()[i]
      ]
    ];
  }

  void winDecisions(List<List<int>> whoWon) {
    if (rowCheck(whoWon)) {
      print("row wins");
    } else if (rowCheck(transpose(whoWon))) {
      print("column wins");
    } else if (rowCheck(diagonals(whoWon))) {
      print("diagonal wins");
    }
  }

  winDecisions(gameBoard);

/*Time for some fake graphics! Let’s say we want to draw game boards that look like this:
   --- --- --- 
  |   |   |   | 
   --- --- ---  
  |   |   |   | 
   --- --- ---  
  |   |   |   | 
   --- --- --- 
  This one is 3x3 (like in tic tac toe).
  Ask the user what size game board they want to draw, and draw it for them to the 
  screen using Dart’s print statement.
*/

  stdout.write("Which board size do you want? :: ");
  int? sizeOfBoard = int.parse(stdin.readLineSync()!);

  createBoardFunc(int sizeOfSquare) {
    String? rowLines = '  --- ';
    String? colLines = '|     ';
    for (var gb = 0; gb < sizeOfSquare; gb++) {
      print(rowLines * sizeOfSquare);
      print(colLines * (sizeOfSquare + 1));
    }

    print("${rowLines * sizeOfSquare}\n");
  }

  createBoardFunc(sizeOfBoard);

/*Create a program that will play the “cows and bulls” game with the user. 
  The game works like this:
  Randomly generate a 4-digit number. Ask the user to guess a 4-digit number. 
  For every digit the user guessed correctly in the correct place, they have a “cow”. 
  For every digit the user guessed correctly in the wrong place is a “bull.”
  Every time the user makes a guess, tell them how many “cows” and “bulls” they have. 
  Once the user guesses the correct number, the game is over. 
  Keep track of the number of guesses the user makes throughout the game and tell the user at the end. 
*/

  stdout.write(
      "Welcome to the game if you want to exit just type 'exit' and bye bye.\n");

  final random4Digits = Random();
  String? fourDigitList =
      (1000 + random4Digits.nextInt(9999 - 1000)).toString();
  print("Random four digits are $fourDigitList \n");
  var attempts = 0;

  while (true) {
    int cowsCount = 0;
    int bullsCount = 0;
    attempts += 1;

    stdout.write("Enter four digit number and see if you get cow or bull : ");
    String? gameInput = stdin.readLineSync()!;

    if (gameInput == random4Digits) {
      print("Good job, $attempts attempt, keep going \n");
      break;
    } else if (gameInput == 'exit') {
      print("lets go");
      break;
    } else if (gameInput.length != fourDigitList.length) {
      print("Please give four digit number");
      continue;
    }

    for (var c = 0; c < fourDigitList.length; c++) {
      if (fourDigitList[c] == gameInput[c]) {
        cowsCount += 1;
      } else if (fourDigitList.contains(gameInput)) {
        bullsCount += 1;
      }
    }
    print(
        "\nTotal Attemps: $attempts + \nTotal bulls: $bullsCount + \nTotal cows: $cowsCount \n");
  }

/*Write a password generator in Dart. Be creative with how you generate passwords - 
  strong passwords have a mix of lowercase letters, uppercase letters, numbers, and symbols. 
  The passwords should be random, generating a new password every time the user asks 
  for a new password. Include your run-time code in a main method.
  Ask the user how strong they want their password to be. For weak passwords, 
  pick a word or two from a list.
  ! Do not use the generated password in your real accounts. Use 1password.
 */
  stdout.write(
      "How strong do you want your password generated, strong, medium, weak? : ");
  String? passStrength = stdin.readLineSync()!;

  void passwordShufflerFunc(int strength) {
    final randomPassword = Random.secure();
    List<int> intList = List.generate(
      strength,
      (_) => randomPassword.nextInt(250),
    );
    List charList = base64UrlEncode(intList).split('').toList();
    charList.shuffle();
    print("\nYour password is : ${charList.join('')}");
  }

  void passwordGeneratorFunc(String inputString) {
    if (passStrength == 'weak') {
      passwordShufflerFunc(7);
    } else if (passStrength == 'medium') {
      passwordShufflerFunc(10);
    } else if (passStrength == 'strong') {
      passwordShufflerFunc(18);
    } else {
      print('Wrong option chosen, try again');
    }
  }

  passwordGeneratorFunc(passStrength);
/**Write a program (using functions!) that asks the user for a long string containing multiple words.
  Print back to the user the same string, except with the words in backwards order.
  For example, say I type the string:
  My name is Michele
  Then I would see the string:
  Michele is name My */
  stdout.write("Enter a full sentence to reverse it : ");
  String? inputString = stdin.readLineSync()!;

  void reverseLongString(String reverseIt) {
    var revS = reverseIt.split(" ").reversed.toList().join(" ");
    print(revS);
  }

  reverseLongString(inputString);

/*Write a program (function) that takes a list and returns a new list that 
  contains all the elements of the first list minus all the duplicates.*/
  List<int> removeDuplicates(List<int> initList) {
    return initList.toSet().toList();
  }

  final randomList = Random();
  List<int> genRandList = List.generate(
    10,
    (_) => randomList.nextInt(10),
  );

  print("First Generated Random List $genRandList");
  print(
      "Second reorganized list using .toSet() method ${removeDuplicates(genRandList)}");

/*Find out the longest string out of a List */

  var ofStrings = ['a', 'bc', 'def'];
  var lngth = 0;
  var longestString;

  for (var i = 0; i < ofStrings.length; i++) {
    if (ofStrings[i].length > lngth) {
      var lngth = ofStrings[i];
      longestString = ofStrings[i];
    }
    print(longestString);
  }

/*Write a program that asks the user how many Fibonnaci numbers to generate and 
  then generates them. Take this opportunity to think about how you can use functions.
  Make sure to ask the user to enter the number of numbers in the sequence to generate.*/

  int fabbonaciSeries(int num) {
    if (num < 2) {
      return num;
    } else {
      return fabbonaciSeries(num - 1) + (num - 2);
    }
  }

  stdout.write("\nEnter any number for finding its fabonacci series: ");
  int? anyNumber = int.parse(stdin.readLineSync()!);

  if (anyNumber <= 0) {
    print("Invaild number given, try agian");
  } else {
    for (var n = 0; n < anyNumber; n++) {
      print(fabbonaciSeries(n));
      continue;
    }
  }

/* ===============================OR=============================== */

  List<int> faboSeries(int num) {
    List<int> faboList = [1, 1];

    for (var f = 0; f < num; f++) {
      faboList.add(faboList[f] + faboList[f + 1]);
    }
    return faboList;
  }

  stdout.write("\nEnter any number for finding its fabonacci series: ");
  int? getNum = int.parse(stdin.readLineSync()!);

  List<int> facoraialList = faboSeries(getNum);
  print(facoraialList.toList());

/*Write a program that takes a list of numbers for example
  a = [5, 10, 15, 20, 25]
  and makes a new list of only the first and last elements of 
  the given list. For practice, write this code inside a function.*/

  List<int> newList(List<int> firstAndLast) {
    return [firstAndLast.first, firstAndLast.last];
  }

  final ranomList = Random();
  List<int> list = List.generate(10, (_) => ranomList.nextInt(100));
  print(list);
  print(newList(list));

  print("======= Or =========");

/* ===============================OR=============================== */

  List<int> fAndLUsingFunc(List<int> firstLastOnly) {
    return [firstLastOnly.first, firstLastOnly.last];
  }

  List<int> fAndL = [2, 1, 4, 6, 2, 7, 6];
  print(fAndL.toList());
  print(fAndLUsingFunc(fAndL));

  print("======= Or =========");

/* ===============================OR=============================== */

  Set<int> firLas = {};

  for (var n = 0; n < fAndL.length; n++) {
    if (n == fAndL.first)
      firLas.add(n);
    else if (n == fAndL.last) firLas.add(n);
  }
  print(firLas.toList());

  print("======= == =========");

/*Ask the user for a number and determine whether the number is prime or not.
  Do it using a function */
  print("Enter number to find it out weather its prime or not");
  int? chosenNum = int.parse(stdin.readLineSync()!);

  primeOrNot(int checkNum) {
    List<int> a = [
      for (var i = 1; i <= checkNum; i++)
        if (checkNum % i == 0) i
    ];

    a.length == 2
        ? print("\nnumber $chosenNum is prime\n")
        : print("\nnumber $chosenNum is not prime\n");
  }

  primeOrNot(chosenNum);

/*Generate a random number between 1 and 100. Ask the user to guess the number, then 
  tell them whether they guessed too low, too high, or exactly right.
  Keep track of how many guesses the user has taken, and when the game ends, print this out. */

  print("\nType 'exit' if you want to leave the game and start another\n");
  // var list = new List<int>.generate(100, (h) => h + 1);
  // print(list);

  gameIsOn() {
    final rand = Random();
    int randnumber = rand.nextInt(100);
    while (true) {
      print("\nChoose any numnber against the ai\n");
      String? chosenNo = stdin.readLineSync()!;

      if (chosenNo == 'exit') {
        print("\nBye");
        break;
      } else if (int.parse(chosenNo) > 100) {
        print("\nChoose a number 1 - 100 only\n");
      } else if (int.parse(chosenNo) > randnumber) {
        print(
            "\nGood you won the game.\n Your number: $chosenNo\n ai Number: $randnumber\n");
        continue;
      } else if (int.parse(chosenNo) < randnumber) {
        print(
            "\noops better luck next time\nYou number: $chosenNo\n ai Number: $randnumber\n");
      }
    }
  }

  gameIsOn();

/*Make a two-player Rock-Paper-Scissors game against computer.
  Ask for player’s input, compare them, print out a message to the winner.*/

  Map<String?, String?> gamerules = {
    "r": "s",
    "s": "p",
    "p": "r",
  };

  final random = Random();

  List<String?> ai = ['r', 's', 'p'];

  while (true) {
    String? compChoice = ai[random.nextInt(ai.length)];
    stdout.write(
        "\nChoose one between rock scissors and paper by typing r s or p respectively");
    String? userChoice = stdin.readLineSync();
    if (userChoice == 'exit') {
      print("\nBye");
      break;
    } else if (!ai.contains(userChoice)) {
      print("invalid input please try again");
      String? userChoice = stdin.readLineSync();
    } else if (compChoice == userChoice) {
      print(
          "Game Draw\n UserChoice: $userChoice \n ComputerChoice: $compChoice");
    } else if (gamerules[compChoice] == userChoice) {
      print(
          "you lost the game \n UserChoice: $userChoice \n ComputerChoice: $compChoice");
    } else if (gamerules[userChoice] == compChoice) {
      print(
          "you won the game \n UserChoice: $userChoice \n ComputerChoice: $compChoice");
    }
  }

/*Let’s say you are given a list saved in a variable:
  a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100].
  Write a Dart code that takes this list and makes 
  a new list that has only the even elements of this list in it.*/

  List<int> onlyeven = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];

  Set<int> evennums = {};

  for (var e in onlyeven) {
    if (e % 2 == 0) evennums.add(e);
    //OR
    // if (e.isEven) evennums.add(e);
  }
  print(evennums.toList());

  /*Take two lists, for example:
    a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
    b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
    and write a program that returns a list that contains only the elements 
    that are common between them (without duplicates). 
    Make sure your program works on two lists of different sizes.*/

  List<int> a1 = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  List<int> b2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

  Set<int> c = {};

  for (var i in a1) {
    for (var j in b2) {
      if (i == j) c.add(i);
    }
  }
  print("\nCommon numbers in the lists are below: \n${c.toList()}\n");

  // Create a program that asks the user for a number and
  // then prints out a list of all the divisors of that number.

  print("enter number of which you want devisors");
  int? numbr = int.parse(stdin.readLineSync()!);
  Set<int> set = {};

  for (var i = 1; i <= numbr; i++) {
    if (numbr % i == 0) set.add(i);
  }
  print(set.toList());

  print("\n============================================");

  /*Take a list, say for example this one:
    a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
    and write a program that prints out all the elements of the list that are less than 5.*/

  List<int> a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  Set<int> lessthan = {};

  for (var i in a) {
    if (i < 30) lessthan.add(i);
    //print(a.where((i) => i < 5));
  }
  print(lessthan.toList());

  print("\n============================================");

  /*Ask the user for a number.
    Depending on whether the number is even or odd,
    print out an appropriate message to the user.*/
  stdout.write("Enter any number: ");
  int? num = int.parse(stdin.readLineSync()!);

  if (num.isEven) {
    print("Did you know your input was an even number which is: $num");
  }
  if (num.isOdd) {
    print("Did you know your input was an odd number which is: $num");
  }

  print("\n============================================");

  // Create a program that asks the user to enter their name and their age.
  // Print out a message that tells how many years they have to be 100 years old.
  stdout.write("What's your name?");
  String? name = stdin.readLineSync()!;

  stdout.write("O, hello Mr.$name, how old are you?");
  int? age = int.parse(stdin.readLineSync()!);

  int? ageTo100 = 100 - age;
  print("After $ageTo100 years you will be hundred years old IA, if you live.");

  print("\n============================================");
}
