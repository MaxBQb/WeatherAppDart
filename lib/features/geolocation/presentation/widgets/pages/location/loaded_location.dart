part of '../../../pages/location/page.dart';

class _LoadedLocation extends StatelessWidget {
  final Location location;

  const _LoadedLocation({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Прогноз для:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 10),
                    LocationCardView(location: location)
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class LocationCardView extends StatelessWidget {
  const LocationCardView({
    Key? key,
    required this.location,
  }) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    if (location.country != null) {
      children.add(MyRichText(label: 'Страна', value: location.country!));
    }
    if (location.name != null) {
      children.add(MyRichText(label: 'Населенный пункт', value: location.name!));
    }
    children.add(MyRichText(label: 'Координаты', value:
        "${location.latitude.toStringAsFixed(4)} / "
        "${location.longitude.toStringAsFixed(4)}"
    ));

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children);
  }
}
