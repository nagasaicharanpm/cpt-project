import api from './api'
export const companies=()=>api.get('/companies')
export const myCompany=()=>api.get('/companies/me')
export const updateCompany=data=>api.put('/companies/me',data)
