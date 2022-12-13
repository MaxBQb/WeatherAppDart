part of '../../../pages/home/page.dart';

class _LoadedHome extends StatelessWidget {
  final List<Weather> weather;

  const _LoadedHome({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
      child: Column(
        children: [
          Expanded(
            child: PageView(
                scrollDirection: Axis.horizontal,
                children: weather
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(4),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .90,
                            child: WeatherCard(weather: e),
                          ),
                        ))
                    .toList()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundButton(
                iconData: Icons.refresh,
                onTap: () {
                  BlocProvider.of<WeatherBloc>(context).add(GetWeatherEvent());
                },
              ),
              RoundButton(
                iconData: Icons.location_on,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
