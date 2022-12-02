part of '../../../pages/location/page.dart';

class _PickLocation extends StatefulWidget {
  bool weatherEnabled;
  _PickLocation({Key? key, this.weatherEnabled = true}) : super(key: key);

  @override
  State<_PickLocation> createState() => _PickLocationState(weatherEnabled);
}

class _PickLocationState extends State<_PickLocation> {
  String searchRequest = '';
  bool weatherEnabled;

  _PickLocationState(this.weatherEnabled);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) => setState(() => searchRequest = value),
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  hintText: 'Укажите адрес…',
                  focusColor: Colors.red,
                  suffixIcon: IconButton(
                    onPressed: () {
                      BlocProvider.of<LocationBloc>(context)
                          .add(FindLocationEvent(search: searchRequest));
                    },
                    icon: const Icon(Icons.search),
                    color: Colors.blue,
                  )),
            ),
            const SizedBox(height: 20),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      BlocProvider.of<LocationBloc>(context)
                          .add(GetCurrentLocationEvent());
                    },
                    icon: const Icon(
                      Icons.location_on,
                      size: 24.0,
                    ),
                    label: const Text('Текущее местоположение'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      elevation: 8,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: weatherEnabled
                        ? () { Navigator.pushNamed(context, '/weather'); }
                        : null,
                    icon: const Icon(
                      Icons.cloud,
                      size: 24.0,
                    ),
                    label: const Text('Прогноз на неделю'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      elevation: 8,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
