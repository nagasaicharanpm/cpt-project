import api from './api';export const myNotifications=()=>api.get('/notifications/my');export const markRead=id=>api.patch(`/notifications/${id}/read`)
