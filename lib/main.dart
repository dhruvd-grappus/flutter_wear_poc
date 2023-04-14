import 'package:flutter/material.dart';
import 'package:flutter_wear_poc/records.dart';
import 'package:flutter_wear_poc/responsive.dart';
import 'package:flutter_wear_poc/timer_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ChangeNotifierProvider(
        child: const StopWatchWidget(),
        create: (context) => TimerService(),
      ),
    );
  }
}

class StopWatchWidget extends StatefulWidget {
  const StopWatchWidget({super.key});

  @override
  State<StopWatchWidget> createState() => _StopWatchWidgetState();
}

class _StopWatchWidgetState extends State<StopWatchWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 10,
        leading: BackButton(),
        title:Title(color: Colors.white,child: Text('Test Wear App'),),
      ),
      body: Center(
        child: Consumer<TimerService>(builder: (context, stopwatch, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<TimerService>(builder: (context, stopwatch, _) {
                return Text(
                  stopwatch.currentDuration.inSeconds.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.toResponsiveHeight(context)),
                );
              }),
              SizedBox(
                height: 20.toResponsiveHeight(context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  stopwatch.currentDuration == Duration.zero
                      ? const SizedBox()
                      : FloatingActionButton.small(
                          backgroundColor: Colors.greenAccent,
                          child: const Icon(
                            Icons.stop,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            stopwatch.stop();
                            stopwatch.reset();
                          }),
                  FloatingActionButton.small(
                      backgroundColor: Colors.greenAccent,
                      child: Icon(
                        !stopwatch.isRunning
                            ? Icons.play_arrow_rounded
                            : Icons.pause,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        final stopWatch =
                            Provider.of<TimerService>(context, listen: false);
                        if (stopWatch.isRunning) {
                          stopWatch.stop();
                          return;
                        }
                        stopWatch.start();
                      }),
                ],
              ),
              SizedBox(
                height: 18.toResponsiveHeight(context),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => RecordsPage()));
                },
                child: Text(
                  'Go to Records',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.toResponsiveHeight(context)),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
