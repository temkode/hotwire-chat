import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.scrollToBottom()
        this.highlightUsernames()
    }

    scrollToBottom() {
        this.element.scrollTop = this.element.scrollHeight
    }

    highlightUsernames() {
        const current_username = document.getElementById('current_username').textContent
        const authors = this.element.querySelectorAll('#yapper');

        authors.forEach(authorElement => {
            const author_name = authorElement.textContent.replace(':', '')

            if (author_name === current_username) {
                authorElement.classList.add('text-red-600')
            }
        })
    }
}
