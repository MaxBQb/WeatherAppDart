part of 'page.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Недельная сводка погоды",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SizedBox.expand(
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is WeatherLoaded) {
              return _LoadedHome(weather: state.list);
            } else if (state is WeatherError) {
              return _FailureHome(
                failure: state.failure,
              );
            } else if (state is WeatherInitial) {
              return const Center();
            } else {
              return const _LoadingWeather();
            }
          },
        ),
      ),
    );
  }
}
