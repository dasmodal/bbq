import Lightbox from 'bs5-lightbox'

const options = {
  size: 'lg'
}

document.addEventListener('turbolinks:load', () => {
  document.querySelectorAll('.lightbox').forEach((el) => el.addEventListener('click', (e) => {
    e.preventDefault()
    const lightbox = new Lightbox(el, options)
    lightbox.show()
  }))
})
