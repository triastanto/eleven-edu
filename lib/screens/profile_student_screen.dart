import 'package:flutter/material.dart';
import '../widgets/base_card_container.dart';
import '../theme/app_colors.dart';
import '../constants/app_strings.dart';
import '../services/navigation_service.dart';

class ProfileStudentScreen extends StatelessWidget {
  const ProfileStudentScreen({super.key});

  void _onMorePressed(BuildContext context) {
    NavigationService.showMoreOptions(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.primary),
          onPressed: () => NavigationService.navigateBack(context),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.person, color: theme.colorScheme.primary, size: 32),
            const SizedBox(width: AppStrings.defaultSpacing),
            Flexible(
              child: Text(
                AppStrings.profile,
                style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            color: theme.iconTheme.color,
            onPressed: () => _onMorePressed(context),
          ),
        ],
      ),
      body: const _ProfileBody(),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: AppStrings.largeSpacing, vertical: AppStrings.defaultSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ProfileCard(),
          SizedBox(height: AppStrings.extraLargeSpacing),
          _StudentDetailsCard(),
          SizedBox(height: AppStrings.sectionSpacing),
          _ProfileActions(),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = Theme.of(context).extension<AppColors>();
    return BaseCardContainer(
      padding: const EdgeInsets.symmetric(vertical: AppStrings.extraLargeSpacing, horizontal: AppStrings.largeSpacing),
      color: theme.cardColor,
      child: Column(
        children: [
          const CircleAvatar(
            radius: 48,
            backgroundImage: AssetImage('assets/profile_student.jpg'),
          ),
          const SizedBox(height: AppStrings.largeSpacing),
          Text('Ellen Smith', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text('Grade 7 - A', style: theme.textTheme.titleMedium?.copyWith(color: theme.hintColor)),
          const SizedBox(height: AppStrings.largeSpacing),
          Divider(color: appColors?.announcementInfoBox ?? theme.dividerColor),
          const SizedBox(height: 12),
          Text(
            'Lorem ipsum dolor sit amet consectetur. Pulvinar in at nunc bibendum. Diam a cras sit sapien aenean dolor egestas.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
          ),
        ],
      ),
    );
  }
}

class _StudentDetailsCard extends StatelessWidget {
  const _StudentDetailsCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseCardContainer(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: AppStrings.largeSpacing),
      color: theme.cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.studentDetails, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: AppStrings.largeSpacing),
          const _DetailRow(label: AppStrings.dateOfBirth, value: '12/03/2008'),
          const _DetailRow(label: AppStrings.className, value: '7A'),
          const _DetailRow(label: AppStrings.absenceNumber, value: '7'),
          const _DetailRow(label: AppStrings.phoneNumber, value: '12345678910'),
          const _DetailRow(label: AppStrings.motherName, value: 'Sri Mulyani'),
          const _DetailRow(label: AppStrings.fatherName, value: 'Mulyono Widodo'),
          const _DetailRow(label: AppStrings.address, value: 'Jl. H.A. Salim no 32\nTaman, Madiun'),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(label, style: theme.textTheme.bodyLarge),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileActions extends StatelessWidget {
  const _ProfileActions();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ActionButton(
          icon: Icons.settings,
          label: AppStrings.settings,
          color: Colors.white,
          borderColor: theme.colorScheme.primary.withAlpha(60),
          textColor: theme.colorScheme.primary,
          onTap: () {},
        ),
        _ActionButton(
          icon: Icons.logout,
          label: AppStrings.logOut,
          color: Colors.white,
          borderColor: theme.colorScheme.error.withAlpha(80),
          textColor: theme.colorScheme.error,
          onTap: () {},
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color borderColor;
  final Color textColor;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.borderColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: AppStrings.defaultSpacing),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppStrings.largeSpacing),
            border: Border.all(color: borderColor, width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: textColor, size: 28),
              const SizedBox(width: AppStrings.defaultSpacing),
              Text(label, style: TextStyle(fontSize: 18, color: textColor)),
            ],
          ),
        ),
      ),
    );
  }
}
