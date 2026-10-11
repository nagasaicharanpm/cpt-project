import api from './api'
export const myInterviews=()=>api.get('/interviews/my')
export const createInterview=data=>api.post('/interviews',data)
