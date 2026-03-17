<script setup lang="ts">
import { ref, onMounted, onUnmounted, watchEffect } from 'vue';
import { useRouter } from 'vue-router';
import NavbarLink from '@/components/Navbarlink.vue'
import '@fortawesome/fontawesome-free/css/all.css'
import './assets/main.css'

const year = new Date().getFullYear();
const router = useRouter();
const isLoggedIn = ref(false);

const checkUser = () => {
  // Proverava da li u localStorage postoji sačuvan korisnik
  isLoggedIn.value = !!localStorage.getItem('user');
};

onMounted(() => {
  checkUser();
  // Sluša custom event kako bi se Logout pojavio bez refresh-a
  window.addEventListener('login-state-changed', checkUser);
});

onUnmounted(() => {
  window.removeEventListener('login-state-changed', checkUser);
});

watchEffect(() => {
  checkUser();
});

const handleLogout = () => {
  // Briše podatke i osvežava navigaciju
  localStorage.removeItem('user');
  isLoggedIn.value = false;
  router.push('/login');
};
</script>

<template>
  <nav class="moj-nav">
    <div class="nav-sadrzaj">
      <a class="nav-brand" href="/">
        FIT PRO <i class="fa-solid fa-person-running"></i>
      </a>

      <ul class="nav-lista">
        <li class="stavka">
          <NavbarLink to="/" name="Početna" class="link-tekst" />
          <i class="fa-solid fa-house"></i>
        </li>
        <li class="stavka">
          <NavbarLink to="/api/shop" name="Prodavnica" class="link-tekst" />
          <i class="fa-solid fa-dumbbell"></i>
        </li>
        <li class="stavka">
          <NavbarLink to="/about" name="O NAMA" class="link-tekst" />
          <i class="fa-solid fa-circle-info"></i>
        </li>

        <template v-if="!isLoggedIn">
          <li class="stavka">
            <NavbarLink to="/login" name="LOGIN" class="link-tekst" />
            <i class="fa-solid fa-user-check"></i>
          </li>
          <li class="stavka">
            <NavbarLink to="/signin" name="SIGN IN" class="link-tekst" />
            <i class="fa-solid fa-user-plus"></i>
          </li>
        </template>

        <li v-if="isLoggedIn" class="stavka">
          <NavbarLink to="/profile" name="PROFILE" class="link-tekst" />
          <i class="fa-solid fa-user-gear"></i>
        </li>
      </ul>

      <div class="nav-desno">
        <ul class="nav-lista">
          <li v-if="isLoggedIn" class="stavka logout-item" @click="handleLogout">
            <span class="link-tekst">LOGOUT</span>
            <i class="fa-solid fa-arrow-right-from-bracket"></i>
          </li>
          <li class="stavka">
            <NavbarLink to="/cart" name="KORPA" class="link-tekst" />
            <i class="fa-solid fa-cart-shopping"></i>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <RouterView />

  <footer class="footer">
    &copy; {{ year }} - Razvoj Veb Aplikacija
  </footer>
</template>

<style scoped>
/* Da bi Logout i Korpa bili skroz desno */
.nav-sadrzaj {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 10px;
}

.nav-lista {
  display: flex;
  list-style: none;
  align-items: center;
  gap: 20px;
}

.nav-desno {
  margin-left: auto;
}

.logout-item {
  cursor: pointer;
  color: #ff4d4d;
}

.logout-item:hover {
  color: white;
}
</style>