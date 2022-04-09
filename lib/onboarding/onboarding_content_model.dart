class OnbordingContent {
  String image;
  String title;
  String discription;

  OnbordingContent({this.image, this.title, this.discription});
}

List<OnbordingContent> contents = [
  OnbordingContent(
      title: 'ScrumRoot',
      image: 'assets/images/scrum1.png',
      discription: "The #1 software development tool used by agile teams"),
  OnbordingContent(
      title: 'The best software teams ship early and often',
      image: 'assets/images/scrum2.png',
      discription:
          "ScrumRoot is built for every member of your software team to release great software"),
  OnbordingContent(
      title: 'ScrumRoot',
      image: 'assets/images/scrum3.png',
      discription: 'Choose a workflow, or make your own')
];
