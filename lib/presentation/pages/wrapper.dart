import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/pages/main_page.dart';
import 'package:movie_app/presentation/pages/sign_in_page.dart';
import 'package:movie_app/presentation/pages/sign_up_page.dart';
import 'package:movie_app/presentation/pages/splash_page.dart';
import 'package:provider/provider.dart';

import '../../bloc/bloc/page_bloc.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PageBloc>().add(OpenSplashPage());
    User? firebaseUser = Provider.of<User?>(context, listen: false);

    return BlocBuilder<PageBloc, PageState>(
        builder: (context, state) => (state is OnSplashPage)
            ? SplashPage()
            : (state is OnSignUpPage)
                ? SignUpPage()
                : (state is OnSignUpPage)
                    ? SignInPage()
                    : (state is OnMainPage)
                        ? MainPage()
                        : Container());
  }
}
