import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/Views/CustomViews/network_image_with_loader.dart';

import '../../ViewModel/Carousel/carousel_bloc.dart';

class CarouselWithIndicator extends StatefulWidget {
  const CarouselWithIndicator(
      {super.key, required this.images, required this.height});

  final List<String> images;
  final double height;

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: BlocBuilder<CarouselBloc, CarouselCustomState>(
        builder: (context, state) {
          return Column(
            children: [
              CarouselSlider(
                items: _imageSliders(widget.images),
                carouselController: _controller,
                options: CarouselOptions(
                    enlargeFactor: 0.1,
                    height: widget.height,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlay: true,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      context
                          .read<CarouselBloc>()
                          .add(CarouselPageChanged(index));
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.images.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(
                                  state.currentIndex == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _imageSliders(List<String> images) {
    final List<Widget> imageSliders = images
        .map((item) => Padding(
            padding: const EdgeInsets.only(left: 1, right: 1),
            child: NetworkImageWithLoader(
              imageUrl: item,
              borderRadius: 10,
              fit: BoxFit.cover,
              width: double.infinity,
            )))
        .toList();
    return imageSliders;
  }
}
