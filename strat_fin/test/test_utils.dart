import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

/// Test utilities for StratFin application
class TestUtils {
  /// Creates a mock Firebase Firestore instance for testing
  static FakeFirebaseFirestore createMockFirestore() {
    final firestore = FakeFirebaseFirestore();
    
    // Pre-populate with test data
    _setupTestData(firestore);
    
    return firestore;
  }

  /// Creates a mock Firebase Auth instance for testing
  static MockFirebaseAuth createMockAuth() {
    return MockFirebaseAuth(
      mockUser: MockUser(
        uid: 'test-user-id',
        email: 'test@stratfin.com',
        displayName: 'Test User',
      ),
    );
  }

  /// Wraps a widget with MaterialApp for testing
  static Widget wrapWithMaterialApp(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  /// Pumps a widget and waits for all animations to complete
  static Future<void> pumpAndSettle(WidgetTester tester, Widget widget) async {
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
  }

  /// Creates test data for financial calculations
  static Map<String, dynamic> createTestClientData() {
    return {
      'id': 'test-client-1',
      'nome': 'Cliente Teste',
      'email': 'cliente@teste.com',
      'cpf': '123.456.789-00',
      'dataNascimento': DateTime(1990, 1, 1),
      'rendaMensal': 15000.0,
      'gastosMensais': 8000.0,
      'ativosFinanceiros': [
        {
          'tipo': 'Conta Corrente',
          'valor': 50000.0,
          'instituicao': 'Banco Teste',
        },
        {
          'tipo': 'Investimentos',
          'valor': 200000.0,
          'instituicao': 'Corretora Teste',
        },
      ],
      'passivos': [
        {
          'tipo': 'Financiamento Imobiliário',
          'valor': 300000.0,
          'parcelas': 240,
        },
      ],
    };
  }

  /// Creates test data for economic indicators
  static Map<String, dynamic> createTestIndicatorData() {
    return {
      'ipca': {
        'valor': 0.62,
        'data': DateTime.now(),
        'periodo': 'Mensal',
      },
      'selic': {
        'valor': 11.75,
        'data': DateTime.now(),
        'periodo': 'Anual',
      },
      'igpm': {
        'valor': 0.91,
        'data': DateTime.now(),
        'periodo': 'Mensal',
      },
    };
  }

  /// Verifies if a financial calculation is within expected range
  static bool isWithinRange(double value, double expected, double tolerance) {
    return (value >= expected - tolerance) && (value <= expected + tolerance);
  }

  /// Formats currency for testing (Brazilian Real)
  static String formatCurrency(double value) {
    return 'R\$ ${value.toStringAsFixed(2).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    )}';
  }

  /// Setup test data in mock Firestore
  static void _setupTestData(FakeFirebaseFirestore firestore) {
    // Add test user
    firestore.collection('users').doc('test-user-id').set({
      'uid': 'test-user-id',
      'email': 'test@stratfin.com',
      'displayName': 'Test User',
      'created_time': DateTime.now(),
    });

    // Add test client data
    final clientData = createTestClientData();
    firestore.collection('clientes').doc('test-client-1').set(clientData);

    // Add test indicators
    final indicatorData = createTestIndicatorData();
    firestore.collection('indicadores').doc('current').set(indicatorData);

    // Add test products
    firestore.collection('produtos').doc('test-product-1').set({
      'nome': 'Produto Teste',
      'tipo': 'Investimento',
      'rendimento': 12.0,
      'risco': 'Médio',
    });
  }
}

/// Custom matchers for financial testing
class FinancialMatchers {
  /// Matches currency values with tolerance
  static Matcher closeToCurrency(double expected, {double tolerance = 0.01}) {
    return closeTo(expected, tolerance);
  }

  /// Matches percentage values
  static Matcher isValidPercentage(double value) {
    return allOf(
      greaterThanOrEqualTo(0.0),
      lessThanOrEqualTo(100.0),
    );
  }

  /// Matches valid CPF format
  static Matcher isValidCPF(String cpf) {
    final cleanCpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');
    return hasLength(11);
  }

  /// Matches valid email format
  static Matcher isValidEmail(String email) {
    return matches(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  }
}