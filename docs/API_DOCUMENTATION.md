# API documentation

Base URL: `/api`. JSON errors use `{ "message": "..." }`.

| Method | Endpoint | Access | Purpose |
|---|---|---|---|
| POST | `/auth/register` | Public | Create STUDENT or RECRUITER account |
| POST | `/auth/login` | Public | Return JWT and user |
| GET | `/auth/me` | Authenticated | Current user |
| GET | `/jobs`, `/jobs/{id}` | Public | Browse jobs |
| POST/PUT/DELETE | `/jobs`, `/jobs/{id}` | Recruiter/owner, admin | Manage owned jobs |
| GET/PUT | `/students/me` | Student | Manage profile |
| POST | `/students/me/resume` | Student | Upload PDF resume |
| POST | `/applications` | Student | Apply with server-side eligibility and duplicate checks |
| GET | `/applications/my` | Student | Current applications |
| GET | `/jobs/{jobId}/applications` | Owner/officer/admin | Review applicants |
| PATCH | `/applications/{id}/status` | Owner/officer/admin | Update hiring stage |
| GET | `/interviews/my` | Student | Scheduled interviews |
| POST/PUT | `/interviews`, `/interviews/{id}` | Authenticated | Interview coordination |
| GET/POST/PUT/DELETE | `/drives`, `/drives/{id}` | Officer/admin for writes | Placement drive management |
| GET | `/notifications/my` | Authenticated | Current user notifications |
| PATCH | `/notifications/{id}/read` | Notification owner | Mark notification read |
| GET | `/placements/my` | Authenticated | Selected placement records |
| GET | `/admin/dashboard`, `/admin/placements/statistics` | Admin/officer | Statistics |
| GET | `/reports/applications.csv` | Admin/officer | CSV application export |

Send `Authorization: Bearer <token>` for protected endpoints.
