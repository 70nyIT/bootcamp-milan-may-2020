import 'package:diarybootcamp/blocs/location_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../styles.dart';

class MySampleCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('Campionamenti'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<LocationBlocBloc, LocationBlocState>(
              builder: (BuildContext context, state) {
                String text;
                if (state is LocationsLoaded) {
                  text = state.locations.length.toString();
                }
                return Text(
                  text ?? '-',
                  style: TextStyles.standard,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
