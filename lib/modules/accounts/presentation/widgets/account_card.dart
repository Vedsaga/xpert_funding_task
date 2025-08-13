import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xpert_funding_task/modules/modules.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({required this.account, super.key});

  final AccountModel account;

  @override
  Widget build(BuildContext context) {
    // Outer container for the gradient border (no changes here)
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(1.5),
      child: ClipRRect(
        // We need to clip the blur to the card's rounded corners.
        borderRadius: BorderRadius.circular(10.5),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          account.accountName,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        if (account.isProAccount) ...[
                          const SizedBox(width: 8),
                          _buildTag(
                            'PRO',
                            AppColors.discordPurple.withAlpha(179),
                            AppColors.white,
                          ),
                        ],
                      ],
                    ),
                    _buildStatusTag(account.isOnChallenge),
                  ],
                ),
                const SizedBox(height: 12),

                // --- Middle Section: Account Size and Details ---
                Text(
                  NumberFormat.currency(locale: 'en_US', symbol: r'$')
                      .format(account.size),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                Text.rich(
                  TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      const TextSpan(text: 'Balance: '),
                      TextSpan(
                        text:
                            '''${NumberFormat.currency(locale: 'en_US', symbol: r'$').format(account.balance)} • ''',
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(text: 'Bought: '),
                      TextSpan(
                        text:
                            '''${DateFormat('MMM dd, yyyy').format(account.createdAt)} • ''',
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(text: 'ID: '),
                      TextSpan(
                        text: account.id,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // --- Phase Indicator Row ---
                _buildPhaseIndicatorRow(),
                const SizedBox(height: 16),

                // --- Dashboard Button ---
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.dashboard_outlined, size: 16),
                    label: const Text('Dashboard'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.black,
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Builds the horizontal row of phase indicators
  Widget _buildPhaseIndicatorRow() {
    if (account.isOnChallenge) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPhaseItem('Evaluation 1', isActive: account.currentPhase == 1),
          const Icon(
            Icons.arrow_forward,
            size: 16,
            color: AppColors.textSecondary,
          ),
          _buildPhaseItem('Evaluation 2', isActive: account.currentPhase == 2),
          const Icon(
            Icons.arrow_forward,
            size: 16,
            color: AppColors.textSecondary,
          ),
          _buildPhaseItem(
            'Master Account',
            isActive: false,
          ), // Never active in challenge
        ],
      );
    }
    // For funded accounts, this section is empty as per the design.
    return const SizedBox.shrink();
  }

  // Helper for a single item in the phase indicator row
  Widget _buildPhaseItem(String label, {required bool isActive}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? AppColors.mutedPurpleBlue : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isActive ? AppColors.mutedPurpleBlue : AppColors.textSecondary,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? AppColors.textPrimary : AppColors.textSecondary,
        ),
      ),
    );
  }

  // Helper for status tags
  Widget _buildStatusTag(bool isOnChallenge) {
    return _buildTag(
      isOnChallenge ? 'On Challenge' : 'Funded',
      isOnChallenge
          ? AppColors.lightSkyBlue.withAlpha(77)
          : AppColors.mintGreen.withAlpha(77),
      isOnChallenge ? AppColors.lightSkyBlue : AppColors.mintGreen,
    );
  }

  // Generic tag builder
  Widget _buildTag(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration:
          BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(6)),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    );
  }
}
