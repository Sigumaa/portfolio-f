import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              ProfileImage(),
              Text(
                'しゆい',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Student, Go Lover',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 32,
              ),
              SkillSet(skills: ['Go','TypeScript']),
              SizedBox(
                height: 32,
              ),
              LinkIconsRow(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
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
    );
  }
}

class SkillSet extends StatelessWidget {
  final List<String> skills;

  const SkillSet({Key? key, required this.skills}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Skills',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Column(
          children: skills.map((skill) => Text(skill)).toList()),
      ],
    );
  }
}

class LinkIcon extends StatelessWidget {
  final String link;
  final String iconPath;

  const LinkIcon({Key? key, required this.link, required this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrlString(link);
      },
      child: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          const Color(0xff506482),
          BlendMode.srcIn,
        ),
        width: 32,
        height: 32,
      ),
    );
  }
}

class LinkIconsRow extends StatelessWidget {
  const LinkIconsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        LinkIcon(
          link: 'https://twitter.com/',
          iconPath: 'assets/twitter.svg',
        ),
        const SizedBox(width: 16),
        LinkIcon(
          link: 'https://github.com/Sigumaa',
          iconPath: 'assets/github.svg',
        ),
        const SizedBox(width: 16),
        LinkIcon(
          link: 'https://www.shiyui.dev/',
          iconPath: 'assets/user-solid.svg',
        ),
      ],
    );
  }
}
