# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

# StratFin - Financial Planning Application

## Overview
StratFin is a comprehensive financial planning application built with a microservices architecture combining Flutter mobile/web applications, Firebase backend services, Python data processing services, and various cloud-based microservices for financial data aggregation and analysis.

## Project Architecture

### 1. Frontend Applications

#### Primary Flutter Apps
- **`emails/`** - Main Flutter application (FlutterFlow-based)
  - Email management and notification system
  - User interface for financial planning features
  - Uses Flutter SDK >=3.0.0 with Firebase 4.x dependencies
- **`strat_fin/`** - Secondary Flutter application 
  - Core financial planning interface
  - Advanced charting and data visualization capabilities
  - Uses Flutter SDK >=3.0.0 with Firebase 5.x dependencies (newer version)
  - Includes Syncfusion Charts and enhanced WebView support

#### Technology Stack
- **Framework**: Flutter 3.0+ (Dart SDK >=3.0.0 <4.0.0)
- **State Management**: Provider pattern
- **Navigation**: go_router 12.1.3
- **Charts**: fl_chart 0.68.0, syncfusion_flutter_charts 22.1.34
- **UI Components**: Material Design with custom themes

#### Key Flutter Dependencies
- Firebase suite (auth, firestore, functions, storage, messaging)
- Google Sign-In integration
- File picker and image handling
- CSV export capabilities
- WebView integration
- Local storage (shared_preferences, secure_storage)

### 2. Backend Services

#### Firebase Infrastructure
- **Authentication**: Firebase Auth with multiple providers (Google, Apple, GitHub)
- **Database**: Cloud Firestore with complex data schemas
- **Storage**: Firebase Storage for file management
- **Functions**: Node.js Cloud Functions (multiple codebases)
- **Configuration**: `firebase.json` with emulator support

#### Python Microservices

##### Data Processing Service (`cloud_run_app(AgentesAutomos&Indicadores)/`)
- **Purpose**: Economic indicators and autonomous agents data processing
- **Framework**: Flask 2.0.3
- **Features**:
  - CVM (Brazilian Securities Commission) data integration
  - Economic indicators from Brazilian Central Bank API
  - Yahoo Finance integration for market data
  - Google Cloud Storage integration
  - Automated data collection and processing

##### Email Service (`app.py` - Root level)
- **Purpose**: Invitation and notification email management
- **Framework**: Flask 2.0.3
- **Features**:
  - SMTP email sending
  - Firebase Firestore integration
  - Invitation tracking and management
  - Automated reminder system

##### Middleware API (`middleware-api/`)
- **Purpose**: API gateway and CORS handling
- **Framework**: Flask with Flask-CORS
- **Features**:
  - API proxy for getFileFromGCS function
  - CORS configuration for authorized domains
  - Request routing and error handling

##### Dashboard Service (`engajar/my_dashboard_project/`)
- **Purpose**: Economic indicators dashboard
- **Framework**: Flask with Plotly
- **Features**:
  - Interactive data visualization
  - Economic indicators display
  - Dashboard templates

##### Notification Service (`engajar/notificacao_indicadores/`)
- **Purpose**: Automated indicator notifications
- **Framework**: Python with Firebase Admin SDK
- **Features**:
  - Scheduled notifications
  - Firebase integration
  - Google Cloud Storage integration

#### Node.js Cloud Functions
- **Email Functions** (`emails/functions/`, `emails/functionsV1/`)
  - SendGrid and Brevo email providers
  - Welcome and registration emails
  - Invitation management
- **File Management** (`getFileFromGCS/`)
  - Google Cloud Storage file retrieval
  - Data processing and filtering
- **User Management** (`ExportarUsersImportarpublic_Users/`)
  - User data export/import functionality
  - Firebase Admin SDK integration

### 3. Data Management

#### Database Schema (Firestore)
Key collections include:
- `users` - User profiles and authentication data
- `cliente_*` - Various client financial data collections
- `convidados` - Invitation management
- `chats` and `mensagens` - Communication features
- `atividade` - Activity tracking
- `produto` - Financial products catalog

#### External Data Sources
- **Brazilian Central Bank API**: Economic indicators (IPCA, SELIC, PIB, etc.)
- **CVM (Brazilian Securities Commission)**: Autonomous agents data
- **Yahoo Finance**: Market data and exchange rates
- **Google Cloud Storage**: File storage and data persistence

### 4. Infrastructure & Deployment

#### Containerization
- **Docker Images**: Multiple Dockerfiles for different services
- **Base Images**: Python 3.9-slim, Python 3.9 (full)
- **Web Servers**: Gunicorn for production deployments
- **Port Configuration**: Standardized on port 8080

#### Cloud Services
- **Google Cloud Platform**: Primary cloud provider
- **Firebase**: Authentication, database, functions, storage
- **Cloud Run**: Container deployment platform
- **Cloud Storage**: File and data storage

#### Configuration Files
- **Firebase**: `firebase.json`, `firestore.rules`, `firestore.indexes.json`
- **CORS**: `cors-config.json` for cross-origin requests
- **Environment**: Service account keys and API configurations

## Development Setup

### Prerequisites
- Flutter SDK 3.0+
- Node.js 18.x
- Python 3.9+
- Docker (for containerized services)
- Firebase CLI
- Google Cloud SDK (optional)

### Flutter Applications

#### Setup Commands
```bash
# Navigate to either emails/ or strat_fin/ directory
cd emails/  # or cd strat_fin/

# Install dependencies
flutter pub get

# Run on web
flutter run -d chrome

# Run on mobile (with device/emulator connected)
flutter run

# Build for web
flutter build web

# Build for mobile
flutter build apk  # Android
flutter build ios  # iOS
```

#### Firebase Configuration
- Both Flutter apps have Firebase configured with `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
- Web configuration embedded in `index.html`

### Python Services

#### Local Development
```bash
# For each Python service directory
cd cloud_run_app\(AgentesAutomos\&Indicadores\)/  # or other service

# Create virtual environment
python -m venv venv
source venv/bin/activate  # Linux/Mac
# or
venv\Scripts\activate  # Windows

# Install dependencies
pip install -r requirements.txt

# Run service
python app.py  # or python main.py
```

#### Docker Deployment
```bash
# Build Docker image
docker build -t stratfin-service .

# Run container
docker run -p 8080:8080 stratfin-service
```

### Firebase Functions

#### Setup and Deployment
```bash
# Install Firebase CLI globally
npm install -g firebase-tools

# Navigate to functions directory
cd emails/functions/  # or other functions directory

# Install dependencies
npm install

# Serve locally with emulators
firebase emulators:start --only functions

# Deploy to Firebase
firebase deploy --only functions
```

### Firebase Emulator Suite
```bash
# Start all emulators (from project root)
firebase emulators:start

# Access emulator UI at http://localhost:4000
# Services available:
# - Auth: localhost:9099
# - Firestore: localhost:8080
# - Functions: localhost:5001
# - Storage: localhost:9199
# - Database: localhost:9000

# Deploy specific codebase functions
firebase deploy --only functions:default    # emails/functionsV1
firebase deploy --only functions:teste      # teste/
firebase deploy --only functions:firebase-functions  # firebase-functions/
```

## Key Features

### Financial Planning
- Client financial data management
- Asset and liability tracking
- Investment scenario modeling
- Financial projections and analysis
- Emergency fund calculations
- Insurance and professional relationship management

### Data Visualization
- Interactive charts and graphs
- Economic indicators dashboard
- Financial performance metrics
- Custom reporting capabilities

### User Management
- Multi-role authentication (clients, advisors, companies)
- Invitation system for new users
- Guest login capabilities
- Profile management

### Communication
- In-app chat system
- Email notifications
- Automated reminders
- Activity tracking

### Data Integration
- Real-time economic indicators
- Market data feeds
- Government financial data
- Automated data updates

## Security Considerations

### Authentication
- Firebase Authentication with multiple providers
- JWT token management
- Role-based access control
- Secure guest access

### Data Protection
- Firestore security rules
- CORS configuration for authorized domains
- Service account key management
- Encrypted sensitive data storage

### API Security
- HTTPS endpoints only
- Request validation and sanitization
- Rate limiting considerations
- Error handling without data exposure

## Monitoring and Maintenance

### Logging
- Python services use structured logging
- Firebase Functions automatic logging
- Error tracking and reporting
- Performance monitoring

### Data Management
- Automated backups through Firebase
- CSV export capabilities
- Data validation and integrity checks
- Storage optimization

## Known Dependencies and Limitations

### External Service Dependencies
- Brazilian Central Bank API availability
- Firebase service reliability
- Google Cloud Platform services
- Third-party email providers (SendGrid, Brevo)

### Development Notes
- FlutterFlow-generated code requires careful version management
- Multiple Flutter projects need synchronized dependency updates
- Firebase emulator configuration for local development
- CORS configuration for production domains

## Support and Documentation

### Key Files for Reference
- `pubspec.yaml` files for Flutter dependencies
- `firebase.json` for Firebase configuration
- `requirements.txt` files for Python dependencies
- `package.json` files for Node.js functions
- Various Dockerfile configurations for containerization

### Development Resources
- Flutter documentation for UI development
- Firebase documentation for backend services
- Google Cloud documentation for infrastructure
- Brazilian financial APIs documentation for data integration