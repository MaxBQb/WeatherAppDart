part of '../../../pages/location/page.dart';

class _FailureLocation extends StatelessWidget {
  final Failure failure;

  const _FailureLocation({Key? key, required this.failure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            failure.getMessage(),
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
