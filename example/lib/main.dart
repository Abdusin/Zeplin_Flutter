import 'package:example/datas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zeplin/flutter_zeplin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zeplin Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Zeplin Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late ZeplinFlutter zeplinData;
  late String colorName;
  var loading = true;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    ZeplinFlutter.fetchFromZeplin(token: token, projectId: projectId).then((value) {
      setState(() {
        loading = false;
        zeplinData = value;
        colorName = zeplinData.colors.entries.first.key;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
                style: zeplinData.getTextStyle('Text Style'),
              ),
              zeplinData.verticalSpace('spacing-xs'),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              zeplinData.verticalSpace('spacing-xs'),
              Expanded(
                  child: ListView.builder(
                itemCount: zeplinData.colors.entries.length,
                itemBuilder: (context, index) {
                  var item = zeplinData.colors.entries.elementAt(index);
                  return ListTile(
                    onTap: () => setState(() => colorName = item.key),
                    title: Text(item.key),
                    subtitle: Text(item.value.toString()),
                    leading: CircleAvatar(
                      backgroundColor: item.value,
                    ),
                  );
                },
              ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          backgroundColor: zeplinData.getColor(colorName),
          child: const Icon(Icons.add),
        ),
      );
    }
  }
}
