# Database design

`users` is the identity table. `students` and `companies` are one-to-one role profiles. A company owns many `job_postings`; each `applications` row references exactly one student and one job. A unique constraint on `(student_id, job_id)` prevents duplicate applications at the database layer. Interviews reference applications and preserve multiple rounds. Timestamps are stored as UTC instants.
