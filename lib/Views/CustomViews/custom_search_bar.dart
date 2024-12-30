import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({super.key, this.onEditingComplete});

  final _textController = TextEditingController();
  final Function(String? text)? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return _segmentAndSearchWidget(context: context);
  }

  Widget _segmentAndSearchWidget({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [_searchbar(context: context)],
      ),
    );
  }

  Widget _searchBarCustom({required BuildContext context}) {
    return Expanded(
      child: TextFormField(
        controller: _textController,
        decoration: const InputDecoration(
            hintText: "What are you looking for?", border: InputBorder.none),
        onEditingComplete: () {
          onEditingComplete?.call(_textController.text);
          _textController.clear();
        },
      ),
    );
  }

  Widget _searchbar({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color of the container
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color with opacity
              blurRadius: 8.0, // Blur the shadow to make it softer
              spreadRadius: 0.0, // Do not spread the shadow
              offset: const Offset(0,
                  2), // Position the shadow below the container (bottom shadow)
            ),
          ],
        ),
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _searchBarCustom(context: context),
            GestureDetector(
              onTap: () {
                onEditingComplete?.call(_textController.text);
                _textController.clear();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300),
                height: 40,
                width: 40,
                child: const Icon(Icons.search),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
