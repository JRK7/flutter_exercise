import 'package:flutter/material.dart';

class GuestDashboard extends StatelessWidget {
  const GuestDashboard({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: _deliverToPlace(),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.black, Colors.blue]),
            ),
          )
      ),
    );
  }
}

Widget _deliverToPlace() {
  return InkWell(
    onTap: () {

    },
    child: const Row(mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [Icon(Icons.person_pin_circle), Text("Deliver to Dubai")],
    ),
  );
}
