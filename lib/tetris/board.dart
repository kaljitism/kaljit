import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kaljit/tetris/piece.dart';
import 'package:kaljit/tetris/pixel.dart';
import 'package:kaljit/tetris/values.dart';

/*
* GAME BOARD
*
* This is a 2x2 grid with null representing the empty space.
* A non empty space will have the color to represent the landed piece
* */

// Game Board
List<List<Tetromino?>> gameBoard = List.generate(
  columnLength,
  (i) => List.generate(rowLength, (j) => Tetromino.empty),
);

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  // Current Tetris Piece
  Piece currentPiece = Piece(type: Tetromino.T);

  // current score
  int currentScore = 0;

  bool gameOver = false;

  @override
  void initState() {
    super.initState();

    // starting the game when app starts
    startGame();
  }

  void startGame() {
    currentPiece.initializePiece();

    //  frame refresh rate
    Duration frameRate = const Duration(milliseconds: 700);
    gameLoop(frameRate);
  }

  void gameLoop(Duration frameRate) {
    Timer.periodic(
      frameRate,
      (timer) {
        if (!mounted) return;
        setState(() {
          // clear lines
          clearLines();

          // check landing
          checkLanding();

          if (gameOver == true) {
            timer.cancel();
            showGameOverDialog();
          }

          // move the current piece down
          currentPiece.movePiece(Direction.down);
        });
      },
    );
  }

  void showGameOverDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: Text('Your Score is: $currentScore'),
          actions: [
            TextButton(
              onPressed: () {
                resetGame();
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const GameBoard(),
                    ));
              },
              child: const Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  // Collision Detection System
  // return true -> if collision
  // return false -> if no collision
  bool checkCollision(Direction direction) {
    // loop through each position of the current piece
    for (int i = 0; i < currentPiece.position.length; i++) {
      // calculate the row and column of the current position
      int row = (currentPiece.position[i] / rowLength).floor();
      int column = currentPiece.position[i] % rowLength;

      // adjust row and column based on direction
      if (direction == Direction.left) {
        column -= 1;
      } else if (direction == Direction.right) {
        column += 1;
      } else if (direction == Direction.down) {
        row += 1;
      }

      // check if the piece is out of the bounds(either too low, too far to the right or left)
      if (row >= columnLength || column >= rowLength || column < 0) {
        return true;
      } else if (column > 0 &&
          row > 0 &&
          gameBoard[row][column] != Tetromino.empty) {
        return true;
      }
    }

    // if no collisions are detected, return false
    return false;
  }

  void checkLanding() {
    // if going down in occupied
    if (checkCollision(Direction.down)) {
      // mark position as occupied on the gameboard
      for (int i = 0; i < currentPiece.position.length; i++) {
        int row = (currentPiece.position[i] / rowLength).floor();
        int column = currentPiece.position[i] % rowLength;
        if (row >= 0 && column >= 0) {
          gameBoard[row][column] = currentPiece.type;
        }
      }

      // once landed, create the next piece
      createNewPiece();
    }
  }

  void createNewPiece() {
    // creating a random object to generate random tetromino types
    Random rand = Random();

    // create a new piece with a random type
    Tetromino randomType =
        Tetromino.values[rand.nextInt(Tetromino.values.length)];
    currentPiece = Piece(type: randomType);
    currentPiece.initializePiece();

    if (isGameOver()) {
      gameOver = true;
    }
  }

  void moveLeft() {
    if (!checkCollision(Direction.left)) {
      setState(() {
        currentPiece.movePiece(Direction.left);
      });
    }
  }

  void moveRight() {
    if (!checkCollision(Direction.right)) {
      setState(() {
        currentPiece.movePiece(Direction.right);
      });
    }
  }

  void rotatePiece() {
    setState(() {
      currentPiece.rotatePiece();
    });
  }

  // clear lines
  void clearLines() {
    // step 1: Loop through each row of the game from bottom to top
    for (int row = columnLength - 1; row >= 0; row--) {
      // step 2: initialise a variable to track if the row if full
      bool rowIsFull = true;
      // step 3: check if the row is full(all columns in the row are filled with pieces)
      for (int col = 0; col < rowLength; col++) {
        //if there's an empty column, set rowIsFull to false and break the loop
        if (gameBoard[row][col] == Tetromino.empty) {
          rowIsFull = false;
          break;
        }
      }
      // step 4: if the row is full, clear the row and shift the rows down
      if (rowIsFull) {
        // step 5: move all row above the cleared row by one position
        for (int r = row; r > 0; r--) {
          // copy the above row to current row
          gameBoard[r] = List.from(gameBoard[r - 1]);
        }
        // step 6: set the top row to empty
        gameBoard[0] = List.generate(row, (index) => Tetromino.empty);

        // step 7: Increase the score
        currentScore += 1;
      }
    }
  }

  bool isGameOver() {
    for (int col = 0; col < rowLength; col++) {
      if (gameBoard[0][col] != Tetromino.empty) {
        return true;
      }
    }
    return false;
  }

  void resetGame() {
    gameBoard = List.generate(
      columnLength,
      (i) => List.generate(rowLength, (j) => Tetromino.empty),
    );

    currentScore = 0;
    createNewPiece();
    startGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 18,
            child: Stack(
              children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: rowLength * columnLength,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: rowLength,
                  ),
                  itemBuilder: (context, index) {
                    // get row and column of each pixel
                    int row = (index / rowLength).floor();
                    int column = index % rowLength;

                    if (currentPiece.position.contains(index)) {
                      return Pixel(
                        index: index,
                        color: currentPiece.color,
                      );
                    } else if (gameBoard[row][column] != Tetromino.empty) {
                      final Tetromino? tetrominoType = gameBoard[row][column];
                      return Pixel(
                        index: index,
                        color: tetrominoColors[tetrominoType],
                      );
                    } else {
                      return Pixel(
                        index: index,
                        color: Colors.grey.shade900,
                      );
                    }
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          moveLeft();
                        },
                        onLongPress: () {
                          rotatePiece();
                        },
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          moveRight();
                        },
                        onLongPress: () {
                          rotatePiece();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
            child: Column(
              children: [
                Text(
                  'Score: $currentScore',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        createNewPiece();
                        startGame();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.play_arrow,
                          size: 30.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        rotatePiece();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.rotate_90_degrees_ccw,
                          size: 30.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
