<script setup lang="ts">

</script>

<template>
  <div class="home-wrapper">
    <section class="hero fly-in">
      <div class="content">
        <h1 class="main-title">
          FIT <span class="glow-green">PRO</span>
        </h1>
        <div class="divider"></div>
        <p class="subtitle">PREVAZIĐI SVOJE GRANICE</p>

        <div class="cta-group">
          <RouterLink to="/api/shop" class="btn-fit main">
            ISTRAŽI PONUDU
          </RouterLink>
          <RouterLink to="/about" class="btn-fit outline">
            O NAMA
          </RouterLink>
        </div>
      </div>
    </section>

    <section class="info-grid container">
      <div class="info-card card-delay" style="animation-delay: 0.3s">
        <div class="card-content">
          <i class="fa-solid fa-bolt icon-main"></i>
          <h3>ENERGIJA</h3>
          <p>Najčistiji sastojci za maksimalan fokus tokom treninga.</p>
        </div>
      </div>

      <div class="info-card card-delay" style="animation-delay: 0.5s">
        <div class="card-content">
          <i class="fa-solid fa-shield-halved icon-main"></i>
          <h3>KVALITET</h3>
          <p>Svi naši proizvodi su laboratorijski testirani i sertifikovani.</p>
        </div>
      </div>

      <div class="info-card card-delay" style="animation-delay: 0.7s">
        <div class="card-content">
          <i class="fa-solid fa-truck-fast icon-main"></i>
          <h3>DOSTAVA</h3>
          <p>Brza isporuka na tvoju adresu u roku od 24/48h.</p>
        </div>
      </div>
    </section>
  </div>
</template>

<style scoped>

.home-wrapper {
  background-color: #050505;
  min-height: 100vh;
  color: white;
  overflow-x: hidden;
}

.hero {
  height: 80vh;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  background: radial-gradient(circle, rgba(0, 255, 149, 0.05) 0%, rgba(0, 0, 0, 1) 70%);
}

.main-title {
  font-size: 8rem;
  font-weight: 900;
  letter-spacing: -5px;
  margin-bottom: 0;
}

.glow-green {
  color: #00ff95;
  text-shadow: 0 0 30px rgba(0, 255, 149, 0.6);
}

.subtitle {
  font-size: 1.2rem;
  letter-spacing: 15px;
  color: #888;
  text-transform: uppercase;
  margin-top: 10px;
}

.divider {
  width: 100px;
  height: 4px;
  background-color: #00ff95;
  margin: 20px auto;
}

/* DUGMIĆI */
.cta-group {
  margin-top: 40px;
  display: flex;
  gap: 20px;
  justify-content: center;
}

.btn-fit {
  border-radius: 10px;
  padding: 15px 40px;
  text-decoration: none;
  font-weight: bold;
  letter-spacing: 2px;
  transition: 0.4s ease;
}

.btn-fit.main {
  background-color: #00ff95;
  color: black;
}

.btn-fit.outline {
  border: 1px solid #00ff95;
  color: #00ff95;
}

.btn-fit:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0, 255, 149, 0.3);
}

/* INFO KARTICE I HOVER */
.info-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 30px;
  padding-bottom: 100px;
}

.info-card {
  background: #0f0f0f;
  padding: 40px;
  border-radius: 12px;
  text-align: center;
  border: 1px solid #1a1a1a;
  transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  position: relative;
  overflow: hidden;
}

.info-card:hover {
  transform: translateY(-15px);
  border-color: #00ff95;
  box-shadow: 0 15px 35px rgba(0, 255, 149, 0.15);
}

/* Animacija linije na dnu kartice */
.info-card::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 0;
  height: 3px;
  background-color: #00ff95;
  transition: width 0.4s ease;
}

.info-card:hover::after {
  width: 100%;
}

.icon-main {
  font-size: 3rem;
  color: #00ff95;
  margin-bottom: 20px;
  transition: transform 0.3s ease;
}

.info-card:hover .icon-main {
  transform: scale(1.2) rotate(5deg);
}

/* ANIMACIJE LETENJA */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(50px);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.fly-in {
  animation: fadeInUp 1.2s ease-out forwards;
}

.card-delay {
  opacity: 0;
  animation: fadeInUp 1s ease-out forwards;
}

/* RESPONZIVNOST */
@media (max-width: 768px) {
  .main-title {
    font-size: 4rem;
    letter-spacing: -2px;
  }

  .subtitle {
    letter-spacing: 5px;
    font-size: 0.9rem;
  }

  .cta-group {
    flex-direction: column;
  }
}
</style>