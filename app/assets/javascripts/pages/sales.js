Dropzone.autoDiscover = false
datatransfer = new DataTransfer

$(document).ready(function () {
  var dropzone = new Dropzone('#sales-dropzone', {
    addRemoveLinks: true,
    acceptedFiles: '.png,.jpg,.jpeg',
    url: '/file/post',
    autoProcessQueue: false,
    uploadMultiple: true,
    parallelUploads: 5,
    maxFilesize: 5,
    filesizeBase: 1000,
  })

  dropzone.on('removedfile', function() {
    datatransfer.items.remove(datatransfer.items.length - 1)
  })

  dropzone.on('addedfile', function(file) {
    datatransfer.items.add(file)
    if (validImageType(file) && validItemsLength()) {
      addFile(file)
    } else {
      dropzone.removeFile(file)
    }
  })

  function validImageType(file) {
    return (file.type === 'image/jpeg' || file.type === 'image/png')
  }

  function validItemsLength() {
    return (datatransfer.items.length < 6)
  }

  function addFile() {
    $('.info-dragdrop')[0].classList.add('d-none')
    $('#fileMultipleItems')[0].files = datatransfer.files
  }

  $('#new_sale').submit(function(e) {
    if (datatransfer.items.length === 0){
      e.preventDefault()
      $(window).scrollTop(0)
      $('#image-error').text('Por favor suba una foto.')
      return false
    }
  })
})
