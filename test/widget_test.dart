import 'package:flutter_test/flutter_test.dart';
import 'package:nukaiah_portfolio/data/portfolio_data.dart';

void main() {
  test('Portfolio data verification test', () {
    expect(PortfolioData.name, isNotEmpty);
    expect(PortfolioData.skills, isNotEmpty);
    expect(PortfolioData.experience, isNotEmpty);
    expect(PortfolioData.projects, isNotEmpty);
  });
}
