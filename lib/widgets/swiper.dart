import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class SwiperWidget extends StatelessWidget {
  final List? bannerList;
  const SwiperWidget({super.key, this.bannerList});

  @override
  Widget build(BuildContext context) {
    return bannerList!.isEmpty
        ? const Text('无数据')
        : SizedBox(
            width: double.infinity,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Swiper(
                autoplay: true,
                itemCount: bannerList!.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      bannerList![index]['imageUrl'],
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),
            ),
          );
  }
}
