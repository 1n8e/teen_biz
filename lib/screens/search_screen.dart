import 'package:flutter/material.dart';
import '../theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _selectedCity = 'Все города';

  // _priceRange reserved for future price filter
  String _format = 'Все';
  double _minRating = 0;
  final _searchCtrl = TextEditingController();

  final _cities = ['Все города', 'Алматы', 'Астана', 'Шымкент', 'Актобе'];
  final _formats = ['Все', 'Онлайн', 'Офлайн'];

  final _services = [
    // Обучение
    {
      'name': 'Амалия О.',
      'age': 16,
      'title': 'Репетитор по математике',
      'price': '2 000 ₸/час',
      'rating': 4.8,
      'reviews': 12,
      'city': 'Алматы',
      'online': true,
      'tags': ['Математика', 'ЕНТ', 'Алгебра'],
    },
    {
      'name': 'Нурай А.',
      'age': 17,
      'title': 'Репетитор по английскому',
      'price': '2 500 ₸/час',
      'rating': 4.9,
      'reviews': 18,
      'city': 'Астана',
      'online': true,
      'tags': ['Английский', 'IELTS', 'Разговорный'],
    },
    {
      'name': 'Тимур С.',
      'age': 18,
      'title': 'Уроки программирования',
      'price': '3 000 ₸/час',
      'rating': 5.0,
      'reviews': 7,
      'city': 'Алматы',
      'online': true,
      'tags': ['Python', 'Scratch', 'Начинающим'],
    },
    {
      'name': 'Камила Р.',
      'age': 16,
      'title': 'Репетитор по казахскому языку',
      'price': '1 800 ₸/час',
      'rating': 4.9,
      'reviews': 22,
      'city': 'Астана',
      'online': true,
      'tags': ['Казахский', 'Грамматика', 'Сочинение'],
    },
    {
      'name': 'Ерасыл М.',
      'age': 17,
      'title': 'Репетитор по физике',
      'price': '2 200 ₸/час',
      'rating': 4.7,
      'reviews': 9,
      'city': 'Алматы',
      'online': true,
      'tags': ['Физика', 'ЕНТ', 'Механика'],
    },
    {
      'name': 'Аяулым К.',
      'age': 16,
      'title': 'Подготовка к ЕНТ по химии',
      'price': '2 000 ₸/час',
      'rating': 4.8,
      'reviews': 15,
      'city': 'Шымкент',
      'online': true,
      'tags': ['Химия', 'ЕНТ', 'Органика'],
    },
    {
      'name': 'Даниял Х.',
      'age': 18,
      'title': 'Уроки робототехники',
      'price': '3 500 ₸/час',
      'rating': 5.0,
      'reviews': 6,
      'city': 'Астана',
      'online': false,
      'tags': ['Arduino', 'Робототехника', 'STEM'],
    },
    // Цифровые навыки
    {
      'name': 'Максим Д.',
      'age': 17,
      'title': 'Создание сайтов',
      'price': '15 000 ₸',
      'rating': 5.0,
      'reviews': 8,
      'city': 'Астана',
      'online': true,
      'tags': ['Web', 'HTML', 'CSS'],
    },
    {
      'name': 'Арман Б.',
      'age': 17,
      'title': 'Дизайн логотипов',
      'price': '5 000 ₸',
      'rating': 4.9,
      'reviews': 20,
      'city': 'Шымкент',
      'online': true,
      'tags': ['Figma', 'Логотип', 'Брендинг'],
    },
    {
      'name': 'Карина Л.',
      'age': 17,
      'title': 'Монтаж видео',
      'price': '4 000 ₸',
      'rating': 4.8,
      'reviews': 14,
      'city': 'Алматы',
      'online': true,
      'tags': ['CapCut', 'Reels', 'YouTube'],
    },
    {
      'name': 'Дамир К.',
      'age': 18,
      'title': 'Ведение SMM / Instagram',
      'price': '8 000 ₸/мес',
      'rating': 4.7,
      'reviews': 11,
      'city': 'Астана',
      'online': true,
      'tags': ['SMM', 'Instagram', 'Контент'],
    },
    {
      'name': 'Айдана М.',
      'age': 16,
      'title': 'Иллюстрации и арт',
      'price': '3 500 ₸',
      'rating': 4.9,
      'reviews': 16,
      'city': 'Алматы',
      'online': true,
      'tags': ['Арт', 'Иллюстрация', 'Procreate'],
    },
    {
      'name': 'Руслан Г.',
      'age': 18,
      'title': 'Настройка рекламы в Google/Meta',
      'price': '10 000 ₸',
      'rating': 4.6,
      'reviews': 8,
      'city': 'Алматы',
      'online': true,
      'tags': ['Таргет', 'Google Ads', 'Meta'],
    },
    {
      'name': 'Инжу С.',
      'age': 17,
      'title': 'Оформление презентаций',
      'price': '2 500 ₸',
      'rating': 4.8,
      'reviews': 19,
      'city': 'Астана',
      'online': true,
      'tags': ['PowerPoint', 'Canva', 'Презентация'],
    },
    {
      'name': 'Артём В.',
      'age': 18,
      'title': 'Разработка Telegram-ботов',
      'price': '12 000 ₸',
      'rating': 4.9,
      'reviews': 5,
      'city': 'Алматы',
      'online': true,
      'tags': ['Telegram', 'Бот', 'Python'],
    },
    {
      'name': 'Диана Ф.',
      'age': 16,
      'title': 'Дизайн баннеров и постов',
      'price': '2 000 ₸',
      'rating': 4.7,
      'reviews': 24,
      'city': 'Шымкент',
      'online': true,
      'tags': ['Canva', 'Баннеры', 'Соцсети'],
    },
    {
      'name': 'Бекзат Т.',
      'age': 17,
      'title': '3D-моделирование',
      'price': '6 000 ₸',
      'rating': 4.8,
      'reviews': 7,
      'city': 'Астана',
      'online': true,
      'tags': ['Blender', '3D', 'Визуализация'],
    },
    // Творчество
    {
      'name': 'Динара О.',
      'age': 16,
      'title': 'Фото и обработка',
      'price': '3 000 ₸',
      'rating': 4.7,
      'reviews': 9,
      'city': 'Алматы',
      'online': false,
      'tags': ['Фото', 'Lightroom'],
    },
    {
      'name': 'Зарина Н.',
      'age': 17,
      'title': 'Handmade открытки и декор',
      'price': '1 200 ₸',
      'rating': 4.6,
      'reviews': 23,
      'city': 'Шымкент',
      'online': false,
      'tags': ['Handmade', 'Открытки', 'Подарки'],
    },
    {
      'name': 'Алишер Р.',
      'age': 18,
      'title': 'Написание текстов и эссе',
      'price': '1 500 ₸',
      'rating': 4.8,
      'reviews': 6,
      'city': 'Астана',
      'online': true,
      'tags': ['Копирайтинг', 'Эссе', 'Тексты'],
    },
    {
      'name': 'Жансая Б.',
      'age': 16,
      'title': 'Каллиграфия и леттеринг',
      'price': '2 000 ₸',
      'rating': 4.9,
      'reviews': 13,
      'city': 'Алматы',
      'online': false,
      'tags': ['Каллиграфия', 'Леттеринг', 'Открытки'],
    },
    {
      'name': 'Нуртас Е.',
      'age': 17,
      'title': 'Озвучка и запись подкастов',
      'price': '3 000 ₸',
      'rating': 4.5,
      'reviews': 8,
      'city': 'Астана',
      'online': true,
      'tags': ['Озвучка', 'Подкаст', 'Аудио'],
    },
    {
      'name': 'Аружан Л.',
      'age': 16,
      'title': 'Рисование портретов на заказ',
      'price': '4 000 ₸',
      'rating': 4.8,
      'reviews': 11,
      'city': 'Шымкент',
      'online': false,
      'tags': ['Портрет', 'Рисование', 'Арт'],
    },
    {
      'name': 'Елена К.',
      'age': 18,
      'title': 'Вязание и макраме на заказ',
      'price': '3 500 ₸',
      'rating': 4.7,
      'reviews': 17,
      'city': 'Актобе',
      'online': false,
      'tags': ['Вязание', 'Макраме', 'Handmade'],
    },
    // Офлайн-услуги
    {
      'name': 'Сауле Т.',
      'age': 16,
      'title': 'Выгул собак',
      'price': '1 500 ₸',
      'rating': 4.6,
      'reviews': 5,
      'city': 'Алматы',
      'online': false,
      'tags': ['Животные', 'Прогулки'],
    },
    {
      'name': 'Богдан П.',
      'age': 17,
      'title': 'Помощь с переездом / переноска',
      'price': '2 000 ₸',
      'rating': 4.5,
      'reviews': 4,
      'city': 'Актобе',
      'online': false,
      'tags': ['Переезд', 'Грузчик', 'Физический труд'],
    },
    {
      'name': 'Мадина Ж.',
      'age': 16,
      'title': 'Няня / уход за детьми',
      'price': '1 800 ₸/час',
      'rating': 4.9,
      'reviews': 10,
      'city': 'Алматы',
      'online': false,
      'tags': ['Няня', 'Дети', 'Уход'],
    },
    {
      'name': 'Данияр Ш.',
      'age': 17,
      'title': 'Мелкий ремонт и сборка мебели',
      'price': '2 500 ₸',
      'rating': 4.6,
      'reviews': 12,
      'city': 'Алматы',
      'online': false,
      'tags': ['Ремонт', 'Мебель', 'Сборка'],
    },
    {
      'name': 'Асель М.',
      'age': 16,
      'title': 'Помощь с уборкой и организацией',
      'price': '2 000 ₸/час',
      'rating': 4.7,
      'reviews': 14,
      'city': 'Астана',
      'online': false,
      'tags': ['Уборка', 'Организация', 'Порядок'],
    },
    {
      'name': 'Алихан Р.',
      'age': 18,
      'title': 'Доставка на самокате / велосипеде',
      'price': '800 ₸',
      'rating': 4.5,
      'reviews': 21,
      'city': 'Алматы',
      'online': false,
      'tags': ['Доставка', 'Курьер', 'Быстро'],
    },
    {
      'name': 'Томирис А.',
      'age': 17,
      'title': 'Помощь в саду и огороде',
      'price': '1 500 ₸/час',
      'rating': 4.8,
      'reviews': 6,
      'city': 'Шымкент',
      'online': false,
      'tags': ['Сад', 'Огород', 'Растения'],
    },
    {
      'name': 'Ернар Д.',
      'age': 18,
      'title': 'Ведущий праздников и мероприятий',
      'price': '10 000 ₸',
      'rating': 4.9,
      'reviews': 9,
      'city': 'Алматы',
      'online': false,
      'tags': ['Ведущий', 'Праздник', 'Мероприятие'],
    },
    {
      'name': 'Лаура Н.',
      'age': 16,
      'title': 'Обучение пожилых людей смартфону',
      'price': '1 500 ₸/час',
      'rating': 5.0,
      'reviews': 10,
      'city': 'Актобе',
      'online': false,
      'tags': ['Смартфон', 'Обучение', 'Пожилые'],
    },
  ];

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Найти исполнителя'),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () => _showFilters(context),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearch(),
          _buildFilterChips(),
          Expanded(child: _buildResults()),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: TextField(
        controller: _searchCtrl,
        decoration: InputDecoration(
          hintText: 'Поиск услуг...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _searchCtrl.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchCtrl.clear();
                    setState(() {});
                  },
                )
              : null,
        ),
        onChanged: (_) => setState(() {}),
      ),
    );
  }

  Widget _buildFilterChips() {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _filterChip(_selectedCity, Icons.location_on_outlined),
            const SizedBox(width: 8),
            _filterChip(_format, Icons.devices),
            const SizedBox(width: 8),
            if (_minRating > 0)
              _filterChip('${_minRating.toStringAsFixed(0)}+ ★', Icons.star),
          ],
        ),
      ),
    );
  }

  Widget _filterChip(String label, IconData icon) {
    return GestureDetector(
      onTap: () => _showFilters(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: AppTheme.primary),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: AppTheme.primary,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResults() {
    final query = _searchCtrl.text.toLowerCase();
    final filtered = _services.where((s) {
      if (query.isNotEmpty) {
        final title = (s['title'] as String).toLowerCase();
        if (!title.contains(query)) return false;
      }
      if (_selectedCity != 'Все города' && s['city'] != _selectedCity) {
        return false;
      }
      if (_format == 'Онлайн' && !(s['online'] as bool)) return false;
      if (_format == 'Офлайн' && (s['online'] as bool)) return false;
      if ((s['rating'] as double) < _minRating) return false;
      return true;
    }).toList();

    if (filtered.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: AppTheme.textSecondary),
            SizedBox(height: 16),
            Text(
              'Ничего не найдено',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.textSecondary,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Попробуй изменить фильтры',
              style: TextStyle(color: AppTheme.textSecondary),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filtered.length,
      itemBuilder: (context, i) => _serviceCard(filtered[i]),
    );
  }

  Widget _serviceCard(Map<String, dynamic> s) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/order'),
      child: Container(
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
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: Text(
                    (s['name'] as String)[0],
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              s['name'] as String,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '${s['age']} лет',
                              style: const TextStyle(
                                color: AppTheme.primary,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 12,
                            color: AppTheme.textSecondary,
                          ),
                          Text(
                            s['city'] as String,
                            style: const TextStyle(
                              color: AppTheme.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: (s['online'] as bool)
                                  ? AppTheme.accent
                                  : AppTheme.warning,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            (s['online'] as bool) ? 'Онлайн' : 'Офлайн',
                            style: TextStyle(
                              color: (s['online'] as bool)
                                  ? AppTheme.accent
                                  : AppTheme.warning,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xFFF59E0B),
                          size: 14,
                        ),
                        Text(
                          s['rating'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          ' (${s['reviews']})',
                          style: const TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      s['price'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primary,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              s['title'] as String,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              children: (s['tags'] as List<String>)
                  .map(
                    (t) => Chip(
                      label: Text(t, style: const TextStyle(fontSize: 11)),
                      padding: EdgeInsets.zero,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text('Написать'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/order'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text('Заказать'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showFilters(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Фильтры',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 20),
              const Text(
                'Город',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: _cities.map((c) {
                  final selected = c == _selectedCity;
                  return ChoiceChip(
                    label: Text(c),
                    selected: selected,
                    onSelected: (_) {
                      setModalState(() => _selectedCity = c);
                      setState(() => _selectedCity = c);
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              const Text(
                'Формат',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: _formats.map((f) {
                  final selected = f == _format;
                  return ChoiceChip(
                    label: Text(f),
                    selected: selected,
                    onSelected: (_) {
                      setModalState(() => _format = f);
                      setState(() => _format = f);
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Мин. рейтинг',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    _minRating == 0
                        ? 'Любой'
                        : '${_minRating.toStringAsFixed(0)}+',
                    style: const TextStyle(color: AppTheme.primary),
                  ),
                ],
              ),
              Slider(
                value: _minRating,
                min: 0,
                max: 5,
                divisions: 5,
                activeColor: AppTheme.primary,
                onChanged: (v) {
                  setModalState(() => _minRating = v);
                  setState(() => _minRating = v);
                },
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Применить'),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
