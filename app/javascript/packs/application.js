/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
window.jQuery = window.$ = require('jquery');

import "bootstrap";
import { addEventListenersToExpoTabs } from '../components/expo-tabs.js';
addEventListenersToExpoTabs();


import '../components/sidebar';

import { addEventListenersToExhibitorTabs } from '../components/exhibitor-tabs.js';
addEventListenersToExhibitorTabs();

import "actiontext";
import "../../../node_modules/trix/dist/trix.css"

import { magicButton } from '../components/floating-action-button.js';
magicButton();
// import "../../../node_modules/masonry-layout/masonry.js"
import { flashMessageEmail } from '../components/_flash_message_email.js';
flashMessageEmail();

import { infoModalShow } from '../components/desktop_info_model.js';
infoModalShow();

import { addEventListenerToWindowResize } from '../components/desktop_info_model.js';
addEventListenerToWindowResize();
