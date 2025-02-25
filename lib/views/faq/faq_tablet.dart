part of faq_view;

class _FaqTablet extends StatelessWidget {
  final FaqViewModel viewModel;

  _FaqTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('FaqTablet')),
    );
  }
}