// TODO: In MaterialApp: ThemeData(useMaterial3: true)
// TODO: Configure dark theme colorScheme for dark mode support
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'; // for future FCM integration

// TODO: Move all static strings to ARB files for internationalization

// Reusable date formatter
final _dateFormatter = DateFormat('dd/MM/yyyy');

class Evento {
  final String titulo;
  final List<String> descricao;
  final DateTime dataInicio;
  final DateTime dataFim;

  Evento({
    required this.titulo,
    required this.descricao,
    required this.dataInicio,
    required this.dataFim,
  });

  factory Evento.fromSnapshot(DataSnapshot snapshot) {
    final titulo = snapshot.child('titulo').value as String? ?? '';
    final descricaoStr = snapshot.child('descricao').value as String? ?? '';
    final descricao = descricaoStr.split('\n');
    final dataInicioStr = snapshot.child('data_inicio').value as String? ?? '';
    final dataFimStr = snapshot.child('data_fim').value as String? ?? '';

    return Evento(
      titulo: titulo,
      descricao: descricao,
      dataInicio: DateTime.tryParse(dataInicioStr) ?? DateTime.now(),
      dataFim: DateTime.tryParse(dataFimStr) ?? DateTime.now(),
    );
  }

  String get formattedDataInicio => _dateFormatter.format(dataInicio);
  String get formattedDataFim => _dateFormatter.format(dataFim);

  bool get isAtivo {
    final agora = DateTime.now();
    return agora.isAfter(dataInicio) && agora.isBefore(dataFim);
  }
}

class NoticiasPage extends StatefulWidget {
  const NoticiasPage({Key? key}) : super(key: key);

  @override
  _NoticiasPageState createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  late final Query _eventosQuery;
  late final DateTime _hoje;
  final ValueNotifier<double> _fontSizeNotifier = ValueNotifier(18.0);

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  Future<void> _loadFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    _fontSizeNotifier.value = prefs.getDouble('fontSize') ?? 18.0;
  }

  @override
  void initState() {
    super.initState();
    _hoje = DateTime.now();
    _loadFontSize();
    _eventosQuery = FirebaseDatabase.instance
        .ref()
        .orderByChild('data_fim')
        .startAt(_hoje.toIso8601String());
    _eventosQuery.keepSynced(true);
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _eventosQuery.keepSynced(false);
    _searchController.dispose();
    super.dispose();
  }

  void _alterarFonte(double delta) {
    _fontSizeNotifier.value =
        (_fontSizeNotifier.value + delta).clamp(12.0, 30.0);
    SharedPreferences.getInstance()
        .then((prefs) => prefs.setDouble('fontSize', _fontSizeNotifier.value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avisos Paroquiais'),
        actions: [
          IconButton(
            onPressed: () => _alterarFonte(2.0),
            icon: const Icon(Icons.zoom_in),
          ),
          IconButton(
            onPressed: () => _alterarFonte(-2.0),
            icon: const Icon(Icons.zoom_out),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  labelText: 'Buscar avisos',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<DatabaseEvent>(
                stream: _eventosQuery.onValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                        child: Text(Intl.message('Erro ao carregar os eventos.',
                            name: 'errorLoadingEvents')));
                  }

                  final data = snapshot.data!.snapshot.value;
                  if (data == null || data is! Map<dynamic, dynamic>) {
                    return Center(
                        child: Text(Intl.message('Nenhum evento encontrado.',
                            name: 'noEventsFound')));
                  }
                  final eventosMap = Map<String, dynamic>.from(data);

                  final eventos = eventosMap.entries
                      .map((entry) {
                        final eventSnapshot =
                            snapshot.data!.snapshot.child(entry.key);
                        return Evento.fromSnapshot(eventSnapshot);
                      })
                      .where((e) => e.dataFim.isAfter(_hoje))
                      .toList();

                  eventos.sort((a, b) => a.dataFim.compareTo(b.dataFim));

                  final filtered = eventos
                      .where((e) =>
                          e.titulo.toLowerCase().contains(_searchQuery) ||
                          e.formattedDataInicio.contains(_searchQuery) ||
                          e.formattedDataFim.contains(_searchQuery))
                      .toList();

                  if (filtered.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.event_busy, size: 64),
                          const SizedBox(height: 16),
                          Text(
                            Intl.message('Nenhum aviso disponível',
                                name: 'noAvailableNotice'),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    key: const PageStorageKey('avisosList'),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final evento = filtered[index];
                      return EventoTile(
                        key: ValueKey(evento.titulo),
                        evento: evento,
                        fontSizeNotifier: _fontSizeNotifier,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventoTile extends StatefulWidget {
  final Evento evento;
  final ValueNotifier<double> fontSizeNotifier;

  const EventoTile({
    Key? key,
    required this.evento,
    required this.fontSizeNotifier,
  }) : super(key: key);

  @override
  _EventoTileState createState() => _EventoTileState();
}

class _EventoTileState extends State<EventoTile>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool _expanded = false;
  late AnimationController _controller;
  late Animation<double> _arrowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _arrowAnimation = Tween<double>(begin: 0, end: 0.5).animate(_controller);
  }

  void _toggleExpanded() {
    setState(() {
      _expanded = !_expanded;
      _expanded ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final diasRestantes =
        widget.evento.dataFim.difference(DateTime.now()).inDays;
    final mostrarUltimosDias = diasRestantes <= 2;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: GestureDetector(
          onTap: _toggleExpanded,
          onLongPress: () {
            showModalBottomSheet(
              context: context,
              builder: (_) => Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.evento.titulo,
                        style: Theme.of(context).textTheme.titleLarge),
                    Text('Início: ${widget.evento.formattedDataInicio}'),
                    Text('Fim: ${widget.evento.formattedDataFim}'),
                    ...widget.evento.descricao.map((d) => Text(d)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () {
                            Add2Calendar.addEvent2Cal(Event(
                              title: widget.evento.titulo,
                              startDate: widget.evento.dataInicio,
                              endDate: widget.evento.dataFim,
                            ));
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    if (mostrarUltimosDias)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Chip(
                            label: const Text(
                              'Últimos dias!',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 220, 99, 33),
                          ),
                        ),
                      ),
                    if (widget.evento.isAtivo)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Chip(
                            label: const Text('Em andamento',
                                style: TextStyle(color: Colors.white)),
                            backgroundColor: Colors.green,
                          ),
                        ),
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.evento.titulo,
                            style: GoogleFonts.nunito(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        RotationTransition(
                          turns: _arrowAnimation,
                          child: const Icon(Icons.expand_more,
                              size: 26, semanticLabel: 'Expandir evento'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Início: ${widget.evento.formattedDataInicio}',
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Fim: ${widget.evento.formattedDataFim}',
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: _expanded ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: _expanded
                          ? Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    widget.evento.descricao.map((descricao) {
                                  return ValueListenableBuilder<double>(
                                    valueListenable: widget.fontSizeNotifier,
                                    builder: (context, fs, _) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                          descricao,
                                          style: TextStyle(fontSize: fs),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                    if (_expanded)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: () {
                              final details =
                                  'Evento: ${widget.evento.titulo}\n'
                                  'Início: ${widget.evento.formattedDataInicio}\n'
                                  'Fim: ${widget.evento.formattedDataFim}';
                              Clipboard.setData(ClipboardData(text: details));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Detalhes copiados!')),
                              );
                            },
                            tooltip: 'Compartilhar evento',
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
