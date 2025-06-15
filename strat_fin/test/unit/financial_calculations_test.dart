import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Financial Calculations Tests', () {
    test('should calculate compound interest correctly', () {
      // Arrange
      double principal = 1000.0;
      double rate = 0.10; // 10% annual rate
      int years = 5;
      
      // Act
      double result = principal * pow(1 + rate, years);
      
      // Assert
      expect(result.toStringAsFixed(2), equals('1610.51'));
    });

    test('should calculate monthly savings goal', () {
      // Arrange
      double targetAmount = 120000.0; // R$ 120,000
      int months = 60; // 5 years
      double monthlyRate = 0.008; // 0.8% monthly
      
      // Act - PMT calculation for annuity
      double monthlyPayment = targetAmount * monthlyRate / 
          (pow(1 + monthlyRate, months) - 1);
      
      // Assert
      expect(monthlyPayment, greaterThan(1000));
      expect(monthlyPayment, lessThan(2500));
    });

    test('should calculate net worth correctly', () {
      // Arrange
      Map<String, double> assets = {
        'cash': 50000.0,
        'investments': 200000.0,
        'real_estate': 500000.0,
      };
      
      Map<String, double> liabilities = {
        'mortgage': 300000.0,
        'credit_card': 15000.0,
      };
      
      // Act
      double totalAssets = assets.values.reduce((a, b) => a + b);
      double totalLiabilities = liabilities.values.reduce((a, b) => a + b);
      double netWorth = totalAssets - totalLiabilities;
      
      // Assert
      expect(totalAssets, equals(750000.0));
      expect(totalLiabilities, equals(315000.0));
      expect(netWorth, equals(435000.0));
    });

    test('should calculate emergency fund recommendation', () {
      // Arrange
      double monthlyExpenses = 8000.0;
      int recommendedMonths = 6;
      
      // Act
      double emergencyFund = monthlyExpenses * recommendedMonths;
      
      // Assert
      expect(emergencyFund, equals(48000.0));
    });

    test('should handle currency formatting', () {
      // Arrange
      double amount = 1234567.89;
      
      // Act - Brazilian Real formatting simulation
      String formatted = 'R\$ ${amount.toStringAsFixed(2)}';
      
      // Assert
      expect(formatted, equals('R\$ 1234567.89'));
    });
  });
}

// Helper function for power calculation
double pow(double base, int exponent) {
  double result = 1.0;
  for (int i = 0; i < exponent; i++) {
    result *= base;
  }
  return result;
}