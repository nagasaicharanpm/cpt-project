# Campus Recruitment Management System

A full-stack college placement management application with a React/Vite client and Spring Boot/MongoDB API.

## Project layout

- `frontend/` React application with role-aware routing and API services
- `backend/` Spring Boot REST API with JWT security, JPA entities, validation, and role policies
- `database/` data model notes
- `docs/` API and data model documentation

## Prerequisites

- Node.js 20+
- Java 21 (the backend is compiled for Java 21)
- Maven 3.9+ or Maven Wrapper
- MongoDB 7+

For this workspace, portable copies are available under `.tools/`:

- `.tools/jdk21/jdk-21.0.12.1+1`
- `.tools/maven/apache-maven-3.9.11`
- `.tools/mongodb-win32-x86_64-windows-7.0.43/`

## Run locally

```powershell
cd backend
Copy-Item .env.example .env
$env:JAVA_HOME="..\.tools\jdk21\jdk-21.0.12.1+1"
$env:Path="$env:JAVA_HOME\bin;..\.tools\maven\apache-maven-3.9.11\bin;$env:Path"
mvn spring-boot:run

cd ..\frontend
Copy-Item .env.example .env
npm install
npm run dev
```

The API uses MongoDB at `mongodb://127.0.0.1:27017/crms`, listens on `http://localhost:8080`, and Vite listens on `http://localhost:5173`.

For a local run after the portable tools are installed:

```powershell
powershell -ExecutionPolicy Bypass -File .\start-local.ps1
```

To stop the local services:

```powershell
powershell -ExecutionPolicy Bypass -File .\stop-local.ps1
```

The public registration endpoint allows only `STUDENT` and `RECRUITER`. Create the first privileged account through the documented secure bootstrap variables (`CRMS_BOOTSTRAP_ADMIN_EMAIL` and `CRMS_BOOTSTRAP_ADMIN_PASSWORD`) or an operator-approved database migration.

## Current implementation

The implementation includes JWT login/register, role-based access control, student/company/job/application/interview/placement-drive/notification APIs, duplicate application protection, owner checks, eligibility verification, PDF resume upload authorization, dashboard statistics, CSV reports, and responsive React screens for student, recruiter, placement officer, and administrator workflows with real Axios calls.

Before deployment, set strong secrets, configure object/file storage, enable HTTPS, and run the backend against Java 21/Maven.
"# campus_recuritment_system" 
"# campus_recuritment_system" 
