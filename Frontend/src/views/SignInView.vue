<script setup lang="ts">
import { ref } from 'vue';
import axios from 'axios';
import { useRouter } from 'vue-router';
import "@/assets/log.css";

const router = useRouter();

// Objekat koji drži podatke iz forme - usklađen sa UserModel-om u Javi
const user = ref({
  first_name: '',
  last_name: '',
  email: '',
  password: '',
  city: '',
  address: '',
  phone_number: ''
});

const handleRegister = async () => {
  try {
    // Slanje podataka na backend kontroler
    const response = await axios.post('http://localhost:8080/api/auth/register', user.value);
    
    alert("Uspešno ste se registrovali! Podaci su sačuvani u bazi.");
    console.log("Odgovor sa servera:", response.data);
    
    // Preusmeravanje na login nakon uspešne registracije
    router.push('/login');
  } catch (error: any) {
    console.error("Greška pri registraciji:", error);
    alert(error.response?.data || "Došlo je do greške pri povezivanju sa serverom.");
  }
};
</script>

<template>
  <div class="auth-container fly-in">
    <div class="auth-card wide-card">
      <h2 class="text-success glow-text">SIGN IN</h2>
      <p class="text-secondary small mb-4">POSTANI DEO EKIPE I KRENI SA TRENINGOM</p>

      <form @submit.prevent="handleRegister" class="row g-3">
        <div class="col-md-6 text-start">
          <label class="form-label text-secondary small">IME</label>
          <input v-model="user.first_name" type="text" class="form-control custom-input" required>
        </div>
        
        <div class="col-md-6 text-start">
          <label class="form-label text-secondary small">PREZIME</label>
          <input v-model="user.last_name" type="text" class="form-control custom-input" required>
        </div>
        
        <div class="col-12 text-start">
          <label class="form-label text-secondary small">EMAIL</label>
          <input v-model="user.email" type="email" class="form-control custom-input" required>
        </div>
        
        <div class="col-md-6 text-start">
          <label class="form-label text-secondary small">LOZINKA</label>
          <input v-model="user.password" type="password" class="form-control custom-input" required>
        </div>

        <div class="col-md-6 text-start">
          <label class="form-label text-secondary small">GRAD</label>
          <input v-model="user.city" type="text" class="form-control custom-input" required>
        </div>
        
        <div class="col-md-6 text-start">
          <label class="form-label text-secondary small">ADRESA</label>
          <input v-model="user.address" type="text" class="form-control custom-input" required>
        </div>
        
        <div class="col-md-6 text-start">
          <label class="form-label text-secondary small">BROJ TELEFONA</label>
          <input v-model="user.phone_number" type="text" class="form-control custom-input" required>
        </div>

        <div class="col-12 mt-4">
          <button type="submit" class="btn btn-fit-green w-100">KREIRAJ NALOG</button>
        </div>
      </form>
    </div>
  </div>
</template>