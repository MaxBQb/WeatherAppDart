part of '../../../pages/location/page.dart';

class _ListLocation extends StatelessWidget {
  final List<Location> location;

  const _ListLocation({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: location
            .map((e) => Card(
                  elevation: 8,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () => BlocProvider.of<LocationBloc>(context)
                          .add(SetLocationEvent(location: e)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: LocationCardView(location: e),
                      )),
                ))
            .toList(),
      ),
    );
  }
}
