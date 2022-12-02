part of 'page.dart';

class LocationView extends StatefulWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Выбор местоположения",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SizedBox.expand(
        child: BlocConsumer<LocationBloc, LocationState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LocationLoaded) {
              return SingleChildScrollView(
                  child: Column(
                children: [
                  Wrap(
                    children: [
                      Expanded(child: _PickLocation()),
                    ],
                  ),
                  _LoadedLocation(location: state.location),
                ],
              ));
            } else if (state is LocationError) {
              return Column(
                children: [
                  Wrap(children: [
                    _PickLocation(weatherEnabled: false),
                  ]),
                  Expanded(child: _FailureLocation(failure: state.failure)),
                ],
              );
            } else if (state is LocationListLoaded) {
              return Column(
                children: [
                  Wrap(children: [
                    _PickLocation(weatherEnabled: false),
                  ]),
                  Expanded(child: _ListLocation(location: state.locations)),
                ],
              );
            } else {
              return const _LoadingLocation();
            }
          },
        ),
      ),
    );
  }
}
