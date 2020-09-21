import 'package:flutter/material.dart';
import 'package:flutter_ui_sizing/responsive_safe_area.dart';
import 'package:flutter_ui_sizing/size_config.dart';
import 'package:flutter_ui_sizing/size_extensions.dart';
import 'package:flutter_ui_sizing/text_one_line.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: ResponsiveSafeArea(
        builder: (context, size) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScreenSizeText(),
            Container(
              width: size.width,
                height: 60.0.proportionateHeight,
                child: BoxWidget(
                  color: Colors.amber,
                )),
            textSample(),
            Center(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BoxWidget(
                  width: 100.0.proportionateWidth,
                  height: 100.0.proportionateHeight,
                ),
                BoxWidget(
                  width: 100.0,
                  height: 100.0,
                )
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget textSample() {
    queryData = MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;
    TextStyle style36 = new TextStyle(
      inherit: true,
      fontSize: 36.0.proportionateHeight,
    );
    TextStyle style20 = new TextStyle(
      inherit: true,
      fontSize: 20.0.proportionateHeight,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            child: new TextOneLine(
              'Sample text ${style36.fontSize.toStringAsFixed(2)} size.',
              style: style36,
            ),
          ),
        ),
        new Text(
          'size (pixels): w=${queryData.size.width * devicePixelRatio}, h=${queryData.size.height * devicePixelRatio}',
          style: style20,
        ),
        new Text(
          'devicePixelRatio: $devicePixelRatio',
          style: style20,
        ),
        new Text(
          'size: w=${queryData.size.width}, h=${queryData.size.height}',
          style: style20,
        ),
        new Text(
          'textScaleFactor: w=${queryData.textScaleFactor}',
          style: style20,
        ),
      ],
    );
  }
}

class ScreenSizeText extends StatelessWidget {
  const ScreenSizeText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          "full screen size is ${SizeConfig.screenWidth} x ${SizeConfig.screenHeight}",
          style: TextStyle(fontSize: 14.0.proportionateHeight),
        ),
      ),
    );
  }
}

class BoxWidget extends StatelessWidget {
  final Color color;
  final double width;
  final double height;

  const BoxWidget({Key key, this.color, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.green.shade400,
      width: width,
      height: height,
      child: LayoutBuilder(
        builder: (context, constraint) => TextOneLine(
            "size is ${constraint.maxWidth.toStringAsFixed(2)} x ${constraint.maxHeight.toStringAsFixed(2)}"
        ),
      ),
    );
  }
}
