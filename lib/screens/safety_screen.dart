import 'package:flutter/material.dart';
import '../theme.dart';

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Безопасность')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildBanner(),
            _buildSection1(context),
            _buildSection2(context),
            _buildSection3(context),
            _buildSection4(context),
            _buildSection5(context),
            _buildOfflineTips(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF065F46), AppTheme.accent, Color(0xFF059669)],
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.shield, color: Colors.white, size: 32),
          ),
          const SizedBox(height: 16),
          const Text(
            'Как мы защищаем\nпользователей',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w800,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Мы не просто говорим «мы безопасны» — мы объясняем как именно это работает',
            style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildSection1(BuildContext context) {
    return _safetyCard(context,
      number: '01',
      color: AppTheme.primary,
      icon: Icons.chat_bubble_outline,
      title: 'Чат только внутри платформы',
      items: [
        _safetyItem(
          Icons.block,
          AppTheme.danger,
          'Нельзя отправлять номер телефона',
          'Автоматический фильтр блокирует попытки передачи личных контактов',
        ),
        _safetyItem(
          Icons.location_off,
          AppTheme.danger,
          'Нельзя писать домашний адрес',
          'Система распознаёт адреса и заменяет их предупреждением',
        ),
        _safetyItem(
          Icons.filter_alt,
          AppTheme.warning,
          'Фильтр опасных слов и фраз',
          'ИИ анализирует сообщения и блокирует подозрительный контент',
        ),
        _safetyItem(
          Icons.security,
          AppTheme.accent,
          'Все переписки хранятся',
          'В случае жалобы — история чата доступна модераторам',
        ),
      ],
    );
  }

  Widget _buildSection2(BuildContext context) {
    return _safetyCard(context,
      number: '02',
      color: AppTheme.danger,
      icon: Icons.flag_outlined,
      title: 'Система жалоб',
      items: [
        _safetyItem(
          Icons.report_outlined,
          AppTheme.danger,
          'Кнопка «Пожаловаться» везде',
          'В профиле, в чате, в заказе — жалобу можно подать в 1 клик',
        ),
        _safetyItem(
          Icons.timer,
          AppTheme.warning,
          'Быстрая реакция — до 2 часов',
          'Модератор рассматривает жалобу приоритетно в рабочее время',
        ),
        _safetyItem(
          Icons.block,
          AppTheme.danger,
          'Временная блокировка аккаунта',
          'При подозрении — аккаунт блокируется до выяснения обстоятельств',
        ),
        _safetyItem(
          Icons.gavel,
          AppTheme.primary,
          'Постоянный бан за нарушения',
          'Опасные пользователи навсегда удаляются с платформы',
        ),
      ],
    );
  }

  Widget _buildSection3(BuildContext context) {
    return _safetyCard(context,
      number: '03',
      color: const Color(0xFFF59E0B),
      icon: Icons.account_balance_wallet_outlined,
      title: 'Эскроу-система платежей',
      items: [
        _safetyItem(
          Icons.lock,
          const Color(0xFFF59E0B),
          'Деньги замораживаются при заказе',
          'Заказчик платит вперёд, но деньги хранятся у нас, не у исполнителя',
        ),
        _safetyItem(
          Icons.check_circle_outline,
          AppTheme.accent,
          'Исполнитель получает только после подтверждения',
          'Деньги переводятся только когда заказчик доволен результатом',
        ),
        _safetyItem(
          Icons.undo,
          AppTheme.primary,
          'Возврат при спорах',
          'Если работа не выполнена — деньги возвращаются заказчику',
        ),
        _safetyItem(
          Icons.support_agent,
          AppTheme.accent,
          'Арбитраж модератором',
          'При конфликте модератор рассматривает ситуацию и выносит решение',
        ),
      ],
    );
  }

  Widget _buildSection4(BuildContext context) {
    return _safetyCard(context,
      number: '04',
      color: AppTheme.accent,
      icon: Icons.star_outline,
      title: 'Рейтинг и отзывы',
      items: [
        _safetyItem(
          Icons.trending_down,
          AppTheme.danger,
          'Низкий рейтинг = меньше заказов',
          'Алгоритм снижает видимость пользователей с плохими отзывами',
        ),
        _safetyItem(
          Icons.verified_user,
          AppTheme.accent,
          'Только реальные отзывы',
          'Отзыв можно оставить только после завершения реального заказа',
        ),
        _safetyItem(
          Icons.warning_amber,
          AppTheme.warning,
          'Подозрительные аккаунты проверяются',
          'При резком изменении рейтинга — автоматическая проверка аккаунта',
        ),
        _safetyItem(
          Icons.badge,
          AppTheme.primary,
          'Значок «Проверен»',
          'Пользователи с верификацией имеют специальный значок доверия',
        ),
      ],
    );
  }

  Widget _buildSection5(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.accent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    '05',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Политика безопасности аккаунта',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _checkItem('Двухфакторная аутентификация при входе'),
            _checkItem('Уведомление родителей о крупных заказах'),
            _checkItem('Ограничение суммы сделки для несовершеннолетних'),
            _checkItem('Регулярная проверка верификации'),
            _checkItem('Возможность родителю отключить аккаунт ребёнка'),
          ],
        ),
      ),
    );
  }

  Widget _buildOfflineTips(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.warning.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.warning.withValues(alpha: 0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.place, color: Color(0xFFF59E0B), size: 20),
              SizedBox(width: 8),
              Text(
                'Рекомендации для офлайн-встреч',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _tipItem(
            '🏛️',
            'Встречайтесь только в публичных местах (кафе, библиотека, парк)',
          ),
          _tipItem('👨‍👩‍👧', 'Желательно приходить вместе с родителями'),
          _tipItem('📍', 'Никогда не сообщайте домашний адрес'),
          _tipItem('📱', 'Сообщайте родителям где, когда и с кем встречаетесь'),
          _tipItem(
            '🚫',
            'Отказывайтесь от встреч в незнакомых или закрытых местах',
          ),
          _tipItem('📞', 'При угрозе — сразу звоните 112'),
        ],
      ),
    );
  }

  Widget _safetyCard(BuildContext context, {
    required String number,
    required Color color,
    required IconData icon,
    required String title,
    required List<Widget> items,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      number,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Icon(icon, color: color, size: 22),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: items),
            ),
          ],
        ),
      ),
    );
  }

  Widget _safetyItem(
    IconData icon,
    Color iconColor,
    String title,
    String desc,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  desc,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: AppTheme.accent, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tipItem(String emoji, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
