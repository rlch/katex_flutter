import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:katex_flutter/katex_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter KaTeX Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _laTeXInputController = TextEditingController(
      text: r'What do you think about $L'
          '\''
          r' = {L}{\sqrt{1-\frac{v^2}{c^2}}}$ ?'
          '\n'
          r'And some display $\LaTeX$: $$\boxed{\rm{A function: } f(x) = \frac{5}{3} \cdot x}$$'
          '\n'
          r'$\KaTeX$-Flutter provides easy processing of $LaTeX$ embedded into any text.'
          '\n'
          r'This package was developped for testapp.schule education project. Find us on pub.dev/packages/katex_flutter !');
  String _laTeX;

  @override
  void initState() {
    _renderLaTeX();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('KaTeX Flutter Home Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        labelText: 'Your LaTeX code here',
                        helperText:
                            'Use \$ as delimiter. Use \$\$ for display LaTeX.'),
                    controller: _laTeXInputController,
                  ),
                ),
                Container(
                    child: Builder(
                  builder: (context) => KaTeX(
                    laTeXCode: Text(_laTeX,
                        style: Theme.of(context).textTheme.bodyText2),
                  ),
                ))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _renderLaTeX,
          tooltip: 'Render again. Only working on mobile platform.',
          label: Text('Render LaTeX'),
          icon: Icon(Icons.crop_rotate),
        ));
  }

  void _renderLaTeX() {
    setState(() {
      _laTeX = _laTeXInputController.text;
    });
  }
}
