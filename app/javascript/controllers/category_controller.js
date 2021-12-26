import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "main_category", "childs" ]

    //DESPLIEGUE DE CATEGORÍAS HIJAS
    open_subcategories() {
        this.childsTarget.classList.toggle("category_childs_block");
    }
}