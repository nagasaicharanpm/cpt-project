import api from './api'
export const apply=data=>api.post('/applications',data)
export const myApplications=()=>api.get('/applications/my')
export const jobApplications=jobId=>api.get(`/jobs/${jobId}/applications`)
export const updateApplicationStatus=(id,status)=>api.patch(`/applications/${id}/status`,{status})
