import 'package:flutter/material.dart';

void main() {
  runApp(const StudentPortfolioApp());
}

// ───────────────────────── THEME COLORS ─────────────────────────
const Color navy = Color(0xFF172554);
const Color blue = Color(0xFF3457D5);
const Color lavender = Color(0xFFEDEFFF);
const Color pageBackground = Color(0xFFF6F7FC);
const Color mutedText = Color(0xFF777F95);
const Color borderColor = Color(0xFFE8EAF3);

class StudentPortfolioApp extends StatelessWidget {
  const StudentPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border(Color c, [double w = 1]) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: c, width: w),
        );

    return MaterialApp(
      title: 'Student E-Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: pageBackground,
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        fontFamily: 'Arial',
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFF7F8FC),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
          border: border(const Color(0xFFE0E4F0)),
          enabledBorder: border(const Color(0xFFE0E4F0)),
          focusedBorder: border(blue, 1.6),
          errorBorder: border(Colors.redAccent),
          focusedErrorBorder: border(Colors.redAccent, 1.6),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

// ───────────────────────── DATA (EDIT HERE) ─────────────────────────
class StudentData {
  static const name = 'K. Pooja';
  static const roll = '24WH1A0593';
  static const college = 'BVRITH';
  static const branch = 'Computer Science and Engineering';
  static const year = 'II Year';
  static const email = 'pooja@example.com'; // change to your email
  static const about =
      'A passionate Computer Science student who loves designing clean user '
      'interfaces and building useful apps. Always curious, always learning.';

  static const skills = [
    'Flutter',
    'Dart',
    'UI/UX Design',
    'Python',
    'Java',
    'HTML & CSS',
    'Problem Solving',
  ];

  static const certifications = [
    Item(Icons.code_rounded, 'Python Programming', 'NPTEL • 2025',
        'Completed the course covering Python fundamentals and problem solving.'),
    Item(Icons.phone_android_rounded, 'Flutter App Development', 'Udemy • 2025',
        'Learned to build cross-platform mobile apps using Flutter and Dart.'),
    Item(Icons.web_rounded, 'Web Development Basics', 'Coursera • 2025',
        'Hands-on course on HTML, CSS and responsive design.'),
  ];

  static const activities = [
    Item(Icons.groups_rounded, 'Coding Club', 'Member',
        'Participates in weekly coding sessions and peer learning.'),
    Item(Icons.volunteer_activism_rounded, 'NSS Volunteer', 'Volunteer',
        'Takes part in community service and awareness drives.'),
    Item(Icons.palette_rounded, 'Design Team', 'Contributor',
        'Creates posters and UI designs for college events.'),
  ];

  static const achievements = [
    Item(Icons.emoji_events_rounded, 'Hackathon Participant', 'College Level',
        'Built a working prototype within 24 hours with a team.'),
    Item(Icons.star_rounded, 'Academic Excellence', 'Semester Award',
        'Recognised for consistent academic performance.'),
    Item(Icons.military_tech_rounded, 'UID Lab Project', 'BVRITH',
        'Designed and developed this e-portfolio application.'),
  ];
}

class Item {
  final IconData icon;
  final String title;
  final String tag;
  final String description;
  const Item(this.icon, this.title, this.tag, this.description);
}

// ───────────────────────── LOGIN ─────────────────────────
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _rollController = TextEditingController(text: StudentData.roll);
  final _passwordController = TextEditingController();
  bool _hidePassword = true;

  @override
  void dispose() {
    _rollController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _snack(String msg) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(msg),
        behavior: SnackBarBehavior.floating,
      ));
  }

  void _login() {
    if (!_formKey.currentState!.validate()) {
      _snack('Please fill in all required fields.');
      return;
    }
    if (_rollController.text.trim().toUpperCase() != StudentData.roll) {
      _snack('Please enter the correct student roll number.');
      return;
    }
    // UID Lab demo login: any non-empty password is accepted.
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const PortfolioDashboard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE9ECFF), pageBackground, Color(0xFFDDE4FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 34),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: borderColor),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A3457D5),
                      blurRadius: 40,
                      offset: Offset(0, 18),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Container(
                          width: 76,
                          height: 76,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [lavender, Color(0xFFD7DEFF)]),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Icon(Icons.school_rounded,
                              size: 40, color: navy),
                        ),
                      ),
                      const SizedBox(height: 22),
                      const Text(
                        'STUDENT E-PORTFOLIO',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 9),
                      const Text(
                        'Welcome back, Pooja!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: navy,
                          fontSize: 27,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 9),
                      const Text(
                        'Sign in to explore your academic journey\nand achievements.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: mutedText, height: 1.5),
                      ),
                      const SizedBox(height: 28),
                      const _FieldLabel('Roll Number'),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _rollController,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.characters,
                        decoration: const InputDecoration(
                          hintText: 'Enter your roll number',
                          prefixIcon: Icon(Icons.badge_outlined),
                        ),
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? 'Please enter your roll number'
                            : null,
                      ),
                      const SizedBox(height: 18),
                      const _FieldLabel('Password'),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _hidePassword,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          suffixIcon: IconButton(
                            tooltip:
                                _hidePassword ? 'Show password' : 'Hide password',
                            onPressed: () =>
                                setState(() => _hidePassword = !_hidePassword),
                            icon: Icon(_hidePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                          ),
                        ),
                        validator: (v) => (v == null || v.isEmpty)
                            ? 'Please enter your password'
                            : null,
                        onFieldSubmitted: (_) => _login(),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 52,
                        child: FilledButton(
                          onPressed: _login,
                          style: FilledButton.styleFrom(
                            backgroundColor: navy,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Login to Portfolio',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(width: 10),
                              Icon(Icons.arrow_forward_rounded, size: 19),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'UID LAB PROJECT  •  BVRITH',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF9097AA),
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(color: navy, fontWeight: FontWeight.w700),
      );
}

// ───────────────────────── DASHBOARD ─────────────────────────
class PortfolioDashboard extends StatefulWidget {
  const PortfolioDashboard({super.key});

  @override
  State<PortfolioDashboard> createState() => _PortfolioDashboardState();
}

class _PortfolioDashboardState extends State<PortfolioDashboard> {
  int _selectedIndex = 0;

  static const _titles = [
    'My Portfolio',
    'Academic Details',
    'Course Certifications',
    'Extra-Curricular Activities',
    'Achievements',
  ];

  static const _navItems = [
    (Icons.dashboard_rounded, 'Overview'),
    (Icons.school_outlined, 'Academic Details'),
    (Icons.workspace_premium_outlined, 'Certifications'),
    (Icons.groups_2_outlined, 'Activities'),
    (Icons.emoji_events_outlined, 'Achievements'),
  ];

  Widget _pageFor(int index) {
    switch (index) {
      case 1:
        return const AcademicPage();
      case 2:
        return const ItemsPage(
          title: 'Course Certifications',
          subtitle: 'Courses I completed and skills I gained.',
          items: StudentData.certifications,
          accent: Color(0xFF1B9C73),
          accentBg: Color(0xFFE6F7F1),
        );
      case 3:
        return const ItemsPage(
          title: 'Extra-Curricular Activities',
          subtitle: 'Clubs, volunteering and creative work beyond class.',
          items: StudentData.activities,
          accent: Color(0xFF7A4BD6),
          accentBg: Color(0xFFF0E9FF),
        );
      case 4:
        return const ItemsPage(
          title: 'Achievements',
          subtitle: 'Highlights and memorable moments.',
          items: StudentData.achievements,
          accent: Color(0xFFD98300),
          accentBg: Color(0xFFFFF1DA),
        );
      default:
        return OverviewPage(onOpen: (i) => setState(() => _selectedIndex = i));
    }
  }

  Future<void> _logout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Logout?'),
        content: const Text('Are you sure you want to leave your portfolio?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: navy),
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (shouldLogout == true && mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginPage()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 850;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
            iconTheme: const IconThemeData(color: navy),
            shape: const Border(bottom: BorderSide(color: borderColor)),
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: lavender,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.school_rounded, color: navy),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    _titles[_selectedIndex],
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: navy,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: isWide ? null : Drawer(child: _navigation(inDrawer: true)),
          body: Row(
            children: [
              if (isWide)
                SizedBox(
                  width: 250,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      border: Border(right: BorderSide(color: borderColor)),
                    ),
                    child: _navigation(),
                  ),
                ),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: KeyedSubtree(
                    key: ValueKey(_selectedIndex),
                    child: _pageFor(_selectedIndex),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _navigation({bool inDrawer = false}) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 24),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: lavender,
                    child: Icon(Icons.person_rounded, color: navy, size: 30),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StudentData.name,
                            style: TextStyle(
                                color: navy, fontWeight: FontWeight.w800)),
                        SizedBox(height: 3),
                        Text(StudentData.roll,
                            style: TextStyle(
                                fontSize: 11, color: Color(0xFF7C8499))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFFEEF0F6)),
            const SizedBox(height: 14),
            for (int i = 0; i < _navItems.length; i++)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                child: ListTile(
                  selected: _selectedIndex == i,
                  selectedTileColor: lavender,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  leading: Icon(
                    _navItems[i].$1,
                    color:
                        _selectedIndex == i ? navy : const Color(0xFF7C8499),
                  ),
                  title: Text(
                    _navItems[i].$2,
                    style: TextStyle(
                      color: _selectedIndex == i
                          ? navy
                          : const Color(0xFF555D72),
                      fontSize: 13,
                      fontWeight: _selectedIndex == i
                          ? FontWeight.w800
                          : FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    setState(() => _selectedIndex = i);
                    if (inDrawer) Navigator.of(context).pop();
                  },
                ),
              ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(12),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                leading:
                    const Icon(Icons.logout_rounded, color: Colors.redAccent),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.redAccent, fontWeight: FontWeight.w700),
                ),
                onTap: () {
                  if (inDrawer) Navigator.of(context).pop();
                  _logout();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ───────────────────────── SHARED WIDGETS ─────────────────────────
class PageContent extends StatelessWidget {
  final Widget child;
  const PageContent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(22),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1050),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) => Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 18 * (1 - value)),
                child: child,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  final String title;
  final String subtitle;
  const SectionHeading({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 25, color: navy, fontWeight: FontWeight.w800)),
        const SizedBox(height: 7),
        Text(subtitle,
            style: const TextStyle(color: mutedText, height: 1.5)),
      ],
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  final double radius;
  const ProfileAvatar({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [Colors.white, Color(0xFFB8C4FF)]),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: lavender,
        child: Text(
          'KP',
          style: TextStyle(
            color: navy,
            fontSize: radius * 0.75,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(22),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: borderColor),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0F172554),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color background;
  const IconBadge({
    super.key,
    required this.icon,
    this.color = navy,
    this.background = lavender,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, color: color),
    );
  }
}

// ───────────────────────── OVERVIEW ─────────────────────────
class OverviewPage extends StatelessWidget {
  final ValueChanged<int> onOpen;
  const OverviewPage({super.key, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    return PageContent(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [navy, Color(0xFF354DA3)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x40172554),
                  blurRadius: 30,
                  offset: Offset(0, 14),
                ),
              ],
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final compact = constraints.maxWidth < 540;
                const intro = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'STUDENT PORTFOLIO',
                      style: TextStyle(
                        color: Color(0xFFCBD5FF),
                        fontSize: 11,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Hello, Pooja!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Welcome to my academic journey. Explore my education, skills, activities, and achievements.',
                      style: TextStyle(color: Color(0xFFE1E7FF), height: 1.6),
                    ),
                  ],
                );

                if (compact) {
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileAvatar(radius: 34),
                      SizedBox(height: 20),
                      intro,
                    ],
                  );
                }
                return const Row(
                  children: [
                    ProfileAvatar(radius: 48),
                    SizedBox(width: 25),
                    Expanded(child: intro),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 22),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('About Me',
                    style: TextStyle(
                        color: navy, fontSize: 17, fontWeight: FontWeight.w800)),
                const SizedBox(height: 10),
                const Text(StudentData.about,
                    style: TextStyle(color: mutedText, height: 1.6)),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final s in StudentData.skills)
                      Chip(
                        label: Text(s),
                        backgroundColor: lavender,
                        side: BorderSide.none,
                        labelStyle: const TextStyle(
                            color: navy,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const SectionHeading(
            title: 'Portfolio at a glance',
            subtitle: 'Tap a card to explore that section of my portfolio.',
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, constraints) {
              final count = constraints.maxWidth > 750
                  ? 4
                  : constraints.maxWidth > 480
                      ? 2
                      : 1;
              final cards = <Widget>[
                SummaryCard(
                  icon: Icons.school_outlined,
                  title: 'Academics',
                  subtitle: 'Education and institution details',
                  color: const Color(0xFFE8EDFF),
                  iconColor: blue,
                  onTap: () => onOpen(1),
                ),
                SummaryCard(
                  icon: Icons.workspace_premium_outlined,
                  title: 'Certifications',
                  subtitle: 'Courses and learning milestones',
                  color: const Color(0xFFE6F7F1),
                  iconColor: const Color(0xFF1B9C73),
                  onTap: () => onOpen(2),
                ),
                SummaryCard(
                  icon: Icons.groups_2_outlined,
                  title: 'Activities',
                  subtitle: 'Clubs, volunteering and more',
                  color: const Color(0xFFF0E9FF),
                  iconColor: const Color(0xFF7A4BD6),
                  onTap: () => onOpen(3),
                ),
                SummaryCard(
                  icon: Icons.emoji_events_outlined,
                  title: 'Achievements',
                  subtitle: 'Highlights and memorable moments',
                  color: const Color(0xFFFFF1DA),
                  iconColor: const Color(0xFFD98300),
                  onTap: () => onOpen(4),
                ),
              ];
              return GridView.count(
                crossAxisCount: count,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: count == 1 ? 3.2 : 1.35,
                children: cards,
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final Color iconColor;
  final VoidCallback? onTap;

  const SummaryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    this.iconColor = navy,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconBadge(icon: icon, color: iconColor, background: color),
          const SizedBox(height: 12),
          Text(title,
              style: const TextStyle(
                  color: navy, fontSize: 16, fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          Text(
            subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: mutedText, fontSize: 12, height: 1.4),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────── ACADEMIC ─────────────────────────
class AcademicPage extends StatelessWidget {
  const AcademicPage({super.key});

  @override
  Widget build(BuildContext context) {
    const details = [
      (Icons.person_outline_rounded, 'Name', StudentData.name),
      (Icons.badge_outlined, 'Roll Number', StudentData.roll),
      (Icons.account_balance_outlined, 'College', StudentData.college),
      (Icons.computer_rounded, 'Branch', StudentData.branch),
      (Icons.calendar_today_outlined, 'Year', StudentData.year),
      (Icons.mail_outline_rounded, 'Email', StudentData.email),
    ];

    return PageContent(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            title: 'Academic Details',
            subtitle: 'My education and institution information.',
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final twoCols = constraints.maxWidth > 650;
              final width = twoCols
                  ? (constraints.maxWidth - 15) / 2
                  : constraints.maxWidth;
              return Wrap(
                spacing: 15,
                runSpacing: 15,
                children: [
                  for (final d in details)
                    SizedBox(
                      width: width,
                      child: AppCard(
                        child: Row(
                          children: [
                            IconBadge(icon: d.$1),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(d.$2,
                                      style: const TextStyle(
                                          color: mutedText, fontSize: 12)),
                                  const SizedBox(height: 4),
                                  Text(d.$3,
                                      style: const TextStyle(
                                          color: navy,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 15)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// ───────────────────────── GENERIC LIST PAGE ─────────────────────────
class ItemsPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Item> items;
  final Color accent;
  final Color accentBg;

  const ItemsPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.items,
    required this.accent,
    required this.accentBg,
  });

  @override
  Widget build(BuildContext context) {
    return PageContent(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading(title: title, subtitle: subtitle),
          const SizedBox(height: 20),
          for (final item in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: AppCard(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconBadge(
                        icon: item.icon, color: accent, background: accentBg),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title,
                              style: const TextStyle(
                                  color: navy,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800)),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: accentBg,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(item.tag,
                                style: TextStyle(
                                    color: accent,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w800)),
                          ),
                          const SizedBox(height: 10),
                          Text(item.description,
                              style: const TextStyle(
                                  color: mutedText, height: 1.5)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
