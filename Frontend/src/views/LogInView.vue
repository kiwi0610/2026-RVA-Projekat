<script setup lang="ts">
import { ref } from 'vue';
import axios from 'axios';
import { useRouter } from 'vue-router';
import "@/assets/log.css";

const router = useRouter();
const credentials = ref({ email: '', password: '' });

const handleLogin = async () => {
  try {
    const response = await axios.post('http://localhost:8080/api/auth/login', credentials.value);
    localStorage.setItem('user', JSON.stringify(response.data));

    // Šalje signal da je došlo do promene u login-u
    window.dispatchEvent(new CustomEvent('login-state-changed'));

    router.push('/profile');
  } catch (error) {
    alert("Pogrešan email ili lozinka.");
  }
};
</script>

<template>
  <div class="auth-container">
    <div class="auth-card">
      <h2 class="text-success glow-text">LOGIN</h2>
      <form @submit.prevent="handleLogin">
        <div class="mb-3 text-start">
          <label class="text-secondary small">EMAIL</label>
          <input v-model="credentials.email" type="email" class="form-control custom-input" required>
        </div>
        <div class="mb-3 text-start">
          <label class="text-secondary small">LOZINKA</label>
          <input v-model="credentials.password" type="password" class="form-control custom-input" required>
        </div>
        <button type="submit" class="btn btn-fit-green w-100">PRIJAVI SE</button>
      </form>
    </div>
  </div>
</template>