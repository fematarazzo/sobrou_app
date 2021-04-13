import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import { initMapbox } from '../plugins/init_mapbox';
import { loadDynamicBannerText } from '../components/banner';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initChatroomCable } from '../channels/chatroom_channel';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// External imports
import "bootstrap";

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  loadDynamicBannerText();
  initAutocomplete();
  initChatroomCable();
});
