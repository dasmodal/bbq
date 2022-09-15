import AirDatepicker from 'air-datepicker'

document.addEventListener('turbolinks:load', () => {
  new AirDatepicker('#dp', {
    timepicker: true,
    position: 'right center',
    minutesStep: 5
  })
})
