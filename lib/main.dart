import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(
    const PortfolioApp(),
  );
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'しゆいのポートフォリオ',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 32,
              ),
              Container(
                width: 256,
                height: 256,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xff506482),
                    width: 2,
                  ),
                  image: const DecorationImage(
                    image: NetworkImage('https://avatars.githubusercontent.com/u/66453922'),
                  ),
                ),
              ),
              Text(
                'しゆい',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Student, Go Lover',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                'Skills',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Go,TyperScript',
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Twitter');
                    },
                    child: SvgPicture.asset(
                      'assets/twitter.svg',
                      colorFilter: ColorFilter.mode(
                        const Color(0xff506482),
                        BlendMode.srcIn,
                      ),
                      width: 32,
                      height: 32,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      launchUrlString('https://github.com/Sigumaa');
                    },
                    child: SvgPicture.asset(
                      'assets/github.svg',
                      colorFilter: ColorFilter.mode(
                        const Color(0xff506482),
                        BlendMode.srcIn,
                      ),
                      width: 32,
                      height: 32,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      launchUrlString('https://www.shiyui.dev/');
                    },
                    child: SvgPicture.asset(
                      'assets/user-solid.svg',
                      colorFilter: ColorFilter.mode(
                        const Color(0xff506482),
                        BlendMode.srcIn,
                      ),
                      width: 32,
                      height: 32,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
