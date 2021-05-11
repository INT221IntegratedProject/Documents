import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import './assets/tailwind.css'
import BaseButton from './components/BaseButton'

const app = createApp(App)
app.component('base-button', BaseButton)
app.use(router).mount('#app')
