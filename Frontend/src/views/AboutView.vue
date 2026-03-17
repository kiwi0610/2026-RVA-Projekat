<script setup lang="ts">

</script>

<template>
  <div class="about-wrapper">
    <section class="about-hero fly-in">
      <h1 class="display-3 fw-bold">KO SMO <span class="text-success glow-text">MI?</span></h1>
      <div class="header-line"></div>
    </section>

    <div class="container py-5">
      <div class="row align-items-center mb-5">
        <div class="col-md-6 card-delay" style="animation-delay: 0.3s">
          <h2 class="text-success mb-3 text-uppercase">Naša Misija</h2>
          <p class="lead text-secondary">
            U **FIT PRO** svetu, mi ne prodajemo samo suplemente. Mi prodajemo gorivo za tvoje ambicije.
            Naš cilj je da svakom sportisti, od početnika do profesionalca, omogućimo pristup
            najkvalitetnijim sastojcima na tržištu.
          </p>
        </div>
        <div class="col-md-6 card-delay text-center" style="animation-delay: 0.5s">
          <div class="about-image-placeholder">
            <img src="/fitnes.jpg" alt="Fit Pro" class="img-fluid rounded">
          </div>
        </div>
      </div>

      <div class="row text-center mt-5">
        <div class="col-md-4 card-delay" style="animation-delay: 0.7s">
          <div class="value-box">
            <i class="fa-solid fa-check-double text-success fs-1 mb-3"></i>
            <h4>KVALITET</h4>
            <p class="text-secondary small">Samo provereni brendovi sa laboratorijskim sertifikatima.</p>
          </div>
        </div>
        <div class="col-md-4 card-delay" style="animation-delay: 0.9s">
          <div class="value-box active-box">
            <i class="fa-solid fa-users text-success fs-1 mb-3"></i>
            <h4>ZAJEDNICA</h4>
            <p class="text-secondary small">Više od 5000 zadovoljnih korisnika širom regiona.</p>
          </div>
        </div>
        <div class="col-md-4 card-delay" style="animation-delay: 1.1s">
          <div class="value-box">
            <i class="fa-solid fa-handshake-angle text-success fs-1 mb-3"></i>
            <h4>PODRŠKA</h4>
            <p class="text-secondary small">Naš tim stručnjaka je tu da ti pomogne pri odabiru.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.about-wrapper {
  background-color: #050505;
  min-height: 100vh;
  color: white;
  padding-top: 80px;
  /* Razmak zbog navbara */
}

.about-hero {
  text-align: center;
  padding: 60px 0;
}

.header-line {
  width: 80px;
  height: 4px;
  background-color: #00ff95;
  margin: 20px auto;
}

.glow-text {
  text-shadow: 0 0 20px rgba(0, 255, 149, 0.5);
}

.about-image-placeholder {
  border: 1px solid #1a1a1a;
  padding: 80px;
  border-radius: 20px;
  background: radial-gradient(circle, rgba(0, 255, 149, 0.05) 0%, transparent 70%);
}

/* Stilovi za kutije sa vrednostima */
.value-box {
  background: #0f0f0f;
  padding: 30px;
  border-radius: 15px;
  border: 1px solid #00ff95 !important;
  transition: 0.3s ease;
  height: 100%;
}

.value-box:hover {
  border-color: #00ff95;
  transform: translateY(-10px);
  box-shadow: 0 10px 30px rgba(0, 255, 149, 0.1);
}

.active-box {
  border-color: rgba(0, 255, 149, 0.3);
}

/* ANIMACIJE (iste kao na Home) */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.fly-in {
  animation: fadeInUp 1s ease-out forwards;
}

.card-delay {
  opacity: 0;
  animation: fadeInUp 0.8s ease-out forwards;
}
</style>