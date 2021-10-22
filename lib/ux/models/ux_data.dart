import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/ux/app_icons.dart';
import 'package:portfolio/ux/models/ux_models.dart';

const personalSocialMediaData = <ContentViewModel>[
  ContentViewModel(
    title: 'Blog',
    description: 'Genics Blog',
    icon: FontAwesomeIcons.link,
    url: 'https://genicsblog.com',
  ),
  ContentViewModel(
    title: 'GitHub',
    description: 'gouravkhunger',
    icon: AppIcons.githubCircled,
    url: 'https://github.com/gouravkhunger',
  ),
  ContentViewModel(
    title: 'StackOverflow',
    description: '9819031',
    icon: FontAwesomeIcons.stackOverflow,
    url: 'https://stackoverflow.com/users/9819031/gourav',
  ),
  ContentViewModel(
    title: 'Developer Community',
    description: 'dev.to',
    icon: FontAwesomeIcons.dev,
    url: 'https://dev.to/gouravkhunger',
  ),
  ContentViewModel(
    title: 'Email',
    description: 'gouravkhunger18@gmail.com',
    icon: AppIcons.mail,
    url: 'mailto:gouravkhunger18@gmail.com',
  ),
  ContentViewModel(
    title: 'YouTube',
    description: 'Gourav Khunger',
    icon: AppIcons.youtube,
    url: 'https://www.youtube.com/channel/UCkv-J_D8jK2N02nBcyM92mQ',
  ),
  ContentViewModel(
    title: 'K0-Fi',
    description: 'Ko-Fi',
    icon: FontAwesomeIcons.mugHot,
    url: 'https://ko-fi.com/gouravkhunger',
  ),
];
