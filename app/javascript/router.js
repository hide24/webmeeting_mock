import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

import Layout from 'views/layouts/Layout.vue'

import MeetingIndex from 'views/meetings/IndexPage.vue'

const routes = [
  { path: '/',
    component: Layout,
    children: [
      { path: '',
        name: 'meetingIndex',
        component: MeetingIndex },
    ],
  },
]

export default new VueRouter({
  routes,
})
