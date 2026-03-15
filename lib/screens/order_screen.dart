import 'package:flutter/material.dart';
import '../theme.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabs;
  int _orderStep = 0;

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
        title: const Text('Заказы'),
        bottom: TabBar(
          controller: _tabs,
          tabs: const [
            Tab(text: 'Оформить заказ'),
            Tab(text: 'Мои заказы'),
          ],
          labelColor: AppTheme.primary,
          unselectedLabelColor: AppTheme.textSecondary,
          indicatorColor: AppTheme.primary,
        ),
      ),
      body: TabBarView(
        controller: _tabs,
        children: [_buildOrderForm(), _buildMyOrders()],
      ),
    );
  }

  Widget _buildOrderForm() {
    if (_orderStep == 0) return _buildStep0Form();
    if (_orderStep == 1) return _buildStep1Escrow();
    return _buildStep2Confirm();
  }

  Widget _buildStep0Form() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            children: [
              _serviceInfo(),
              const SizedBox(height: 20),
              _sectionTitle('Описание задания'),
              TextField(
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Опишите что нужно сделать...',
                ),
              ),
              const SizedBox(height: 16),
              _sectionTitle('Срок выполнения'),
              TextField(
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: 'Выберите дату',
                  prefixIcon: Icon(Icons.calendar_today_outlined),
                ),
                onTap: () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime.now().add(const Duration(days: 3)),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 90)),
                  );
                },
              ),
              const SizedBox(height: 16),
              _sectionTitle('Бюджет'),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: '2000',
                  prefixIcon: Icon(Icons.paid_outlined),
                  suffixText: '₸',
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.accent.withValues(alpha: 0.35)),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.lock, color: AppTheme.accent, size: 18),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Оплата через эскроу: деньги заморозятся до выполнения заказа',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.accent,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () => setState(() => _orderStep = 1),
              child: const Text('Перейти к оплате'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStep1Escrow() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            children: [
              _progressRow(['Заказ', 'Оплата', 'Готово'], 1),
              const SizedBox(height: 24),
              const Text(
                'Эскроу-оплата',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              const Text(
                'Деньги будут заморожены на платформе до подтверждения выполнения',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 14),
              ),
              const SizedBox(height: 24),
              _escrowCard(),
              const SizedBox(height: 16),
              _escrowSteps(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => setState(() => _orderStep = 2),
                  child: const Text('Оплатить и создать заказ'),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: OutlinedButton(
                  onPressed: () => setState(() => _orderStep = 0),
                  child: const Text('Назад'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStep2Confirm() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: AppTheme.accent, size: 48),
          ),
          const SizedBox(height: 24),
          const Text(
            'Заказ создан!',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          const Text(
            'Деньги заморожены в эскроу.\nИсполнитель получил уведомление и приступит к работе.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _orderStep = 0;
                  _tabs.animateTo(1);
                });
              },
              icon: const Icon(Icons.assignment),
              label: const Text('Посмотреть заказ'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyOrders() {
    final orders = [
      {
        'title': 'Сайт для кафе',
        'executor': 'Максим Д.',
        'price': '15 000 ₸',
        'status': 'Ожидает',
        'statusColor': AppTheme.primary,
        'date': '22 фев 2025',
      },
      {
        'title': 'Репетитор по математике',
        'executor': 'Амалия О.',
        'price': '2 000 ₸',
        'status': 'В работе',
        'statusColor': AppTheme.warning,
        'date': '20 фев 2025',
      },
      {
        'title': 'Монтаж видео для Reels',
        'executor': 'Карина Л.',
        'price': '4 000 ₸',
        'status': 'В работе',
        'statusColor': AppTheme.warning,
        'date': '18 фев 2025',
      },
      {
        'title': 'Дизайн меню для ресторана',
        'executor': 'Амалия О.',
        'price': '7 000 ₸',
        'status': 'В работе',
        'statusColor': AppTheme.warning,
        'date': '15 фев 2025',
      },
      {
        'title': 'Озвучка для рекламы',
        'executor': 'Тимур Е.',
        'price': '3 000 ₸',
        'status': 'Ожидает',
        'statusColor': AppTheme.primary,
        'date': '14 фев 2025',
      },
      {
        'title': 'Ведение Instagram (март)',
        'executor': 'Дамир К.',
        'price': '8 000 ₸',
        'status': 'Завершён',
        'statusColor': AppTheme.accent,
        'date': '1 фев 2025',
      },
      {
        'title': 'Иллюстрация для обложки',
        'executor': 'Айдана М.',
        'price': '3 500 ₸',
        'status': 'Завершён',
        'statusColor': AppTheme.accent,
        'date': '25 янв 2025',
      },
      {
        'title': 'Оформление презентации (20 слайдов)',
        'executor': 'Амалия О.',
        'price': '4 000 ₸',
        'status': 'Завершён',
        'statusColor': AppTheme.accent,
        'date': '18 янв 2025',
      },
      {
        'title': 'Создание логотипа',
        'executor': 'Арман Б.',
        'price': '5 000 ₸',
        'status': 'Завершён',
        'statusColor': AppTheme.accent,
        'date': '5 янв 2025',
      },
      {
        'title': 'Баннер для YouTube-канала',
        'executor': 'Карина Л.',
        'price': '3 000 ₸',
        'status': 'Завершён',
        'statusColor': AppTheme.accent,
        'date': '28 дек 2024',
      },
      {
        'title': 'Уроки английского (4 занятия)',
        'executor': 'Нурай А.',
        'price': '10 000 ₸',
        'status': 'Завершён',
        'statusColor': AppTheme.accent,
        'date': '20 дек 2024',
      },
      {
        'title': 'SMM-стратегия для стартапа',
        'executor': 'Дамир К.',
        'price': '12 000 ₸',
        'status': 'Завершён',
        'statusColor': AppTheme.accent,
        'date': '15 дек 2024',
      },
      {
        'title': 'Handmade открытки (5 шт.)',
        'executor': 'Зарина Н.',
        'price': '6 000 ₸',
        'status': 'Отменён',
        'statusColor': AppTheme.danger,
        'date': '10 дек 2024',
      },
      {
        'title': 'Фирменный стиль для блогера',
        'executor': 'Амалия О.',
        'price': '9 000 ₸',
        'status': 'Завершён',
        'statusColor': AppTheme.accent,
        'date': '1 дек 2024',
      },
      {
        'title': 'Монтаж свадебного видео',
        'executor': 'Карина Л.',
        'price': '18 000 ₸',
        'status': 'Завершён',
        'statusColor': AppTheme.accent,
        'date': '20 ноя 2024',
      },
      {
        'title': 'Репетитор по физике (8 занятий)',
        'executor': 'Амалия О.',
        'price': '16 000 ₸',
        'status': 'Завершён',
        'statusColor': AppTheme.accent,
        'date': '10 ноя 2024',
      },
      {
        'title': 'Дизайн визиток (100 шт.)',
        'executor': 'Арман Б.',
        'price': '4 000 ₸',
        'status': 'Завершён',
        'statusColor': AppTheme.accent,
        'date': '25 окт 2024',
      },
      {
        'title': 'Выгул собак (абонемент)',
        'executor': 'Сауле Т.',
        'price': '20 000 ₸',
        'status': 'Завершён',
        'statusColor': AppTheme.accent,
        'date': '1 окт 2024',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, i) {
        final o = orders[i];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      o['title'] as String,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: (o['statusColor'] as Color).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      o['status'] as String,
                      style: TextStyle(
                        color: o['statusColor'] as Color,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.person_outline,
                    size: 14,
                    color: AppTheme.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    o['executor'] as String,
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 14,
                    color: AppTheme.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    o['date'] as String,
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    o['price'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: AppTheme.primary,
                    ),
                  ),
                  if (o['status'] == 'В работе')
                    Row(
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                          ),
                          child: const Text(
                            'Чат',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.accent,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                          ),
                          child: const Text(
                            'Подтвердить',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _serviceInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            child: const Text(
              'АО',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppTheme.primary,
              ),
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Репетитор по математике',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                SizedBox(height: 2),
                Text(
                  'Амалия О. • 4.8 ★',
                  style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
                ),
              ],
            ),
          ),
          const Text(
            'от 2 000 ₸',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppTheme.primary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _escrowCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.primaryDark, AppTheme.primary],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Сумма заказа',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              Text(
                '2 000 ₸',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Комиссия (7%)',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              Text(
                '140 ₸',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
          const Divider(color: Colors.white30, height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Итого к оплате',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Text(
                '2 140 ₸',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _escrowSteps() {
    final steps = [
      ('Ты платишь', 'Деньги замораживаются на платформе', Icons.payments),
      ('Амалия работает', 'Исполнитель видит заказ и выполняет его', Icons.work),
      ('Ты проверяешь', 'Оцениваешь результат перед оплатой', Icons.fact_check),
      (
        'Амалия получает',
        'Деньги переводятся после подтверждения',
        Icons.done_all,
      ),
    ];

    return Column(
      children: steps.asMap().entries.map((e) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: AppTheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(e.value.$3, color: Colors.white, size: 16),
                ),
                if (e.key < steps.length - 1)
                  Container(
                    width: 2,
                    height: 30,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
              ],
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.value.$1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      e.value.$2,
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _progressRow(List<String> steps, int current) {
    return Row(
      children: steps.asMap().entries.map((e) {
        final active = e.key <= current;
        return Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 4,
                      decoration: BoxDecoration(
                        color: active
                            ? AppTheme.primary
                            : Theme.of(context).colorScheme.outlineVariant,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      e.value,
                      style: TextStyle(
                        fontSize: 11,
                        color: active
                            ? AppTheme.primary
                            : AppTheme.textSecondary,
                        fontWeight: active
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              if (e.key < steps.length - 1) const SizedBox(width: 4),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
