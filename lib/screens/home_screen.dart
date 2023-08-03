import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 1500, totalRound = 0, totalGoal = 0;
  bool isRunning = false;
  late Timer timer;
  bool is15 = false, is20 = false, is25 = true, is30 = false, is35 = false;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalRound++;
        if (totalRound == 4) {
          totalRound = 0;
          totalGoal++;
        }
      });
      onResetTimer();
    } else {
      setState(() {
        totalSeconds--;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2);
  }

  void onResetTimer() {
    timer.cancel();
    setState(() {
      isRunning = false;
      if (is15) {
        totalSeconds = 15 * 60;
      } else if (is20) {
        totalSeconds = 20 * 60;
      } else if (is25) {
        totalSeconds = 25 * 60;
      } else if (is30) {
        totalSeconds = 30 * 60;
      } else if (is35) {
        totalSeconds = 35 * 60;
      }
    });
  }

  void on15Pressed() {
    timer.cancel();
    setState(() {
      totalSeconds = 60 * 15;
      isRunning = false;
      is15 = true;
      is20 = false;
      is25 = false;
      is30 = false;
      is35 = false;
    });
  }

  void on20Pressed() {
    timer.cancel();
    setState(() {
      totalSeconds = 60 * 20;
      isRunning = false;
      is15 = false;
      is20 = true;
      is25 = false;
      is30 = false;
      is35 = false;
    });
  }

  void on25Pressed() {
    timer.cancel();
    setState(() {
      totalSeconds = 60 * 25;
      isRunning = false;
      is15 = false;
      is20 = false;
      is25 = true;
      is30 = false;
      is35 = false;
    });
  }

  void on30Pressed() {
    timer.cancel();
    setState(() {
      totalSeconds = 60 * 30;
      isRunning = false;
      is15 = false;
      is20 = false;
      is25 = false;
      is30 = true;
      is35 = false;
    });
  }

  void on35Pressed() {
    timer.cancel();
    setState(() {
      totalSeconds = 60 * 35;
      isRunning = false;
      is15 = false;
      is20 = false;
      is25 = false;
      is30 = false;
      is35 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Transform.translate(
                offset: const Offset(0, 10),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'POMOTIMER',
                        style: TextStyle(
                          color: Theme.of(context).cardColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Flexible(
              flex: 2,
              child: Transform.translate(
                offset: const Offset(0, -40),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 58, vertical: 20),
                    child: Text(
                      format(totalSeconds),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.background,
                        fontSize: 92,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: is15
                            ? Colors.white
                            : Theme.of(context).colorScheme.background,
                      ),
                      child: TextButton(
                        onPressed: on15Pressed,
                        child: Text(
                          '15',
                          style: TextStyle(
                            fontSize: 28,
                            color: is15
                                ? Theme.of(context).colorScheme.background
                                : Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: is20
                            ? Colors.white
                            : Theme.of(context).colorScheme.background,
                      ),
                      child: TextButton(
                        onPressed: on20Pressed,
                        child: Text(
                          '20',
                          style: TextStyle(
                            fontSize: 28,
                            color: is20
                                ? Theme.of(context).colorScheme.background
                                : Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: is25
                            ? Colors.white
                            : Theme.of(context).colorScheme.background,
                      ),
                      child: TextButton(
                        onPressed: on25Pressed,
                        child: Text(
                          '25',
                          style: TextStyle(
                            fontSize: 28,
                            color: is25
                                ? Theme.of(context).colorScheme.background
                                : Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: is30
                            ? Colors.white
                            : Theme.of(context).colorScheme.background,
                      ),
                      child: TextButton(
                        onPressed: on30Pressed,
                        child: Text(
                          '30',
                          style: TextStyle(
                            fontSize: 28,
                            color: is30
                                ? Theme.of(context).colorScheme.background
                                : Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: is35
                            ? Colors.white
                            : Theme.of(context).colorScheme.background,
                      ),
                      child: TextButton(
                        onPressed: on35Pressed,
                        child: Text(
                          '35',
                          style: TextStyle(
                            fontSize: 28,
                            color: is35
                                ? Theme.of(context).colorScheme.background
                                : Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    IconButton(
                      iconSize: 120,
                      color: Theme.of(context).cardColor,
                      onPressed: isRunning ? onPausePressed : onStartPressed,
                      icon: Icon(
                        isRunning
                            ? Icons.pause_circle_outline
                            : Icons.play_circle_outline,
                      ),
                    ),
                    IconButton(
                      iconSize: 50,
                      color: Theme.of(context).cardColor,
                      onPressed: onResetTimer,
                      icon: const Icon(
                        Icons.restore_rounded,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$totalRound/4',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).cardColor.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'ROUND',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$totalGoal/12',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).cardColor.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'GOAL',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
