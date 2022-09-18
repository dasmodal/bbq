import Lightbox from 'bs5-lightbox'

const options = {
  size: 'xl'
}

document.addEventListener('turbolinks:load', () => {
  document.querySelectorAll('.lightbox').forEach((el) => el.addEventListener('click', (e) => {
    e.preventDefault()
    const lightbox = new Lightbox(el, options)
    lightbox.show()
  }))
})
