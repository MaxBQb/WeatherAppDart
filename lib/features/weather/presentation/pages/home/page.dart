import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/domain/failures/failures.dart';
import 'package:weather_app/core/presentation/buttons/round_button.dart';
import 'package:weather_app/core/presentation/skeletons/skeleton.dart';
import 'package:weather_app/features/weather/presentation/widgets/components/weather_card.dart';

import '../../../../../injection.dart';
import '../../../domain/entities/weather.dart';
import '../../logic/some/bloc.dart';

part '../../widgets/pages/home/failure_home.dart';
part '../../widgets/pages/home/loaded_home.dart';
part '../../widgets/pages/home/loading_home.dart';
part 'view.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}
class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => sl<WeatherBloc>()..add(GetWeatherEvent()),
      )
    ], child: const WeatherView());
  }
}
