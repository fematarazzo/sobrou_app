import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Mude seu consumo", "Mude o mundo", "Descubra o Sobrou"],
    smartBackspace: true,
    typeSpeed: 50,
    backSpeed: 50
  });
}

export { loadDynamicBannerText };
