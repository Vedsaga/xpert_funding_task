import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xpert_funding_task/l10n/arb/app_localizations.dart';
import 'package:xpert_funding_task/modules/modules.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Inter',
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          surface: AppColors.surface,
          primary: AppColors.lightSkyBlue,
          secondary: AppColors.mintGreen,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.textPrimary),
          bodyMedium: TextStyle(color: AppColors.textSecondary),
          titleMedium: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
          headlineLarge: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      // These lines will now work correctly
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider(
        create: (context) => AccountBloc(
          accountRepository: AccountRepository(
            remoteDataSource: AccountRemoteDataSource(),
          ),
        )..add(const FetchAccountsEvent()),
        child: const AccountsScreen(),
      ),
    );
  }
}
