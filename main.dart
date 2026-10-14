import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const StudentPortfolioApp());
}

const Color navy = Color(0xFF172554);
const Color blue = Color(0xFF3457D5);
const Color lavender = Color(0xFFEDEFFF);
const Color pageBackground = Color(0xFFF6F7FC);

class StudentPortfolioApp extends StatelessWidget {
  const StudentPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
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
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 17,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFE0E4F0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFE0E4F0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: blue, width: 1.6),
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class StudentData {
  static const name = 'K. Pooja';
  static const roll = '24WH1A0593';
  static const college = 'BVRITH';
  static const branch = 'Computer Science and Engineering';
}

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

  void _login() {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields.')),
      );
      return;
    }

    if (_rollController.text.trim().toUpperCase() != StudentData.roll) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the correct student roll number.'),
        ),
      );
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
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 460),
            child: Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
                side: const BorderSide(color: Color(0xFFE8EAF3)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 34,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Container(
                          width: 76,
                          height: 76,
                          decoration: BoxDecoration(
                            color: lavender,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Icon(
                            Icons.school_rounded,
                            size: 40,
                            color: navy,
                          ),
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
                        style: TextStyle(
                          color: Color(0xFF777F95),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 28),
                      const Text(
                        'Roll Number',
                        style: TextStyle(
                          color: navy,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _rollController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your roll number',
                          prefixIcon: Icon(Icons.badge_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your roll number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Password',
                        style: TextStyle(
                          color: navy,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _hidePassword,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          suffixIcon: IconButton(
                            tooltip: _hidePassword
                                ? 'Show password'
                                : 'Hide password',
                            onPressed: () {
                              setState(() => _hidePassword = !_hidePassword);
                            },
                            icon: Icon(
                              _hidePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
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
                              Text(
                                'Login to Portfolio',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
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

class PortfolioDashboard extends StatefulWidget {
  const PortfolioDashboard({super.key});

  @override
  State<PortfolioDashboard> createState() => _PortfolioDashboardState();
}

class _PortfolioDashboardState extends State<PortfolioDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    OverviewPage(),
    AcademicPage(),
    CertificationsPage(),
    ActivitiesPage(),
    AchievementsPage(),
  ];

  final List<String> _titles = const [
    'My Portfolio',
    'Academic Details',
    'Course Certifications',
    'Extra-Curricular Activities',
    'Achievements',
  ];

  Future<void> _logout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Logout?'),
        content: const Text('Are you sure you want to leave your portfolio?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
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

  void _selectPage(int index) {
    if (index == 5) {
      _logout();
      return;
    }
    setState(() => _selectedIndex = index);
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
                    style: const TextStyle(
                      color: navy,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          drawer: isWide ? null : Drawer(child: _navigation(closeDrawer: true)),
          body: Row(
            children: [
              if (isWide)
                SizedBox(width: 250, child: _navigation()),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: KeyedSubtree(
                    key: ValueKey(_selectedIndex),
                    child: _pages[_selectedIndex],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _navigation({bool closeDrawer = false}) {
    final items = [
      (Icons.dashboard_rounded, 'Overview'),
      (Icons.school_outlined, 'Academic Details'),
      (Icons.workspace_premium_outlined, 'Certifications'),
      (Icons.groups_2_outlined, 'Activities'),
      (Icons.emoji_events_outlined, 'Achievements'),
    ];

    return Container(
      color: Colors.white,
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
                      Text(
                        StudentData.name,
                        style: TextStyle(
                          color: navy,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        StudentData.roll,
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF7C8499),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFEEF0F6)),
          const SizedBox(height: 14),
          for (int i = 0; i < items.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              child: ListTile(
                selected: _selectedIndex == i,
                selectedTileColor: lavender,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                leading: Icon(
                  items[i].$1,
                  color: _selectedIndex == i ? navy : const Color(0xFF7C8499),
                ),
                title: Text(
                  items[i].$2,
                  style: TextStyle(
                    color: _selectedIndex == i ? navy : const Color(0xFF555D72),
                    fontSize: 13,
                    fontWeight: _selectedIndex == i
                        ? FontWeight.w800
                        : FontWeight.w500,
                  ),
                ),
                onTap: () {
                  _selectPage(i);
                  if (closeDrawer) {
                    Navigator.of(context).maybePop();
                  }
                },
              ),
            ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: ListTile(
              leading: const Icon(Icons.logout_rounded, color: Colors.redAccent),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onTap: _logout,
            ),
          ),
        ],
      ),
    );
  }
}

class PageContent extends StatelessWidget {
  final Widget child;
  const PageContent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(26),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1050),
          child: child,
        ),
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  final String title;
  final String subtitle;
  const SectionHeading({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            color: navy,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF777F95),
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

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
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final compact = constraints.maxWidth < 540;
                final intro = const Column(
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
                      style: TextStyle(
                        color: Color(0xFFE1E7FF),
                        height: 1.6,
                      ),
                    ),
                  ],
                );

                if (compact) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProfileAvatar(radius: 34),
                      const SizedBox(height: 20),
                      intro,
                    ],
                  );
                }
                return Row(
                  children: [
                    const ProfileAvatar(radius: 48),
                    const SizedBox(width: 25),
                    Expanded(child: intro),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 28),
          const SectionHeading(
            title: 'Portfolio at a glance',
            subtitle: 'A quick overview of the sections in my portfolio.',
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, constraints) {
              final count = constraints.maxWidth > 750
                  ? 3
                  : constraints.maxWidth > 480
                      ? 2
                      : 1;
              final cards = [
                const SummaryCard(
                  icon: Icons.school_outlined,
                  title: 'Academics',
                  subtitle: 'Education and institution details',
                  color: Color(0xFFE8EDFF),
                ),
                const SummaryCard(
                  icon: Icons.workspace_premium_outlined,
                  title: 'Certifications',
                  subtitle: 'Courses and learning milestones',
                  color: Color(0xFFE6F7F1),
                ),
                const SummaryCard(
                  icon: Icons.emoji_events_outlined,
                  title: 'Achievements',
                  subtitle: 'Highlights and memorable moments',
                  color: Color(0xFFFFF1DA),
                ),
              ];
              return GridView.count(
                crossAxisCount: count,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio
