<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import axios from 'axios';

const router = useRouter();
const user = ref<any>(null);
const isEditing = ref(false);
const novaLozinka = ref(''); // Nova varijabla za lozinku

onMounted(() => {
    const savedUser = localStorage.getItem('user');
    if (!savedUser) {
        router.push('/login');
    } else {
        user.value = JSON.parse(savedUser);
    }
});

const toggleEdit = () => {
    isEditing.value = !isEditing.value;
    if (!isEditing.value) {
        novaLozinka.value = ''; // Resetuj lozinku ako se odustane od izmene
    }
};

const handleUpdate = async () => {
    try {
        const userId = user.value.id;

        // Priprema objekta za slanje - spajanje trenutnih podataka i nove lozinke
        const dataToSave = {
            ...user.value,
            password: novaLozinka.value // Backend će hešovati ako nije prazno
        };

        const response = await axios.put(`http://localhost:8080/api/auth/${userId}`, dataToSave);

        localStorage.setItem('user', JSON.stringify(response.data));
        user.value = response.data; // Osvežava prikaz sa novim podacima

        alert("Podaci su uspešno promenjeni!");
        isEditing.value = false;
        novaLozinka.value = ''; // Očisti polje nakon čuvanja
    } catch (error) {
        console.error("Greška pri izmeni:", error);
        alert("Došlo je do greške pri čuvanju podataka.");
    }
};

const logout = () => {
    localStorage.removeItem('user');
    window.dispatchEvent(new CustomEvent('login-state-changed'));
    router.push('/login');
};
</script>

<template>
    <div class="container mt-5 fly-in" v-if="user">
        <div class="auth-card p-5 border-success text-white mx-auto" style="max-width: 600px;">
            <div class="text-center mb-4">
                <h2 class="text-success text-uppercase fw-bold">Moj Profil <i class="fa-solid fa-user-gear"></i></h2>
            </div>

            <div class="profile-info">
                <div class="info-row">
                    <span class="label">IME I PREZIME:</span>
                    <span class="value">{{ user.first_name }} {{ user.last_name }}</span>
                </div>

                <div class="info-row">
                    <span class="label">GRAD:</span>
                    <input v-if="isEditing" v-model="user.city" class="form-control bg-dark text-white border-success">
                    <span v-else class="value">{{ user.city || 'Nije podešeno' }}</span>
                </div>

                <div class="info-row">
                    <span class="label">ADRESA:</span>
                    <input v-if="isEditing" v-model="user.address"
                        class="form-control bg-dark text-white border-success">
                    <span v-else class="value">{{ user.address || 'Nije podešeno' }}</span>
                </div>

                <div class="info-row">
                    <span class="label">TELEFON:</span>
                    <input v-if="isEditing" v-model="user.phone_number"
                        class="form-control bg-dark text-white border-success">
                    <span v-else class="value">{{ user.phone_number || 'Nije podešeno' }}</span>
                </div>

                <div class="info-row" v-if="isEditing">
                    <span class="label text-success">NOVA LOZINKA (ostavi prazno ako ne menjaš):</span>
                    <input type="password" v-model="novaLozinka" class="form-control bg-dark text-white border-success"
                        placeholder="Unesite novu lozinku">
                </div>
            </div>

            <div class="d-flex justify-content-center gap-3 mt-4 flex-wrap">
                <!-- IZMENI dugme -->
                <button @click="toggleEdit" class="btn btn-fit-green custom-btn" v-show="!isEditing">
                    IZMENI <i class="fa-solid fa-pen-to-square ms-2"></i>
                </button>

                <!-- SAČUVAJ dugme -->
                <button @click="handleUpdate" class="btn btn-success custom-btn" v-show="isEditing">
                    SAČUVAJ <i class="fa-solid fa-check ms-2"></i>
                </button>

                <!-- OTKAŽI dugme -->
                <button @click="toggleEdit" class="btn btn-outline-secondary custom-btn" v-show="isEditing">
                    OTKAŽI <i class="fa-solid fa-xmark ms-2"></i>
                </button>

                <!-- ODJAVI SE dugme -->
                <button @click="logout" class="btn btn-outline-danger custom-btn" v-show="!isEditing">
                    ODJAVI SE <i class="fa-solid fa-right-from-bracket ms-2"></i>
                </button>
            </div>
        </div>
    </div>
</template>

<style scoped>
.auth-card {
    background: #0a0a0a;
    border: 1px solid #28a745;
    border-radius: 15px;
    box-shadow: 0 0 20px rgba(40, 167, 69, 0.1);
}

.info-row {
    border-bottom: 1px solid #222;
    padding: 15px 0;
    display: flex;
    flex-direction: column;
}

.info-row:last-of-type {
    border-bottom: none;
}

.label {
    color: #28a745;
    font-size: 0.75rem;
    font-weight: bold;
    margin-bottom: 5px;
    letter-spacing: 1px;
}

.value {
    color: #fff;
    font-size: 1.1rem;
}

.d-flex {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 10px;
    align-items: center; 
}

.custom-btn {
    flex: 1 1 150px;  
    min-width: 150px; 
    max-width: 200px; 
    height: 48px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: bold;
    border-radius: 8px;
    text-transform: uppercase;
    font-size: 0.9rem;
    transition: all 0.3s ease;
}

.btn-fit-green {
    background-color: #28a745;
    color: white;
    border: none;
}

.btn-fit-green:hover {
    background-color: #218838;
    box-shadow: 0 0 15px rgba(40, 167, 69, 0.4);
}

.form-control:focus {
    background-color: #111;
    box-shadow: 0 0 10px rgba(40, 167, 69, 0.2);
}
</style>