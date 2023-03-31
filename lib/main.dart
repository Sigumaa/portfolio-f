import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(
    const PortfolioApp(),
  );
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color color = Color(0xff506482);
    return MaterialApp(
      title: 'しゆいのポートフォリオ',
      home: HomePage(),
      theme: ThemeData(
        textTheme: TextTheme(
          headlineMedium: TextStyle(color: color),
          bodyMedium: TextStyle(color: color),
          titleLarge: TextStyle(color: color),
        ),
      ),
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
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Student, Go Lover',
                style: Theme.of(context).textTheme.bodyMedium,
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
          children: skills.map((skill) => Text(
              skill,
              style: Theme.of(context).textTheme.bodyMedium,
          )).toList()),
      ],
    );
  }
}

class LinkIcon extends StatelessWidget {
  final String link;
  final String iconPath;
  final String linkName;

  const LinkIcon({
    Key? key,
    required this.link,
    required this.iconPath,
    required this.linkName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: linkName,
      decoration: const BoxDecoration(
        color: Color(0xff506482),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: GestureDetector(
        onTap: () {
          launchUrlString(link);
        },
        child: SvgPicture.asset(
          iconPath,
          colorFilter: const ColorFilter.mode(
            Color(0xff506482),
            BlendMode.srcIn,
          ),
          width: 32,
          height: 32,
        ),
      ),
    );
  }
}

class LinkIconsRow extends StatelessWidget {
  final List<Map<String,String>> links = [
    {
      'linkName': 'Twitter',
      'link': 'https://twitter.com/shiii_i_',
      'iconPath': 'assets/twitter.svg',
    },
    {
      'linkName': 'GitHub',
      'link': 'https://github.com/Sigumaa',
      'iconPath': 'assets/github.svg',
    },
    {
      'linkName': 'Blog',
      'link': 'https://www.shiyui.dev/blog',
      'iconPath': 'assets/user-solid.svg',
    },
    {
      'linkName': 'Last.fm',
      'link': 'https://www.last.fm/ja/user/shiyui',
      'iconPath': 'assets/square-lastfm.svg',
    },
    {
      'linkName': 'Discord',
      'link': 'https://discord.com/users/688227388907323472',
      'iconPath': 'assets/discord.svg',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: links.map((link) => Padding(
        padding: const EdgeInsets.only(left: 4),
        child: LinkIcon(
          linkName: link['linkName']!,
          link: link['link']!,
          iconPath: link['iconPath']!,
        ),
      )).toList(),
    );
  }
}
