import 'package:toggel_client/shared/resource/images.dart';

class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({this.image, this.title, this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Toggl',
      image: first,
      discription: "Get your remote-working, time tracking, project-planning, and hiring best practices here! Straight from the experts at Toggl."
  ),
  UnbordingContent(
      title: 'Toggl',
      image: second,
      discription: "Get your remote-working, time tracking, project-planning, and hiring best practices here! Straight from the experts at Toggl."
  ),
  UnbordingContent(
      title: 'Toggl',
      image: second,
      discription:"Get your remote-working, time tracking, project-planning, and hiring best practices here! Straight from the experts at Toggl."
  ),
];