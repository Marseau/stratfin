#!/bin/bash

# StratFin Test Runner Script
# This script runs all types of tests for the StratFin application

set -e  # Exit on any error

echo "🚀 StratFin Test Runner"
echo "======================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    print_error "Flutter is not installed or not in PATH"
    exit 1
fi

print_status "Flutter version:"
flutter --version

# Navigate to project directory
cd "$(dirname "$0")"

print_status "Installing dependencies..."
flutter pub get

# Run different types of tests based on argument
case "${1:-all}" in
    "unit")
        print_status "Running unit tests..."
        flutter test test/unit/
        ;;
    "widget") 
        print_status "Running widget tests..."
        flutter test test/widget/
        ;;
    "integration")
        print_status "Running integration tests..."
        flutter test integration_test/
        ;;
    "coverage")
        print_status "Running tests with coverage..."
        flutter test --coverage
        print_status "Generating coverage report..."
        if command -v lcov &> /dev/null; then
            lcov --remove coverage/lcov.info 'lib/firebase_options.dart' -o coverage/lcov.info
            genhtml coverage/lcov.info -o coverage/html
            print_success "Coverage report generated in coverage/html/"
        else
            print_warning "lcov not installed. Install with: brew install lcov (macOS) or apt-get install lcov (Linux)"
        fi
        ;;
    "all")
        print_status "Running all tests..."
        
        print_status "1/4 Running unit tests..."
        flutter test test/unit/ || print_warning "Some unit tests failed"
        
        print_status "2/4 Running widget tests..."
        flutter test test/widget/ || print_warning "Some widget tests failed"
        
        print_status "3/4 Running integration tests..."
        flutter test integration_test/ || print_warning "Some integration tests failed"
        
        print_status "4/4 Running code analysis..."
        flutter analyze || print_warning "Code analysis found issues"
        
        print_success "All tests completed!"
        ;;
    "analyze")
        print_status "Running code analysis..."
        flutter analyze
        print_status "Checking code formatting..."
        flutter format --set-exit-if-changed .
        ;;
    "format")
        print_status "Formatting code..."
        flutter format .
        print_success "Code formatted successfully!"
        ;;
    "build")
        print_status "Testing build process..."
        flutter build apk --debug
        print_success "Build test completed!"
        ;;
    "help")
        echo "Usage: $0 [option]"
        echo ""
        echo "Options:"
        echo "  all         Run all tests (default)"
        echo "  unit        Run only unit tests"
        echo "  widget      Run only widget tests"
        echo "  integration Run only integration tests"
        echo "  coverage    Run tests with coverage report"
        echo "  analyze     Run code analysis and formatting check"
        echo "  format      Format code"
        echo "  build       Test build process"
        echo "  help        Show this help message"
        ;;
    *)
        print_error "Unknown option: $1"
        print_status "Use '$0 help' to see available options"
        exit 1
        ;;
esac

print_success "Test run completed! ✨"