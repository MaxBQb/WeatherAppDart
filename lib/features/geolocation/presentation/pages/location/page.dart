import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/domain/failures/failures.dart';
import 'package:weather_app/core/presentation/skeletons/skeleton.dart';
import 'package:weather_app/core/presentation/text/text.dart';
import 'package:weather_app/features/geolocation/domain/model/location.dart';

import '../../../../../injection.dart';
import '../../logic/location/bloc.dart';

part '../../widgets/pages/location/failure_location.dart';
part '../../widgets/pages/location/list_location.dart';
part '../../widgets/pages/location/loaded_location.dart';
part '../../widgets/pages/location/loading_location.dart';
part '../../widgets/pages/location/pick_location.dart';
part 'view.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);
  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => sl<LocationBloc>()..add(GetLocationEvent()),
      )
    ], child: const LocationView());
  }
}
