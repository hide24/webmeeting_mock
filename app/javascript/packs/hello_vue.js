import Vue from 'vue'
import VueRouter from 'vue-router'
import App from '../app.vue'
import router from '../router.js'
import vuetify from '../plugins/vuetify'
//require('../plugins/i18n-loader')
import Toasted from 'vue-toasted'
let toast_options = {
  position: 'top-right',
  duration: 3000,
  type: 'default',
  theme: 'toasted-primary',
}
Vue.use(Toasted, toast_options)
import VuejsDialog from 'vuejs-dialog'
import VuejsDialogMixin from 'vuejs-dialog/dist/vuejs-dialog-mixin.min.js'
import 'vuejs-dialog/dist/vuejs-dialog.min.css'
Vue.use(VuejsDialog)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    router,
    vuetify,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)
})
