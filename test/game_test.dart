import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_isik_motoru/oyun_isik_motoru.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(isikConfig.title.length, 33);
    expect(isikConfig.tagline.length, 33);
    for (final s in isikConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(isikRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: isikId, optionalMechanics: isikRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(isikRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
