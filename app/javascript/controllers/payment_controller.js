import { Controller } from "stimulus";
import dropin from "braintree-web-drop-in";

export default class extends Controller {
  connect() {
    const token = this.element.dataset.token;

    dropin
      .create({
        container: this.element,
        authorization: token,
      })
      .then((instance) => {
        console.log(instance);
      })
      .catch((err) => {
        console.log(err);
      });
  }
}