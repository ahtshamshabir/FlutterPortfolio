import 'package:flutter_portfolio/models/work_experience.dart';
import 'package:flutter_portfolio/utils/svg_icons.dart';

import '../models/skill_detail.dart';

var workExperiences = [
  WorkExperience(
    title: 'Software Engineer',
    company: 'Adams Foodservice Trading Ltd',
    duration: '2021 - Present',
    descriptionBullets: [
      'Led the migration of a web app from Vue.js to Flutter, resulting in improved performance, enhanced user experience, more code reusability, and cross-platform compatibility.',
      'Refactored and re-architected a large monolithic PHP backend into a scalable microservice architecture using TyperScript, Node.js, Firebase, Google Cloud, and Neo4j graph database.',
      'Played a key role in optimizing the backend infrastructure, reducing response times and improving overall system efficiency.',
      'Developed robust APIs and integrated them with the Flutter frontend, ensuring seamless communication between the app and backend services.',
      'Actively participated in code reviews, mentored junior developers, and conducted knowledge-sharing sessions on Flutter and backend technologies.',
    ],
    skills: [
      SkillDetail(name: 'Flutter', icon: SvgIcons.flutter),
      SkillDetail(name: 'Firebase', icon: SvgIcons.firebase),
      SkillDetail(name: 'NodeJS', icon: SvgIcons.nodejs),
      SkillDetail(name: 'TypeScript', icon: SvgIcons.typescript),
      SkillDetail(name: 'Strapi', icon: SvgIcons.strapi),
      SkillDetail(name: 'Vue.js', icon: SvgIcons.vue),
      SkillDetail(name: 'GraphQL', icon: SvgIcons.graphql),
      SkillDetail(name: 'Figma', icon: SvgIcons.figma),
      SkillDetail(name: 'Neo4J', icon: SvgIcons.neo4j),
    ],
  ),
  WorkExperience(
    title: 'Full-Stack Web Developer',
    company: 'Fiverr (Freelance)',
    duration: 'Jan 2021 - March 2022',
    descriptionBullets: [
      'Self-taught full-stack developer with a focus on PHP, Laravel, Vue.js, and Node.js.',
      'Developed a distributed cloud 3D rendering platform with real-time client-server communication (Node.js, Vue.js, Socket.io, MongoDB).',
      'Developed a voting-based market boycott system (Laravel, MySQL).',
      'Developed an online whiteboard for online education.',
      'Developed a web-based electricity consumption meter dashboard(PHP, MySQL).',
      'Developed a custom backend framework for Node.js and a GraphQL-inspired query language.',
    ],
    skills: [
      SkillDetail(name: 'MySQL', icon: SvgIcons.mysql),
      SkillDetail(name: 'PHP', icon: SvgIcons.php),
      SkillDetail(name: 'Vue.js', icon: SvgIcons.vue),
      SkillDetail(name: 'GraphQL', icon: SvgIcons.graphql),
      SkillDetail(name: 'Node.js', icon: SvgIcons.nodejs),
      SkillDetail(name: 'MongoDB', icon: SvgIcons.mongodb),
    ],
  ),
  WorkExperience(
    title: 'Video Editor & 3D Content Creator',
    company: 'Fiverr (Freelance)',
    duration: 'Jan 2017 - Jan 2018',
    descriptionBullets: [
      'Expanded skills from graphics design to video editing and 3D graphics.',
      'Proficient in Adobe CC (Premiere Pro, After Effects, Audition), Blender 3D (modeling, texturing, rigging, animation), and Cinema4D (3D motion graphics).',
      'Completed numerous projects showcasing expertise in video editing and animation.',
    ],
    skills: [
      SkillDetail(name: 'Adobe Illustrator', icon: SvgIcons.illustrator),
      SkillDetail(name: 'Adobe Photoshop', icon: SvgIcons.photoshop),
      SkillDetail(name: 'Blender', icon: SvgIcons.blender),
    ],
  ),
  WorkExperience(
    title: 'Graphics Designer',
    company: 'Fiverr (Freelance)',
    duration: 'Jan 2015 - Jan 2017',
    descriptionBullets: [
      'Started freelancing as a graphics designer at the age of 16.',
      'Designed logos, banner ads, Photoshop editing, and book covers for 1000+ clients on Fiverr and Upwork.',
      'Utilized Adobe CC (Photoshop, Illustrator, InDesign) and Corel Draw for creating content.',
    ],
    skills: [
      SkillDetail(name: 'Adobe Illustrator', icon: SvgIcons.illustrator),
      SkillDetail(name: 'Adobe Photoshop', icon: SvgIcons.photoshop),
    ],
  ),
];
