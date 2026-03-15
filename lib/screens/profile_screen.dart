import 'package:flutter/material.dart';
import '../theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 3, vsync: this);
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
        title: const Text('Мой профиль'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
          IconButton(icon: const Icon(Icons.share_outlined), onPressed: () {}),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverToBoxAdapter(child: _buildProfile()),
          SliverToBoxAdapter(child: _buildStats()),
          SliverPersistentHeader(
            pinned: true,
            delegate: _TabBarDelegate(
              TabBar(
                controller: _tabs,
                tabs: const [
                  Tab(text: 'Услуги'),
                  Tab(text: 'Портфолио'),
                  Tab(text: 'Отзывы'),
                ],
                labelColor: AppTheme.primary,
                unselectedLabelColor: AppTheme.textSecondary,
                indicatorColor: AppTheme.primary,
              ),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabs,
          children: [
            _buildServicesTab(),
            _buildPortfolioTab(),
            _buildReviewsTab(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppTheme.primary,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Добавить услугу',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildProfile() {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 44,
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    child: const Text(
                      'АО',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.primary,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: AppTheme.accent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Амалия Огай',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                                ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            '16 лет',
                            style: TextStyle(
                              color: AppTheme.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.verified,
                                color: AppTheme.accent,
                                size: 12,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Проверен',
                                style: TextStyle(
                                  color: AppTheme.accent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Алматы, Казахстан',
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        ...List.generate(
                          5,
                          (i) => Icon(
                            i < 4 ? Icons.star : Icons.star_half,
                            color: const Color(0xFFF59E0B),
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          '4.9 (47 отзывов)',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Увлекаюсь дизайном и репетиторством. Помогаю с уроками математики и создаю крутые логотипы. Работаю быстро и качественно!',
            style: TextStyle(
              fontSize: 13,
              color: AppTheme.textSecondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              'Дизайн',
              'Репетитор',
              'Математика',
              'Логотипы',
              'Figma',
            ].map((s) => Chip(label: Text(s))).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          _statBox('86', 'Заказов'),
          _statDivider(),
          _statBox('4.9', 'Рейтинг'),
          _statDivider(),
          _statBox('47', 'Отзывов'),
          _statDivider(),
          _statBox('₸ 342 000', 'Заработано'),
        ],
      ),
    );
  }

  Widget _statBox(String val, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(
            val,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            label,
            style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _statDivider() =>
      Container(width: 1, height: 32, color: Theme.of(context).colorScheme.outlineVariant);

  Widget _buildServicesTab() {
    final services = [
      {
        'title': 'Репетитор по математике',
        'price': '2 000 ₸/час',
        'orders': 28,
      },
      {'title': 'Создание логотипа', 'price': '5 000 ₸', 'orders': 19},
      {'title': 'Дизайн баннеров и постов', 'price': '3 000 ₸', 'orders': 14},
      {'title': 'Монтаж видео для Reels/TikTok', 'price': '4 500 ₸', 'orders': 11},
      {'title': 'Оформление презентаций', 'price': '2 500 ₸', 'orders': 8},
      {'title': 'Репетитор по физике', 'price': '2 500 ₸/час', 'orders': 6},
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: services.map((s) => _serviceCard(s)).toList(),
    );
  }

  Widget _serviceCard(Map<String, dynamic> s) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.work_outline, color: AppTheme.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s['title'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${s['orders']} заказов',
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                s['price'] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primary,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: AppTheme.textSecondary,
                      size: 18,
                    ),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(
                      Icons.delete_outlined,
                      color: AppTheme.danger,
                      size: 18,
                    ),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioTab() {
    const portfolioItems = [
      (
        title: 'Логотип для кофейни «Бодрость»',
        category: 'Дизайн',
        desc: 'Фирменный стиль: логотип, цвета, шрифты. Заказчик остался очень доволен.',
        icon: Icons.design_services,
        color: Color(0xFFEDE9FE),
        iconColor: AppTheme.primary,
        tag: 'Figma',
      ),
      (
        title: 'Урок алгебры — разбор ЕНТ',
        category: 'Репетиторство',
        desc: 'Подготовила ученицу к ЕНТ. Она сдала математику на 18/20 баллов.',
        icon: Icons.calculate,
        color: Color(0xFFD1FAE5),
        iconColor: AppTheme.accent,
        tag: 'Математика',
      ),
      (
        title: 'Брендинг для школьного клуба',
        category: 'Дизайн',
        desc: 'Создала логотип, баннер и шаблоны постов для Instagram-аккаунта клуба.',
        icon: Icons.palette,
        color: Color(0xFFFEF3C7),
        iconColor: Color(0xFFF59E0B),
        tag: 'Брендинг',
      ),
      (
        title: 'Иконки для мобильного приложения',
        category: 'UI-дизайн',
        desc: '12 иконок в едином стиле для детского образовательного приложения.',
        icon: Icons.grid_view,
        color: Color(0xFFEFF6FF),
        iconColor: Color(0xFF3B82F6),
        tag: 'UI',
      ),
      (
        title: 'Инфографика для урока биологии',
        category: 'Иллюстрация',
        desc: 'Наглядная схема строения клетки — учитель использует её до сих пор.',
        icon: Icons.biotech,
        color: Color(0xFFFCE7F3),
        iconColor: Color(0xFFEC4899),
        tag: 'Иллюстрация',
      ),
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Row(
            children: [
              Icon(Icons.info_outline, color: AppTheme.primary, size: 16),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Портфолио показывает твои реальные работы. Заказчики смотрят его перед тем, как написать тебе.',
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
        ...portfolioItems.map((item) => _portfolioCard(item)),
      ],
    );
  }

  Widget _portfolioCard(
      ({
        String title,
        String category,
        String desc,
        IconData icon,
        Color color,
        Color iconColor,
        String tag,
      }) item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: item.color,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Center(
              child: Icon(item.icon, size: 40, color: item.iconColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: item.color,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        item.tag,
                        style: TextStyle(
                          color: item.iconColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      item.category,
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  item.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                        ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.desc,
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

  Widget _buildReviewsTab() {
    final reviews = [
      {
        'name': 'Данияр М.',
        'stars': 5,
        'text':
            'Амалия помогла моему сыну с математикой. Объясняет очень понятно!',
        'date': '15 янв 2025',
      },
      {
        'name': 'Айгерим К.',
        'stars': 5,
        'text': 'Отличный логотип! Сделала быстро и красиво. Рекомендую!',
        'date': '3 дек 2024',
      },
      {
        'name': 'Болат Н.',
        'stars': 4,
        'text': 'Хорошая работа, небольшие правки пришлось внести.',
        'date': '20 ноя 2024',
      },
      {
        'name': 'Марина С.',
        'stars': 5,
        'text': 'Заказала оформление презентации для конференции. Сделала за день, всё идеально!',
        'date': '10 фев 2025',
      },
      {
        'name': 'Руслан Т.',
        'stars': 5,
        'text': 'Монтаж видео для моего канала — качественно и в срок. Уже третий раз заказываю.',
        'date': '28 янв 2025',
      },
      {
        'name': 'Алия Ж.',
        'stars': 5,
        'text': 'Дочь подтянула алгебру с 3 до 5 за два месяца занятий. Спасибо Амалии!',
        'date': '5 янв 2025',
      },
      {
        'name': 'Серик О.',
        'stars': 4,
        'text': 'Хороший баннер для нашего мероприятия. Быстро реагирует на правки.',
        'date': '22 дек 2024',
      },
      {
        'name': 'Камила Р.',
        'stars': 5,
        'text': 'Лучший репетитор! Объясняет сложные темы простым языком. Рекомендую всем!',
        'date': '15 дек 2024',
      },
      {
        'name': 'Аскар В.',
        'stars': 5,
        'text': 'Сделала 5 логотипов на выбор. Креативный подход, профессионально.',
        'date': '1 дек 2024',
      },
      {
        'name': 'Динара Е.',
        'stars': 4,
        'text': 'Помогла оформить Instagram для моего магазина. Стало намного красивее!',
        'date': '18 ноя 2024',
      },
      {
        'name': 'Нурлан К.',
        'stars': 5,
        'text': 'Видеомонтаж для свадьбы — гости были в восторге. Очень талантливая!',
        'date': '5 ноя 2024',
      },
      {
        'name': 'Жанна П.',
        'stars': 5,
        'text': 'Заказываю регулярно посты для соцсетей. Всегда вовремя и качественно.',
        'date': '20 окт 2024',
      },
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: reviews.map((r) => _reviewCard(r)).toList(),
    );
  }

  Widget _reviewCard(Map<String, dynamic> r) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Text(
                  (r['name'] as String)[0],
                  style: const TextStyle(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      r['name'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      r['date'] as String,
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: List.generate(
                  r['stars'] as int,
                  (_) => const Icon(
                    Icons.star,
                    color: Color(0xFFF59E0B),
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            r['text'] as String,
            style: const TextStyle(
              fontSize: 13,
              color: AppTheme.textSecondary,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => Container(color: Theme.of(context).colorScheme.surface, child: tabBar);

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) => false;
}
