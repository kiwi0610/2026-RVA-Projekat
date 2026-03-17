import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import 'bootstrap/dist/css/bootstrap.min.css'  // Za stil
import 'bootstrap/dist/js/bootstrap.min'      //  Za funkcionalnosti

const app = createApp(App)

app.use(router)

app.mount('#app')
