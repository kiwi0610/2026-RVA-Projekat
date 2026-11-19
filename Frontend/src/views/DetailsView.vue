<script setup lang="ts">
import { useRoute, useRouter } from 'vue-router';
import { ref, onMounted } from 'vue';
import axios from 'axios';

const route = useRoute();
const router = useRouter();
const proizvod = ref<any>(null);
const kolicina = ref(1);

const getCartKey = () => {
  const userStr = localStorage.getItem('user');
  if (!userStr) return 'cart_guest';
  const userData = JSON.parse(userStr);
  const idKey = userData?.username || userData?.email || userData?.id;
  return idKey ? `cart_${idKey}` : 'cart_guest';
};

const fetchProizvod = async () => {
  const id = route.params.id;
  try {
    const response = await axios.get(`http://localhost:8080/api/shop/${id}`);
    proizvod.value = response.data;
  } catch (error) {
    console.error("Greška pri učitavanju:", error);
  }
};

const povecaj = () => { kolicina.value++; };
const smanji = () => { if (kolicina.value > 1) kolicina.value--; };

const dodajUKorpu = () => {
  const user = localStorage.getItem('user');
  if (!user) {
    alert("Morate biti ulogovani!");
    router.push('/login');
    return;
  }

  const cartKey = getCartKey();
  let korpa = JSON.parse(localStorage.getItem(cartKey) || '[]');
  const postojeci = korpa.find((p: any) => String(p.id) === String(proizvod.value.id));

  if (postojeci) {
    postojeci.quantity += kolicina.value;
  } else {
    korpa.push({
      id: proizvod.value.id,
      name: proizvod.value.name,
      price: proizvod.value.act > 0 ? proizvod.value.act : proizvod.value.price,
      img: proizvod.value.img || proizvod.value.imagePath,
      quantity: kolicina.value
    });
  }

  localStorage.setItem(cartKey, JSON.stringify(korpa));
  window.dispatchEvent(new Event("cart-updated"));
  alert(`Dodato ${kolicina.value} komada u korpu!`);
};

onMounted(fetchProizvod);
</script>

<template>
  <div class="auth-container fly-in py-5">
    <div v-if="proizvod" class="auth-card wide-card p-5">
      <div class="row align-items-center">
        <div class="col-md-5">
          <div class="image-box text-center">
            <img :src="'/' + (proizvod.img || proizvod.imagePath)"
              class="img-fluid rounded shadow-lg main-product-img" alt="Proizvod">
          </div>
        </div>

        <div class="col-md-7 text-start ps-md-5">
          <h1 class="glow-text mb-2 text-uppercase">{{ proizvod.name }}</h1>
          <p class="text-success fw-bold mb-4">
            Kategorija: {{ typeof proizvod.category === 'string' ? proizvod.category :
              (proizvod.category?.name || 'Suplementi') }}
          </p>

          <div class="price-tag mb-4 fs-2 fw-bold">
            <template v-if="proizvod.act > 0">
              <span class="text-decoration-line-through text-secondary fs-5 me-3">
                {{ proizvod.price * kolicina }} RSD
              </span>
              <span class="text-danger">{{ proizvod.act * kolicina }} RSD</span>
            </template>
            <template v-else>
              <span class="text-success">{{ proizvod.price * kolicina }} RSD</span>
            </template>
          </div>

          <h5 class="text-secondary small text-uppercase fw-bold">Opis proizvoda:</h5>
          <p class="text-white opacity-75 lead fs-6">
            {{ proizvod.opis || proizvod.description || 'Premium suplement za vrhunske rezultate.' }}
          </p>

          <div class="d-flex align-items-center mb-4 mt-4">
            <h5 class="text-secondary small text-uppercase fw-bold me-3 mb-0">Količina:</h5>
            <div class="input-group" style="width: 140px;">
              <button class="btn btn-outline-success border-secondary text-white" @click="smanji">-</button>
              <input type="text" class="form-control bg-dark text-white border-secondary text-center"
                v-model="kolicina" readonly>
              <button class="btn btn-outline-success border-secondary text-white" @click="povecaj">+</button>
            </div>
          </div>

          <div class="d-flex gap-3 mt-5 w-100">
            <button class="btn btn-fit-green flex-fill py-3 fw-bold" @click="dodajUKorpu"
              :disabled="proizvod.amount <= 0">
              {{ (proizvod.amount > 0 || proizvod.amount === undefined) ? 'DODAJ U KORPU' : 'NEMA NA STANJU' }}
            </button>
            <RouterLink to="/api/shop"
              class="btn btn-outline-secondary flex-fill py-3 d-flex align-items-center justify-content-center">
              NAZAD
            </RouterLink>
          </div>
        </div>
      </div>
    </div>

    <div v-else class="text-center mt-5">
      <div class="spinner-border text-success" style="width: 3rem; height: 3rem;" role="status"></div>
      <p class="text-success mt-2">Učitavanje proizvoda...</p>
    </div>
  </div>
</template>

<style scoped>
.wide-card {
  max-width: 1000px;
  margin: 0 auto;
  background: #0a0a0a;
  border: 1px solid #222;
}

.main-product-img {
  max-height: 450px;
  object-fit: contain;
  transition: transform 0.3s ease;
}

.main-product-img:hover {
  transform: scale(1.05);
}

.btn-fit-green {
  background-color: #28a745;
  color: white;
  border-radius: 5px;
  transition: 0.3s;
}

.btn-fit-green:hover {
  background-color: #218838;
  box-shadow: 0 0 15px rgba(40, 167, 69, 0.4);
}

.glow-text {
  text-shadow: 0 0 10px rgba(40, 167, 69, 0.2);
  font-weight: 800;
}
</style>