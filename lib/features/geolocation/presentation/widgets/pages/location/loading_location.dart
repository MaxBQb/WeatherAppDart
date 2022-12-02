part of '../../../pages/location/page.dart';

class _LoadingLocation extends StatelessWidget {
  const _LoadingLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SkeletonWidget(
            width: size.width * 0.80,
            height: 64,
          ),
          const SizedBox(height: 16),
          SkeletonWidget(
            width: size.width * 0.80,
            height: 50,
          ),
          const SizedBox(height: 16),
          SkeletonWidget(
            width: size.width * 0.80,
            height: 50,
          ),
          const SizedBox(height: 32),
          SkeletonWidget(
            height: size.height * 0.20,
          ),
        ],
      ),
    );
  }
}
