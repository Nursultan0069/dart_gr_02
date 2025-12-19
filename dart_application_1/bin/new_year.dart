import 'dart:async';
import 'dart:io';
import 'dart:math';

final Random _random = Random();

final List<String> textLines = [
  'С Новым годом!',
  'Пусть будет счастье',
  'Здоровье и успех',
  'И яркий 2025 год 🎄',
];

final List<String> colors = [
  '\x1B[31m', // red
  '\x1B[32m', // green
  '\x1B[33m', // yellow
  '\x1B[34m', // blue
  '\x1B[35m', // magenta
  '\x1B[36m', // cyan
];

const reset = '\x1B[0m';
const int treeHeight = 10;
const int textOffset = 35;

void main() {
  int visibleLines = 0;

  Timer.periodic(const Duration(milliseconds: 500), (_) {
    stdout.write('\x1B[2J\x1B[0;0H'); // очистка экрана

    for (int i = 0; i < treeHeight; i++) {
      // ─── ЁЛКА ───
      stdout.write(' ' * (treeHeight - i));

      for (int j = 0; j <= i * 2; j++) {
        if (_random.nextBool()) {
          stdout.write(
              '${colors[_random.nextInt(colors.length)]}o$reset');
        } else {
          stdout.write('*');
        }
      }

      // ─── ТЕКСТ СПРАВА ───
      int textIndex = i;
      if (textIndex < visibleLines && textIndex < textLines.length) {
        stdout.write(' ' * (textOffset - i * 2));
        stdout.write(textLines[textIndex]);
      }

      stdout.writeln();
    }

    // ─── СТВОЛ ───
    stdout.write(' ' * treeHeight);
    stdout.write('|||');

    if (visibleLines < textLines.length) {
      visibleLines++;
    }
  });
}
