import api from './api'
export const adminDashboard=()=>api.get('/admin/dashboard')
export const adminUsers=()=>api.get('/admin/users')
export const placementStats=()=>api.get('/admin/placements/statistics')
