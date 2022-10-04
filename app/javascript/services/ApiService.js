import axios from 'axios'
import { csrfToken } from '@rails/ujs'
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

export const ExternalServiceApi = {
  endPoint: '/api/v1/external_services/',
  getAll() {
    return axios.get(ExternalServiceApi.endPoint)
  },
  get(id) {
    return axios.get(ExternalServiceApi.endPoint + id)
  },
  create(data) {
    return axios.post(ExternalServiceApi.endPoint, {external_service: data})
  },
  update(data) {
    let id = data.id
    return axios.put(ExternalServiceApi.endPoint + id, {external_service: data}) 
  },
  delete(id) {
    return axios.delete(ExternalServiceApi.endPoint + id)
  },
}

export const MeetingApi = {
  endPoint: '/api/v1/meetings/',
  getAll() {
    return axios.get(MeetingApi.endPoint)
  },
  get(id) {
    return axios.get(MeetingApi.endPoint + id)
  },
  create(data) {
    return axios.post(MeetingApi.endPoint, {meeting: data})
  },
  update(data) {
    let id = data.id
    return axios.put(MeetingApi.endPoint + id, {meeting: data}) 
  },
  delete(id) {
    return axios.delete(MeetingApi.endPoint + id)
  },
}

export const UserApi = {
  endPoint: '/api/v1/users/',
  getAll() {
    return axios.get(UserApi.endPoint)
  },
  get(id) {
    return axios.get(UserApi.endPoint + id)
  },
  create(data) {
    return axios.post(UserApi.endPoint, {user: data})
  },
  update(data) {
    let id = data.id
    return axios.put(UserApi.endPoint + id, {user: data}) 
  },
  delete(id) {
    return axios.delete(UserApi.endPoint + id)
  },
}

