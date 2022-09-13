import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/image/menu1.png"),
                fit: BoxFit.cover)),
        child: SizedBox(
          width: double.infinity,
          height: 350,
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 122,
              width: 122,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                  'assets/image/3.png',
                )),
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 3,
                      offset: const Offset(0, 3))
                ],
              ),
            ),
          ),
        ));
  }
}
