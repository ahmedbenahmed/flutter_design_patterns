import 'package:flutter/material.dart';

// Abstract Product
abstract class ShapeWidget extends StatelessWidget {
  void draw();
}

// Concrete Product: Circle Widget
class CircleWidget extends StatelessWidget implements ShapeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
    );
  }

  @override
  void draw() {
    print('Drawing Circle Widget');
  }
}

// Concrete Product: Rectangle Widget
class RectangleWidget extends StatelessWidget implements ShapeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      color: Colors.green,
    );
  }

  @override
  void draw() {
    print('Drawing Rectangle Widget');
  }
}

// Abstract Creator
abstract class ShapeWidgetCreator {
  ShapeWidget createShapeWidget();
}

// Concrete Creator: Circle Widget Creator
class CircleWidgetCreator implements ShapeWidgetCreator {
  @override
  ShapeWidget createShapeWidget() {
    return CircleWidget();
  }
}

// Concrete Creator: Rectangle Widget Creator
class RectangleWidgetCreator implements ShapeWidgetCreator {
  @override
  ShapeWidget createShapeWidget() {
    return RectangleWidget();
  }
}

// Custom Widget encapsulating the Factory Method Pattern
class ShapeWidgetContainer extends StatelessWidget {
  final ShapeWidgetCreator creator;

  ShapeWidgetContainer({required this.creator});

  @override
  Widget build(BuildContext context) {
    ShapeWidget shapeWidget = creator.createShapeWidget();
    shapeWidget
        .draw(); // Output: Drawing Circle Widget or Drawing Rectangle Widget
    return Center(child: shapeWidget);
  }
}

class FactoryMethodPatternScreen extends StatelessWidget {
  const FactoryMethodPatternScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Factory Method Pattern Example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Using Circle Widget Creator
            ShapeWidgetContainer(creator: CircleWidgetCreator()),

            SizedBox(height: 20),

            // Using Rectangle Widget Creator
            ShapeWidgetContainer(creator: RectangleWidgetCreator()),
          ],
        ),
      ),
    );
  }
}
