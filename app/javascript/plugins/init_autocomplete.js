import places from 'places.js';

// Autocomplete for search
const initAutocomplete = () => {
  const addressInput = document.getElementById('busca');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
