<script setup lang="ts">
import { ref, computed, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import axios from 'axios';

const router = useRouter();
const cartItems = ref<any[]>([]);

const getCartKey = () => {
    const user = localStorage.getItem('user');
    if (user) {
        const userData = JSON.parse(user);
        return `cart_${userData.username}`;
    }
    return 'cart_guest';
};

const ucitajKorpu = () => {
    const savedCart = localStorage.getItem(getCartKey());
    cartItems.value = savedCart ? JSON.parse(savedCart) : [];
};

onMounted(() => ucitajKorpu());

const totalSum = computed(() => {
    return cartItems.value.reduce((acc, item) => acc + (item.price * item.quantity), 0);
});

function saveCart() {
    localStorage.setItem(getCartKey(), JSON.stringify(cartItems.value));
}

function increaseQty(item: any) { item.quantity++; saveCart(); }
function decreaseQty(item: any) { if (item.quantity > 1) { item.quantity--; saveCart(); } }
function removeFromCart(id: number) {
    cartItems.value = cartItems.value.filter(i => i.id !== id);
    saveCart();
}

const zavrsiPorudbinu = async () => {
    const userStr = localStorage.getItem('user');
    if (!userStr) {
        alert("Morate biti ulogovani!");
        return;
    }

    const user = JSON.parse(userStr);

    const orderData = {
        userId: user.id,
        totalPrice: totalSum.value,
        items: cartItems.value.map(item => ({
            itemId: item.id,   
            amount: item.quantity,
            price: item.price
        }))
    };

    try {
        const response = await axios.post('http://localhost:8080/api/orders', orderData);
        alert('Porudžbina uspešna!');
        cartItems.value = [];
        saveCart();
    } catch (error) {
        console.error("Greška pri slanju:", error);
        alert("Došlo je do greške prilikom čuvanja porudžbine.");
    }
};

</script>

<template>
    <div class="container mt-5">
        <h2 class="text-white text-uppercase mb-4">Vaša Korpa <i class="fa-solid fa-cart-shopping text-success"></i>
        </h2>

        <div v-if="cartItems.length > 0" class="bg-dark p-4 rounded shadow border border-secondary">
            <div class="table-responsive">
                <table class="table table-dark table-hover align-middle">
                    <thead>
                        <tr class="text-secondary small text-uppercase">
                            <th>Proizvod</th>
                            <th>Naziv</th>
                            <th>Cena</th>
                            <th>Količina</th>
                            <th>Ukupno</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="item in cartItems" :key="item.id">
                            <td><img :src="'/' + item.img" style="width: 60px; height: 60px; object-fit: contain;"></td>
                            <td class="fw-bold">{{ item.name }}</td>
                            <td>{{ item.price }} RSD</td>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <button class="btn btn-outline-success btn-sm" @click="decreaseQty(item)">-</button>
                                    <span>{{ item.quantity }}</span>
                                    <button class="btn btn-outline-success btn-sm" @click="increaseQty(item)">+</button>
                                </div>
                            </td>
                            <td class="text-success fw-bold">{{ item.price * item.quantity }} RSD</td>
                            <td><button class="btn btn-outline-danger btn-sm" @click="removeFromCart(item.id)"><i
                                        class="fa-solid fa-trash"></i></button></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="d-flex justify-content-between align-items-center mt-5 border-top border-secondary pt-4">
                <RouterLink to="/api/shop" class="btn btn-outline-secondary">NASTAVI KUPOVINU</RouterLink>
                <div class="text-end text-white">
                    <h5 class="text-secondary small text-uppercase">Ukupno za uplatu:</h5>
                    <h2 class="text-success fw-bold">{{ totalSum }} RSD</h2>
                    <button class="btn btn-success px-5 mt-2 fw-bold" @click="zavrsiPorudbinu">ZAVRŠI
                        PORUDŽBINU</button>
                </div>
            </div>
        </div>

        <div v-else class="bg-dark text-center p-5 rounded border border-secondary">
            <h3 class="text-secondary">Vaša korpa je trenutno prazna.</h3>
            <RouterLink to="/api/shop" class="btn btn-success mt-4">NAZAD U PRODAVNICU</RouterLink>
        </div>
    </div>
</template>