import 'package:flutter/material.dart';

class CustomTabList extends StatelessWidget {
  CustomTabList(
      {super.key,
      required this.widgets,
      required this.onTabSelected,
      this.height = 40});

  final List<Widget> widgets;
  final ValueChanged<int> onTabSelected;
  final ValueNotifier<int> selectedIndexNotifier =
      ValueNotifier(0); // ValueNotifier to track the selected index
  final double _seperatorSpacing = 5.0;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ValueListenableBuilder<int>(
        valueListenable: selectedIndexNotifier,
        builder: (context, selectedIndex, child) {
          List<Widget> children = List.generate(
              widgets.length,
              (index) => Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: _seperatorSpacing),
                      child: InkWell(
                        child: Container(
                          decoration: selectedIndex != index
                              ? BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 2.0,
                                      spreadRadius: 0.0,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey.shade100,
                                )
                              : BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                          child: Center(child: widgets[index]),
                        ),
                        onTap: () {
                          // Update the ValueNotifier with the selected index
                          selectedIndexNotifier.value = index;
                          onTabSelected.call(index);
                        },
                      ),
                    ),
                  ));
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children,
          );
        },
      ),
    );
  }
}
