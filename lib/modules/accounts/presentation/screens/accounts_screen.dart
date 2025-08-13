import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xpert_funding_task/modules/modules.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Accounts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          switch (state) {
            case AccountInitial() || AccountLoading():
              return const Center(child: CircularProgressIndicator());
            case AccountLoaded():
              return Stack(
                children: [
                  Positioned(
                    top: -150,
                    left: -100,
                    child: Container(
                      width: 400,
                      height: 400,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            AppColors.primaryBlue,
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.8],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1400),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final int crossAxisCount;
                          if (constraints.maxWidth > 1024) {
                            crossAxisCount = 3;
                          } else if (constraints.maxWidth > 640) {
                            crossAxisCount = 2;
                          } else {
                            crossAxisCount = 1;
                          }

                          const cardHeight = 320.0;
                          final cardWidth = (constraints.maxWidth -
                                  (24 * (crossAxisCount + 1))) /
                              crossAxisCount;
                          final aspectRatio = cardWidth / cardHeight;

                          return GridView.builder(
                            padding: const EdgeInsets.all(24),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              childAspectRatio: aspectRatio,
                              crossAxisSpacing: 24,
                              mainAxisSpacing: 24,
                            ),
                            itemCount: state.accounts.length,
                            itemBuilder: (context, index) {
                              // Use the new ChallengeCard widget
                              return AccountCard(
                                account: state.accounts[index],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );

            case AccountError():
              return const Center(child: Text('Something went wrong.'));
          }
        },
      ),
    );
  }
}
