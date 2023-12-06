import 'package:bloc_tutorial/bloc/maggi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListenerTutorial extends StatefulWidget {
  const ListenerTutorial({super.key});

  @override
  State<ListenerTutorial> createState() => _ListenerTutorialState();
}

class _ListenerTutorialState extends State<ListenerTutorial> {
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
        title: const Text('Bloc Listener'),
      ),
      body: Column(
        children: [
          BlocListener<MaggiBloc, MaggiState>(
            listener: (context, state) {
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
            },
            child: const Text('Masak Maggi'),
          ),
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
