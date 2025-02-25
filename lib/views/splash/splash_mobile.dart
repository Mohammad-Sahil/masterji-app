part of splash_view;

class _SplashMobile extends StatelessWidget {
  final SplashViewModel viewModel;

  _SplashMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: homepagegrey,
        body: Image.asset(
          "assests/images/splash.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  // body Center(child: Image.asset("assests/images/masterji_logo_gif.gif")),
}
