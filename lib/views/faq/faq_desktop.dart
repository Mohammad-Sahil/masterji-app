part of faq_view;

class _FaqDesktop extends StatelessWidget {
  final FaqViewModel viewModel;

  _FaqDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('FaqDesktop')),
    );
  }
}