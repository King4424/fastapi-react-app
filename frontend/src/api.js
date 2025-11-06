import axios from 'axios'

const API_BASE = import.meta.env.VITE_API_BASE || 'http://localhost:8000'
const api = axios.create({ baseURL: API_BASE })

export const getTasks = () => api.get('/tasks')
export const createTask = (payload) => api.post('/tasks', payload)
export const updateTask = (id, payload) => api.put(`/tasks/${id}`, payload)
export const deleteTask = (id) => api.delete(`/tasks/${id}`)
