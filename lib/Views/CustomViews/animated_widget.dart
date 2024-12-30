import 'package:flutter/material.dart';

class CustomAnimatedWidget extends StatefulWidget {
  const CustomAnimatedWidget({super.key, required this.widgets});

  final List<Widget> widgets;

  @override
  State<CustomAnimatedWidget> createState() => _CustomAnimatedWidgetState();
}

class _CustomAnimatedWidgetState extends State<CustomAnimatedWidget>
    with AutomaticKeepAliveClientMixin<CustomAnimatedWidget> {
  late Stream<int> _stream;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _stream = Stream<int>.periodic(
      const Duration(seconds: 1),
      (count) => count,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<int>(
      stream: _stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return widget.widgets[0];
        }
        int index =
            snapshot.hasData ? snapshot.data! % widget.widgets.length : 0;
        return widget.widgets[index];
      },
    );
  }
}
