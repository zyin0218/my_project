// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus";
import Rails from "@rails/ujs";

// import ax from "http/clients";

export default class extends Controller {
  static targets = ["likeBtn", "unlikeBtn"]

  // static targets = [ "output" ]
  connect() {
    const favorited = this.element.dataset.favorited;
    if (favorited === "true") {
      this.likeBtnTarget.classList.add("hidden");
      this.unlikeBtnTarget.classList.remove("hidden");
    } else {
      this.likeBtnTarget.classList.remove("hidden");
      this.unlikeBtnTarget.classList.add("hidden");
    }
  }
  unlike(){
    // products/2/like
    const id = this.element.dataset.id;

    Rails.ajax({
      url: `/products/${id}/unlike`,
      type: "DELETE",
      success: ({status}) => {
        if (status === "removed") {
          this.likeBtnTarget.classList.remove("hidden");
          this.unlikeBtnTarget.classList.add("hidden");
        }
      },
      error: (err) => {
        console.log(err);
      }
    })
  }

  like(){
    // products/2/like
    const id = this.element.dataset.id;

    Rails.ajax({
      url: `/products/${id}/like`,
      type: "POST",
      success: ({status}) => {
        if (status === "added") {
          this.likeBtnTarget.classList.add("hidden");
          this.unlikeBtnTarget.classList.remove("hidden");
        }
      },
      error: (err) => {
        console.log(err);
      }
    })



    //use axios
    // ax.post( `/products/${id}/like`)
    //   .then((resp) => {
    //     console.log(resp);
    //   })
    //   .catch((err) => {
    //     console.log(err);
    //   });
  }
}
