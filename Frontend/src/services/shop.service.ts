import axios from "axios";

const client = axios.create({
    baseURL: "http://localhost:8080/api/shop",
    headers: {
        "Accept" : "application/json",
        "Content-Type": "application/json"
    }
});

export class ShopService {
    static async getAll(page = 0) {
        // Koristimo /all jer tvoj backend verovatno tamo vraća listu
        return await client.get(`/all?page=${page}&size=12`);
    }

    // Za jedan proizvod
    static async getItemById(id: number) {
        return await client.get(`/${id}`)
    }
}