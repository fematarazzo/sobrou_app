import Typed from 'typed.js';

// Typed JS that's being display on banner @root
const loadDynamicBannerText = () => {
  if (document.getElementById("banner-typed-text")){
    new Typed('#banner-typed-text', {
      strings: ["Mude seu consumo", "Mude o mundo", "Descubra o Sobrou"],
      smartBackspace: true,
      typeSpeed: 50,
      backSpeed: 50,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
