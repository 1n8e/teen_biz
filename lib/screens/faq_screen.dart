import 'package:flutter/material.dart';
import '../theme.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final List<Map<String, String>> _faqs = [
    {
      'q': 'С какого возраста можно регистрироваться?',
      'a':
          'Платформа доступна с 13 лет. Пользователям до 18 лет необходимо согласие родителей.',
    },
    {
      'q': 'Как убедиться, что это безопасно?',
      'a':
          'Все пользователи проходят верификацию документами. Чат ведётся только внутри платформы. Деньги защищены эскроу-системой. При любом нарушении работает система жалоб.',
    },
    {
      'q': 'Как работает эскроу?',
      'a':
          'Заказчик вносит оплату, которая замораживается на платформе. После выполнения работы и подтверждения заказчика деньги переводятся исполнителю. Если работа не устраивает — открывается спор с участием модератора.',
    },
    {
      'q': 'Сколько берёт платформа?',
      'a':
          'Комиссия составляет 7% от суммы заказа. Комиссия снимается только с успешно выполненных заказов.',
    },
    {
      'q': 'Можно ли работать без согласия родителей?',
      'a':
          'Нет. Для пользователей до 18 лет обязательно письменное согласие родителей или законного опекуна. Это требование закона и наша политика безопасности.',
    },
    {
      'q': 'Как пожаловаться на пользователя?',
      'a':
          'В профиле пользователя, в чате и в карточке заказа есть кнопка "Пожаловаться". После подачи жалобы модератор рассмотрит её в течение 2 часов.',
    },
    {
      'q': 'Что делать, если заказчик не платит?',
      'a':
          'Деньги замораживаются в эскроу до начала работы. Если заказчик отказывается подтверждать готовую работу, обратитесь в поддержку — модератор рассмотрит ситуацию.',
    },
    {
      'q': 'Как повысить рейтинг?',
      'a':
          'Выполняйте заказы качественно и в срок. Просите довольных клиентов оставлять отзывы. Поддерживайте активность на платформе. Пройдите верификацию для значка доверия.',
    },
    {
      'q': 'Как получить деньги на карту?',
      'a':
          'В личном кабинете перейдите в раздел "Баланс" и нажмите "Вывести". Минимальная сумма вывода — 500 ₸. Деньги поступают на карту в течение 1-3 рабочих дней.',
    },
    {
      'q': 'Как связаться с поддержкой?',
      'a':
          'Напишите нам на support@teenbiz.kz или воспользуйтесь чатом поддержки в приложении. Мы отвечаем в рабочее время с 9:00 до 21:00.',
    },
  ];

  final Set<int> _expanded = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Часто задаваемые вопросы')),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _faqs.length,
              itemBuilder: (context, i) => _faqItem(i),
            ),
          ),
          _buildSupport(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'FAQ — Вопросы и ответы',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Здесь собраны ответы на самые частые вопросы',
            style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _faqItem(int i) {
    final isOpen = _expanded.contains(i);
    return GestureDetector(
      onTap: () => setState(() {
        if (isOpen) {
          _expanded.remove(i);
        } else {
          _expanded.add(i);
        }
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: isOpen ? const Color(0xFFEDE9FE) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isOpen ? AppTheme.primary : const Color(0xFFE5E7EB),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _faqs[i]['q']!,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: isOpen ? AppTheme.primary : null,
                      ),
                    ),
                  ),
                  Icon(
                    isOpen
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: isOpen ? AppTheme.primary : AppTheme.textSecondary,
                  ),
                ],
              ),
              if (isOpen) ...[
                const SizedBox(height: 12),
                Text(
                  _faqs[i]['a']!,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSupport(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE9FE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.support_agent, color: AppTheme.primary, size: 28),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Не нашёл ответ?',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primary,
                  ),
                ),
                Text(
                  'Напиши нам: support@teenbiz.kz',
                  style: TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            ),
            child: const Text('Чат'),
          ),
        ],
      ),
    );
  }
}
