<script setup lang="ts">
import { ShopService } from '@/services/shop.service'
import { onMounted, ref, computed } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const items = ref<any[]>([]); // Inicijalizacija prazanog niza radi lakše pretrage
const searchTeks = ref("");
const izabranaKategorija = ref("SVE");

const kategorije = ["SVE", "PROTEINI", "KREATINI", "AMINOKISELINE", "OPREMA", "VITAMINI"];

function retrieveData() {
  ShopService.getAll(0)
    .then(rsp => {
      // Direktno uzima niz
      items.value = rsp.data;
    })
    .catch(err => console.error("Greška:", err));
}

const filtriraniProizvodi = computed(() => {
  if (!items.value || items.value.length === 0) return [];

  return items.value.filter((item: any) => {
    // 1. Priprema podataka - uzima sve gde bi mogla biti informacija
    const naziv = (item.name || "").toLowerCase();
    const kategorija = (item.category || "").toLowerCase();
    const opis = (item.description || "").toLowerCase();

    const search = searchTeks.value.toLowerCase().trim();
    const filter = izabranaKategorija.value.toLowerCase().trim();

    // Prvo: Search uvek filtrira prvi
    if (search && !naziv.includes(search)) return false;

    // Drugo: Ako je izabrano "SVE", ne gleda kategorije
    if (filter === "sve") return true;

    // Treće: Logika za svako dugme ponaosob
    if (filter === "kreatini") {
      // Proverava 'kreatin' (SRB) i 'creatine' (ENG) u kategoriji, imenu i opisu
      return kategorija.includes("kreatin") || kategorija.includes("creat") ||
        naziv.includes("kreatin") || naziv.includes("creat");
    }

    if (filter === "proteini") {
      return kategorija.includes("prot") || naziv.includes("prot") || naziv.includes("whey");
    }

    if (filter === "aminokiseline") {
      // Hvata 'amino', 'bcaa' i 'ak'
      return kategorija.includes("amino") || naziv.includes("amino") ||
        kategorija.includes("bcaa") || naziv.includes("bcaa") ||
        kategorija.includes("ak") || naziv.includes(" ak");
    }

    if (filter === "oprema") {
      // Hvata sve što liči na opremu (flašice, šejkere, torbe, majice...)
      return kategorija.includes("opr") || kategorija.includes("gear") ||
        kategorija.includes("acc") || naziv.includes("sejker") ||
        naziv.includes("flas") || naziv.includes("torba") ||
        naziv.includes("oprema") || naziv.includes("shaker");
    }

    if (filter === "vitamini") {
      return kategorija.includes("vit") || naziv.includes("vit") || kategorija.includes("minera");
    }

    // Default ako ništa ne upali (traži bukvalno poklapanje)
    return kategorija.includes(filter) || naziv.includes(filter);
  });
});
 
function dodajUKorpu(item: any) {
  const user = localStorage.getItem('user');
  if (!user) {
    alert("Morate biti ulogovani!");
    router.push('/login');
    return;
  }
  const userData = JSON.parse(user);
  const cartKey = `cart_${userData.username}`;

  let korpa = JSON.parse(localStorage.getItem(cartKey) || '[]');
  const postojeci = korpa.find((p: any) => p.id === item.id);

  if (postojeci) {
    postojeci.quantity += 1;
  } else {
    korpa.push({ ...item, quantity: 1, img: item.img || item.imagePath });
  }
  localStorage.setItem(cartKey, JSON.stringify(korpa));
  alert(`Dodato u korpu!`);
}

onMounted(() => retrieveData());
</script>


<template>
  <div class="container mt-4 pb-5">
    <div class="row mb-3 justify-content-center">
      <div class="col-md-6 position-relative">
        <i class="fa-solid fa-magnifying-glass" style="position: absolute; left: 25px; top: 15px; color: #28a745;"></i>
        <input type="text" v-model="searchTeks" class="form-control ps-5" placeholder="Pretraži..."
          style="background: #1a1a1a; color: white; border-radius: 30px; border: 1px solid #333;">
      </div>
    </div>

    <div class="d-flex justify-content-center gap-2 mb-5 flex-wrap">
      <button v-for="kat in kategorije" :key="kat" @click="izabranaKategorija = kat"
        :class="['btn-filter', izabranaKategorija === kat ? 'active' : '']">
        {{ kat }}
      </button>
    </div>

    <div class="row row-cols-1 row-cols-md-4 g-4" v-if="filtriraniProizvodi.length > 0">
      <div class="col" v-for="item in filtriraniProizvodi" :key="item.id">
        <div class="card h-100 bg-dark text-white border-secondary shadow-sm">
          <img :src="'/' + (item.img || item.imagePath)" class="card-img-top p-3"
            style="height: 180px; object-fit: contain;">
          <div class="card-body text-center">
            <h6 class="card-title">{{ item.name }}</h6>
            <h5 class="text-success">{{ item.act > 0 ? item.act : item.price }} RSD</h5>
          </div>
          <div class="card-footer d-flex gap-2 bg-transparent border-0">
            <RouterLink :to="'/api/shop/' + item.id" class="btn btn-outline-light btn-sm w-100">DETALJI</RouterLink>
            <button @click="dodajUKorpu(item)" class="btn btn-success btn-sm"><i
                class="fa-solid fa-cart-plus"></i></button>
          </div>
        </div>
      </div>
    </div>

    <div v-else class="text-center mt-5 text-secondary">
      <i class="fa-solid fa-face-frown fa-3x mb-3"></i>
      <h4>Nažalost, nismo pronašli ništa za "{{ izabranaKategorija }}".</h4>
      <p>Probajte sa drugom kategorijom ili proverite kucanje.</p>
    </div>
  </div>
</template>

<style scoped>
.btn-filter {
  background: #111;
  color: #888;
  border: 1px solid #333;
  padding: 8px 20px;
  border-radius: 20px;
  cursor: pointer;
}

.btn-filter.active {
  background: #28a745;
  color: white;
  border-color: #28a745;
  box-shadow: 0 0 10px rgba(40, 167, 69, 0.5);
}

.card {
  transition: 0.3s;
}

.card:hover {
  transform: translateY(-5px);
  border-color: #28a745 !important;
}
</style>