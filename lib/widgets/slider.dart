import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CarouselSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Container(
          height: 190,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Carousel(
            dotColor: const Color(0xFF00BCD4),
            dotIncreasedColor: Colors.white,
            dotPosition: DotPosition.bottomRight,
            borderRadius: true,
            radius: const Radius.circular(14),
            indicatorBgPadding: 6.0,
            boxFit: BoxFit.cover,
            showIndicator: true,
            dotSize: 8,
            dotSpacing: 14,
            dotBgColor: Colors.transparent,
            images: [
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/psl'),
                child: Image.asset('assets/slider1.jpg', fit: BoxFit.cover),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/tensports'),
                child: Image.asset('assets/slider2.jpg', fit: BoxFit.cover),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
