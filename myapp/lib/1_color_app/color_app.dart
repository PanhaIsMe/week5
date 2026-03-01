import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Home(
          currentIndex: 0,
          redTapCount: 0,
          blueTapCount: 0,
          yellowTapCount: 0,
          greenTapCount: 0,
        ),
      ),
    ),
  );
}

enum CardType { red, blue, yellow, green }

class CountNumber extends ChangeNotifier {
  int onRedTap = 0;
  int onBlueTap = 0;
  int onYellowTap = 0;
  int onGreenTap = 0;
  int currentindex = 0;
  void onIncrease(CardType color) {
    switch (color) {
      case CardType.blue:
        onBlueTap += 1;

        break;
      case CardType.red:
        onRedTap += 1;

        break;
      case CardType.yellow:
        onYellowTap += 1;

        break;
      case CardType.green:
        onGreenTap += 1;

        break;
    }
    notifyListeners();
  }

  void onchangetap(int index) {
    currentindex = index;
    notifyListeners();
  }
}

CountNumber numIncreaseLisener = CountNumber();

class Home extends StatelessWidget {
  final int _currentIndex;
  final int redTapCount;
  final int blueTapCount;
  final int yellowTapCount;
  final int greenTapCount;

  const Home({
    super.key,
    required int currentIndex,
    required this.redTapCount,
    required this.blueTapCount,
    required this.yellowTapCount,
    required this.greenTapCount,
  }) : _currentIndex = currentIndex;

  // const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListenableBuilder(
      listenable: numIncreaseLisener,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: numIncreaseLisener.currentindex == 0
              ? ColorTapsScreen(
                  redTapCount: numIncreaseLisener.onRedTap,
                  blueTapCount: numIncreaseLisener.onBlueTap,
                  yellowTapCount: numIncreaseLisener.onYellowTap,
                  greenTapCount: numIncreaseLisener.onGreenTap,
                )
              : StatisticsScreen(
                  redTapCount: numIncreaseLisener.onRedTap,
                  blueTapCount: numIncreaseLisener.onBlueTap,
                  yellowTapCount: numIncreaseLisener.onYellowTap,
                  greenTapCount: numIncreaseLisener.onGreenTap,
                ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => numIncreaseLisener.onchangetap(index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.tap_and_play),
                label: 'Taps',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: 'Statistics',
              ),
            ],
          ),
        );
      },
    );
  }

  // @override
  // State<Home> createState() => _HomeState();
}

// class _HomeState extends State<Home> {
//   int _currentIndex = 0;
//   int redTapCount = 0;
//   int blueTapCount = 0;
//   int yellowTapCount = 0;
//   int greenTapCount = 0;

//   void _incrementRedTapCount() {
//     setState(() {
//       redTapCount++;
//     });
//   }

//   void _incrementBlueTapCount() {
//     setState(() {
//       blueTapCount++;
//     });
//   }

//   void _incrementYellowTapCount() {
//     setState(() {
//       yellowTapCount++;
//     });
//   }

//   void _incrementGreenTapCount() {
//     setState(() {
//       greenTapCount++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _currentIndex == 0
//           ? ColorTapsScreen(
//               redTapCount: redTapCount,
//               blueTapCount: blueTapCount,
//               onRedTap: _incrementRedTapCount,
//               onBlueTap: _incrementBlueTapCount,
//               onGreenTap: _incrementGreenTapCount,
//               onYellowTap: _incrementYellowTapCount,
//               yellowTapCount: yellowTapCount,
//               greenTapCount: greenTapCount,
//             )
//           : StatisticsScreen(
//               redTapCount: redTapCount,
//               blueTapCount: blueTapCount,
//               yellowTapCount: yellowTapCount,
//               greenTapCount: greenTapCount,
//             ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.tap_and_play),
//             label: 'Taps',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bar_chart),
//             label: 'Statistics',
//           ),
//         ],
//       ),
//     );
//   }
// }

class ColorTapsScreen extends StatelessWidget {
  final int redTapCount;
  final int blueTapCount;

  final int yellowTapCount;
  final int greenTapCount;

  const ColorTapsScreen({
    super.key,
    required this.redTapCount,
    required this.blueTapCount,

    required this.yellowTapCount,
    required this.greenTapCount,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: [
          ColorTap(type: CardType.red, tapCount: redTapCount),
          ColorTap(type: CardType.blue, tapCount: blueTapCount),
          ColorTap(type: CardType.yellow, tapCount: yellowTapCount),
          ColorTap(type: CardType.green, tapCount: greenTapCount),
        ],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;
  final int tapCount;
  // final VoidCallback onTap;
  void incrementTap(CardType color) {
    numIncreaseLisener.onIncrease(color);
  }

  const ColorTap({super.key, required this.type, required this.tapCount});

  Color getBackgroundColor(CardType type) {
    switch (type) {
      case CardType.blue:
        return Colors.blue;
      case CardType.red:
        return Colors.red;
      case CardType.green:
        return Colors.green;
      case CardType.yellow:
        return Colors.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {incrementTap(type)},
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: getBackgroundColor(type),
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(
            'Taps: $tapCount',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  final int redTapCount;
  final int blueTapCount;
  final int yellowTapCount;
  final int greenTapCount;

  const StatisticsScreen({
    super.key,
    required this.redTapCount,
    required this.blueTapCount,
    required this.yellowTapCount,
    required this.greenTapCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Red Taps: $redTapCount', style: TextStyle(fontSize: 24)),
            Text('Blue Taps: $blueTapCount', style: TextStyle(fontSize: 24)),
            Text(
              'Yellow Taps: $yellowTapCount',
              style: TextStyle(fontSize: 24),
            ),
            Text('Green Taps: $greenTapCount', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
