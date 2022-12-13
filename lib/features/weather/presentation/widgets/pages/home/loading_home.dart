part of '../../../pages/home/page.dart';

class _LoadingWeather extends StatelessWidget {
  const _LoadingWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
            margin: const EdgeInsets.all(16),
            child: SkeletonWidget(
              width: size.width * 0.90,
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: const SkeletonWidget(
                    width: 54,
                    height: 54,
                    borderRadius: 48,
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: const SkeletonWidget(
                    width: 54,
                    height: 54,
                    borderRadius: 48,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
