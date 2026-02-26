import 'package:flutter/material.dart';
import '../theme.dart';

class PolicyScreen extends StatefulWidget {
  const PolicyScreen({super.key});

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Документы'),
        bottom: TabBar(
          controller: _tabs,
          tabs: const [
            Tab(text: 'Политика безопасности'),
            Tab(text: 'Правила пользования'),
          ],
          labelColor: AppTheme.primary,
          unselectedLabelColor: AppTheme.textSecondary,
          indicatorColor: AppTheme.primary,
          labelStyle: const TextStyle(fontSize: 12),
        ),
      ),
      body: TabBarView(
        controller: _tabs,
        children: [_buildSafetyPolicy(), _buildTerms()],
      ),
    );
  }

  Widget _buildSafetyPolicy() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _docHeader(
            'Политика безопасности',
            'Последнее обновление: 1 января 2025',
            Icons.security,
            AppTheme.accent,
          ),
          _section('1. Верификация пользователей', [
            'Все пользователи обязаны пройти верификацию личности путём загрузки документа, удостоверяющего личность.',
            'Для пользователей младше 18 лет обязательно предоставление письменного согласия родителя или законного опекуна.',
            'Верификация проверяется модератором в течение 24 часов.',
            'Аккаунты без верификации имеют ограниченный функционал.',
          ]),
          _section('2. Защита персональных данных', [
            'Все персональные данные хранятся на защищённых серверах с шифрованием.',
            'Мы не передаём данные третьим лицам без согласия пользователя.',
            'Пользователь имеет право запросить удаление своих данных.',
            'Документы верификации хранятся в зашифрованном виде и недоступны другим пользователям.',
          ]),
          _section('3. Безопасность коммуникации', [
            'Вся переписка ведётся только через внутренний чат платформы.',
            'Система автоматически блокирует сообщения, содержащие номера телефонов, адреса и другие личные данные.',
            'Подозрительные сообщения проверяются модератором.',
            'История чатов хранится для возможного рассмотрения жалоб.',
          ]),
          _section('4. Финансовая безопасность', [
            'Все платежи защищены эскроу-системой.',
            'Деньги переводятся исполнителю только после подтверждения выполнения работы заказчиком.',
            'При спорных ситуациях модератор принимает решение на основании доказательств.',
            'Комиссия платформы составляет 7% от суммы успешной сделки.',
          ]),
          _section('5. Система жалоб', [
            'Любой пользователь может подать жалобу в один клик.',
            'Жалобы рассматриваются модератором в течение 2 часов в рабочее время.',
            'При подтверждении нарушения аккаунт блокируется немедленно.',
            'Повторные нарушения влекут перманентный бан.',
          ]),
          _section('6. Ответственность родителей', [
            'Родители, давшие согласие на регистрацию, несут ответственность за действия ребёнка на платформе.',
            'Родители могут в любой момент запросить деактивацию аккаунта ребёнка.',
            'О крупных транзакциях (от 5000 ₸) родители получают уведомление.',
          ]),
        ],
      ),
    );
  }

  Widget _buildTerms() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _docHeader(
            'Правила пользования',
            'Последнее обновление: 1 января 2025',
            Icons.gavel,
            AppTheme.primary,
          ),
          _section('1. Регистрация и аккаунт', [
            'Для регистрации необходимо быть не моложе 13 лет.',
            'Один человек может иметь только один аккаунт.',
            'Вся предоставленная информация должна быть достоверной.',
            'Передача аккаунта третьим лицам запрещена.',
          ]),
          _section('2. Правила поведения', [
            'Запрещается оскорблять, угрожать и преследовать других пользователей.',
            'Запрещается публиковать контент сексуального или насильственного характера.',
            'Запрещается спам и навязчивая реклама.',
            'Запрещается обход системы безопасности и попытки раскрыть личные данные.',
          ]),
          _section('3. Выполнение заказов', [
            'Исполнитель обязан выполнять работу в согласованные сроки.',
            'Качество работы должно соответствовать описанию услуги.',
            'Исполнитель обязан уведомить о задержках заблаговременно.',
            'Запрещается брать оплату за пределами платформы.',
          ]),
          _section('4. Оплата и финансы', [
            'Все платежи осуществляются только через платформу.',
            'Минимальная сумма заказа — 500 ₸.',
            'Для несовершеннолетних максимальная сумма одного заказа — 50 000 ₸.',
            'Вывод средств доступен пользователям, прошедшим верификацию.',
          ]),
          _section('5. Ответственность', [
            'Платформа не несёт ответственности за качество выполненных работ вне эскроу-системы.',
            'Платформа не несёт ответственности за встречи пользователей вне платформы.',
            'Пользователи несут ответственность за достоверность информации в профиле.',
          ]),
          _section('6. Нарушения и санкции', [
            'Нарушение правил влечёт временную блокировку или перманентный бан.',
            'Серьёзные нарушения могут быть переданы в правоохранительные органы.',
            'Апелляция против блокировки рассматривается в течение 48 часов.',
          ]),
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: AppTheme.accent, size: 16),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Продолжая использовать платформу, вы соглашаетесь с данными правилами.',
                    style: TextStyle(
                      color: AppTheme.accent,
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _docHeader(String title, String date, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 10),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppTheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
