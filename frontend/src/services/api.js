import axios from 'axios'

const configuredApiUrl = import.meta.env.VITE_API_BASE_URL || 'http://localhost:8080'
const apiBaseUrl = configuredApiUrl.endsWith('/api')
  ? configuredApiUrl
  : `${configuredApiUrl.replace(/\/$/, '')}/api`

const api=axios.create({baseURL:apiBaseUrl,headers:{'Content-Type':'application/json'}})
api.interceptors.request.use(config=>{const token=localStorage.getItem('crms_token');if(token)config.headers.Authorization=`Bearer ${token}`;return config})
api.interceptors.response.use(r=>r,e=>{if(e.response?.status===401){localStorage.removeItem('crms_token');localStorage.removeItem('crms_user')}return Promise.reject(e)})
export default api
