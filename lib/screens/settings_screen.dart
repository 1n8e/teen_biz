import 'package:flutter/material.dart';
import '../theme_notifier.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _emailUpdates = false;
  bool _parentNotifications = true;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = themeNotifier.value == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      body: ListView(
        children: [
          // _sectionHeader('Внешний вид'),
          // _buildThemeTile(context, isDark, cs),
          _sectionHeader('Уведомления'),
          _switchTile(
            icon: Icons.notifications_outlined,
            iconColor: const Color(0xFF4F46E5),
            title: 'Push-уведомления',
            subtitle: 'Новые заказы, сообщения, отзывы',
            value: _notifications,
            onChanged: (v) => setState(() => _notifications = v),
          ),
          _switchTile(
            icon: Icons.email_outlined,
            iconColor: const Color(0xFF10B981),
            title: 'Email-рассылка',
            subtitle: 'Новости платформы и советы',
            value: _emailUpdates,
            onChanged: (v) => setState(() => _emailUpdates = v),
          ),
          _switchTile(
            icon: Icons.family_restroom,
            iconColor: const Color(0xFFF59E0B),
            title: 'Уведомления для родителей',
            subtitle: 'Родитель получает сводку раз в неделю',
            value: _parentNotifications,
            onChanged: (v) => setState(() => _parentNotifications = v),
          ),
          _sectionHeader('Аккаунт'),
          _navTile(
            icon: Icons.lock_outline,
            iconColor: const Color(0xFF4F46E5),
            title: 'Изменить пароль',
            onTap: () {},
          ),
          _navTile(
            icon: Icons.verified_user_outlined,
            iconColor: const Color(0xFF10B981),
            title: 'Верификация',
            subtitle: 'Статус: Проверен',
            onTap: () {},
          ),
          _navTile(
            icon: Icons.language,
            iconColor: const Color(0xFF3B82F6),
            title: 'Язык',
            subtitle: 'Русский',
            onTap: () {},
          ),
          _sectionHeader('Поддержка'),
          _navTile(
            icon: Icons.help_outline,
            iconColor: const Color(0xFF8B5CF6),
            title: 'FAQ',
            onTap: () => Navigator.pushNamed(context, '/faq'),
          ),
          _navTile(
            icon: Icons.policy_outlined,
            iconColor: const Color(0xFF6B7280),
            title: 'Политика и правила',
            onTap: () => Navigator.pushNamed(context, '/policy'),
          ),
          _navTile(
            icon: Icons.support_agent,
            iconColor: const Color(0xFF10B981),
            title: 'Написать в поддержку',
            subtitle: 'support@teenbiz.kz',
            onTap: () {},
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OutlinedButton.icon(
              onPressed: () => _confirmLogout(context),
              icon: const Icon(Icons.logout, color: Color(0xFFEF4444)),
              label: const Text(
                'Выйти из аккаунта',
                style: TextStyle(color: Color(0xFFEF4444)),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFEF4444)),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Center(
            child: Text(
              'TeenBiz v1.0.0',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildThemeTile(BuildContext context, bool isDark, ColorScheme cs) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xFF312E81)
                          : const Color(0xFFEDE9FE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      isDark ? Icons.dark_mode : Icons.light_mode,
                      color: const Color(0xFF4F46E5),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Тема оформления',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          isDark ? 'Тёмная тема' : 'Светлая тема',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: isDark,
                    onChanged: (v) {
                      themeNotifier.value =
                          v ? ThemeMode.dark : ThemeMode.light;
                      setState(() {});
                    },
                    activeThumbColor: const Color(0xFF4F46E5),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, indent: 16, endIndent: 16),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  _themeOption(
                    context,
                    label: 'Светлая',
                    icon: Icons.light_mode,
                    selected: !isDark,
                    onTap: () {
                      themeNotifier.value = ThemeMode.light;
                      setState(() {});
                    },
                  ),
                  const SizedBox(width: 10),
                  _themeOption(
                    context,
                    label: 'Тёмная',
                    icon: Icons.dark_mode,
                    selected: isDark,
                    onTap: () {
                      themeNotifier.value = ThemeMode.dark;
                      setState(() {});
                    },
                  ),
                  const SizedBox(width: 10),
                  _themeOption(
                    context,
                    label: 'Системная',
                    icon: Icons.settings_suggest_outlined,
                    selected: themeNotifier.value == ThemeMode.system,
                    onTap: () {
                      themeNotifier.value = ThemeMode.system;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _themeOption(
    BuildContext context, {
    required String label,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected
                ? const Color(0xFF4F46E5)
                : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selected
                  ? const Color(0xFF4F46E5)
                  : Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 20,
                color: selected
                    ? Colors.white
                    : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: selected
                      ? Colors.white
                      : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45),
        ),
      ),
    );
  }

  Widget _switchTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return _tileWrapper(
      child: Row(
        children: [
          _tileIcon(icon, iconColor),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 14)),
                if (subtitle != null)
                  Text(subtitle,
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.5))),
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged, activeThumbColor: const Color(0xFF4F46E5)),
        ],
      ),
    );
  }

  Widget _navTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return _tileWrapper(
      onTap: onTap,
      child: Row(
        children: [
          _tileIcon(icon, iconColor),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 14)),
                if (subtitle != null)
                  Text(subtitle,
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.5))),
              ],
            ),
          ),
          Icon(Icons.chevron_right,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.3),
              size: 20),
        ],
      ),
    );
  }

  Widget _tileWrapper({required Widget child, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 6),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).cardTheme.color,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context)
                  .colorScheme
                  .outline
                  .withValues(alpha: 0.2),
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _tileIcon(IconData icon, Color color) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Icon(icon, color: color, size: 18),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Выйти из аккаунта?'),
        content: const Text('Ты уверен, что хочешь выйти?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/', (route) => false);
            },
            child: const Text('Выйти',
                style: TextStyle(color: Color(0xFFEF4444))),
          ),
        ],
      ),
    );
  }
}
