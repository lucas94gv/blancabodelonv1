//CONTROLADOR PARA GESTIONAR EL EFECTO DE ARRASTRE Y ORDEN DE CATEGORIAS

import { Controller } from "stimulus"
import Sortable from "sortablejs"
import Rails from "@rails/ujs"

export default class extends Controller {

    connect() {
        this.sortable = Sortable.create(this.element, {
            handle: '.handle', // handle's class
            animation: 150,
            onEnd: this.end.bind(this)
        })
    }

    end(event) {
        let id = event.item.dataset.id
        let data = new FormData()
        data.append("position", event.newIndex + 1)

        Rails.ajax({
            url: this.data.get("url").replace(":id", id),
            type: 'PATCH',
            data: data
        })

    }
}