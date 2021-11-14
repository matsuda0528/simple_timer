import 'package:flutter/material.dart';
import 'package:duration_picker/duration_picker.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

int _durationToInteger(Duration dur) {
  int retval;
  retval = dur.inHours * 3600 + dur.inMinutes * 60 + dur.inSeconds;
  return retval;
}

class _SettingPageState extends State<SettingPage> {
  Duration _duration_hour = const Duration(hours: 0);
  Duration _duration_minute = const Duration(minutes: 0);
  Duration _duration_second = const Duration(seconds: 0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('this is setting page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: DurationPicker(
                  duration: _duration_hour,
                  baseUnit: BaseUnit.hour,
                  onChange: (val) {
                    setState(() => _duration_hour = val);
                  },
                  snapToMins: 5.0,
                )),
            Expanded(
                child: DurationPicker(
                  duration: _duration_minute,
                  baseUnit: BaseUnit.minute,
                  onChange: (val) {
                    setState(() => _duration_minute = val);
                  },
                  snapToMins: 5.0,
                )),
            Expanded(
                child: DurationPicker(
                  duration: _duration_second,
                  baseUnit: BaseUnit.second,
                  onChange: (val) {
                    setState(() => _duration_second = val);
                  },
                  snapToMins: 5.0,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.slow_motion_video_sharp),
        onPressed: () {
          Navigator.pop(context,_durationToInteger(_duration_hour + _duration_minute + _duration_second));
        }
    ),
    );
  }
}
