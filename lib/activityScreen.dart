import 'package:flutter/material.dart';
import 'addActivityScreen.dart';

class ActivityScreen extends StatefulWidget {
  State<ActivityScreen> createState() => _ActivityScreenState();
}

// uses the SingleTickerProvider Mixin
class _ActivityScreenState extends State<ActivityScreen> with SingleTickerProviderStateMixin {

  // defining the Animation Controller
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 400),
    vsync: this,
  );

  // defining the Offset of the animation
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, -1.0),
    end: const Offset(0.0, 0.0),
  ).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    )
  );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    repeatOnce();
    super.initState();
  }

  //make animation perform once and stop
  void repeatOnce() async {
    await _animationController.forward();
  }

  @override
  Widget build (BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: SlideTransition(
            // the offset which we define above
            position: _offsetAnimation,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                )
              ),
            ),
          )
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.lightGreen,
            child: Center(
              child: ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddActivities()),
                );
              },
                child: const Text('Add Activity'),),
            ),
          ),
        )
      ],
    );
  }
}