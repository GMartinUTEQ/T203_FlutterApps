import "package:flutter/material.dart";
import "package:card_swiper/card_swiper.dart";

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Swiper(
          itemCount: 10,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.9,
          itemBuilder: (_, int index) {
            return const FadeInImage(
              placeholder: NetworkImage(
                  "https://raw.githubusercontent.com/GMartinUTEQ/UTEQ_T203/master/biografia/fotos/300%20x%20400.png"),
              image: NetworkImage(
                  "https://raw.githubusercontent.com/GMartinUTEQ/UTEQ_T203/master/biografia/fotos/300%20x%20400.png"),
            );
          },
        ));
  }
}
