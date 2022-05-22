import axios from "axios";

const ax = axios.create();
const token = document.querySelector("meta[name='csrf-token']").content;
ax.defaults.headers.common["X-CSRF-TOKEN"] = token;

export default ax;