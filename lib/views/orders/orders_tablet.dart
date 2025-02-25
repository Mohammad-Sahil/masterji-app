part of orders_view;

class _OrdersTablet extends StatelessWidget {
  final OrdersViewModel viewModel;

  _OrdersTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('OrdersTablet')),
    );
  }
}