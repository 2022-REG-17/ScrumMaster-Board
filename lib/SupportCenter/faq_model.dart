class FAQContent {
  String question;
  String answer;

  FAQContent({this.question, this.answer});
}

List<FAQContent> faqcontents = [
  FAQContent(
      question: 'How to create a project?',
      answer:
          "Navigate to Projects Screen. Then give the required project details. Finally click on Create Project"),
  FAQContent(
      question: 'What is sprint?',
      answer:
          "In scrum and other agile software development frameworks, a sprint is a repeatable fixed time-box during which a 'Done' product of the highest possible value is created"),
  FAQContent(
      question: 'How to add tasks?',
      answer:
          'Navigate to Tasks Screen. Then give the required task details. Finally click on Create Task'),
  FAQContent(
      question: 'How to create tickets?',
      answer:
          "Navigate to Tickets Screen. Then give the required ticket details. Finally click on Create Ticket"),
  FAQContent(
      question: 'Can I delete a project in ScrumRoot',
      answer: "Yes, you can delete your project"),
];
