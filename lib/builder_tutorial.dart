import 'package:bloc_tutorial/bloc/maggi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuilderTutorial extends StatefulWidget {
  const BuilderTutorial({super.key});

  @override
  State<BuilderTutorial> createState() => _BuilderTutorialState();
}

class _BuilderTutorialState extends State<BuilderTutorial> {
  late MaggiBloc _maggiBloc;
  @override
  void initState() {
    super.initState();
    _maggiBloc = BlocProvider.of<MaggiBloc>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Builder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<MaggiBloc, MaggiState>(
              builder: (context, state) {
                if (state is LoadingMaggi) {
                  return const CircularProgressIndicator();
                } else if (state is LoadedMaggi) {
                  return const Column(
                    children: [
                      Icon(Icons.food_bank),
                      Text('Maggi Siap'),
                    ],
                  );
                } else if (state is ErrorMaggi) {
                  return const Text('Maggi kembang');
                } else {
                  return const Text('No order');
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  _maggiBloc.add(MasakMaggi(telur: 2));
                },
                child: const Text('Start Maggi'))
          ],
        ),
      ),
    );
  }
}
