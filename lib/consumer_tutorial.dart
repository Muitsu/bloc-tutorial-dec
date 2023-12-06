import 'package:bloc_tutorial/bloc/maggi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsumerTutorial extends StatefulWidget {
  const ConsumerTutorial({super.key});

  @override
  State<ConsumerTutorial> createState() => _ConsumerTutorialState();
}

class _ConsumerTutorialState extends State<ConsumerTutorial> {
  late MaggiBloc _maggiBloc;

  @override
  void initState() {
    super.initState();
    _maggiBloc = BlocProvider.of(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Consumer'),
      ),
      body: Column(
        children: [
          BlocConsumer<MaggiBloc, MaggiState>(builder: (context, state) {
            if (state is LoadedMaggi) {
              return const CircularProgressIndicator();
            } else if (state is LoadedMaggi) {
              return const Text('Maggi Siap');
            } else if (state is ErrorMaggi) {
              return const Text('Maggi Kembang');
            } else {
              return const Text('No order');
            }
          }, listener: (context, state) {
            if (state is LoadingMaggi) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const Dialog(
                      child: CircularProgressIndicator(),
                    );
                  });
            } else if (state is LoadedMaggi) {
              //close dialog
              Navigator.pop(context);
            } else if (state is ErrorMaggi) {
              //close dialog
              Navigator.pop(context);
            }
          }),
          ElevatedButton(
              onPressed: () {
                _maggiBloc.add(MasakMaggi(telur: 3));
              },
              child: const Text('Start Maggi'))
        ],
      ),
    );
  }
}
