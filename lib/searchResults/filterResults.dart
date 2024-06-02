import 'FilterSortWidget.dart';
import 'package:flutter/material.dart';


class FilterResults extends StatefulWidget {
  const FilterResults({super.key});

  @override
  _FilterResultsState createState() => _FilterResultsState();
}

class _FilterResultsState extends State<FilterResults> {
  final String _selectedOption = 'Sort by'; // Default selected option

  OverlayEntry? _overlayEntry;

  void _showFilterSortWidget() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 30, // 30 pixels below the current widget
        width: size.width,
        child: const Material(
          elevation: 4.0,
          child: FilterSortWidget(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 5),
        IconButton(
          icon: const Icon(Icons.tune_rounded),
          onPressed: _showFilterSortWidget,
        ),
        const SizedBox(width: 10), // Adjust the width as needed
      ],
    );
  }
}
