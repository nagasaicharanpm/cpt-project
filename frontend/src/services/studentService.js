import api from './api'
export const getMyStudent=()=>api.get('/students/me')
export const updateMyStudent=data=>api.put('/students/me',data)
export const uploadResume=file=>{const form=new FormData();form.append('file',file);return api.post('/students/me/resume',form,{headers:{'Content-Type':'multipart/form-data'}})}
