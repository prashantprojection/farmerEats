class Route {
  final String initial;
  final String login;
  final String signup;
  final String farminfo;
  final String verification;
  final String businessHours;
  final String confirmation;
  final String forgotPassword;
  final String otp;
  final String resetPassword;

  Route(
      {required this.initial,
      required this.login,
      required this.signup,
      required this.businessHours,
      required this.confirmation,
      required this.farminfo,
      required this.verification,
      required this.forgotPassword,
      required this.otp,
      required this.resetPassword});
}

Route route = Route(
    initial: "/",
    login: "/login",
    signup: "/signup",
    businessHours: "/businessHours",
    confirmation: "/confirmation",
    farminfo: "/farminfo",
    verification: "/verification",
    forgotPassword: "/forgotPassword",
    otp: "/otp",
    resetPassword: "/resetPassword");
