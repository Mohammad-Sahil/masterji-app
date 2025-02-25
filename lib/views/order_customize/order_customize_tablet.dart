part of order_customize_view;

class _OrderCustomizeTablet extends StatelessWidget {
  final OrderCustomizeViewModel viewModel;

  _OrderCustomizeTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('OrderCustomizeTablet')),
    );
  }
}