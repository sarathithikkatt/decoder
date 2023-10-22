import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class RenderWidget extends StatefulWidget {
  var renderText;

  RenderWidget({
    super.key,
    required this.renderText,
  });

  @override
  State<RenderWidget> createState() => _RenderWidgetState();
}

class _RenderWidgetState extends State<RenderWidget> {
  @override
  Widget build(BuildContext context) {
    var renderText = widget.renderText;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: height / 2.4,
          width: width / 2.5,
          child: SingleChildScrollView(
              child: HtmlWidget(
            renderText,
            renderMode: RenderMode.listView,
          ))),
    );
  }
}
