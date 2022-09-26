import 'package:flutter/material.dart';

import 'constants.dart';

class DetailsPage extends StatefulWidget {
  static const String routeName = '/detail';

  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late String status;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorPrimary,
        appBar: AppBar(
          title: const Text('Second Page'),
          backgroundColor: colorPrimary,
          elevation: 0,//shadow
        ),
        body: Column(
          children: bmiTypeMap.keys
              .map((key) =>
              ListTile(
                textColor: Colors.white,
                tileColor: key == status ? Colors.white24 : null,
                title: Text(key),
                trailing: Text(bmiTypeMap[key]!),
              ))
              .toList(),
        ),
      ),
    );
  }
  @override
  void initState() {

    super.initState();
  }
  @override
  void didChangeDependencies() {
    status = ModalRoute.of(context)!.settings.arguments as String;

    super.didChangeDependencies();
  }
}
