import 'package:flutter/material.dart';

class ContainerAppbar extends StatelessWidget {
  const ContainerAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      child: const _ContentAppbar(),
    );
  }
}

class _ContentAppbar extends StatelessWidget {
  const _ContentAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text('New', style: TextStyle(fontSize: 50)),
        ),
        SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                bottom: 6,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 100,
                    height: 10,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text('List',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.red,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
