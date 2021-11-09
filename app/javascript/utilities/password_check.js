document.addEventListener('turbolinks:load', function () {
    let passwordInputAll = document.querySelectorAll('.password_check')

    passwordInputAll.forEach(element => {
        element.addEventListener('input', event => {
            let password = document.querySelector('#user_password').value
            let confirmation = document.querySelector('#user_password_confirmation').value

            if (confirmation.length == 0) {
                return passwordInputAll.forEach(element => {
                    element.classList.remove('valid')
                    element.classList.remove('invalid')
                })
            }

            if (password != confirmation) {
                return passwordInputAll.forEach(element => {
                    element.classList.add('invalid')
                    element.classList.remove('valid')
                })

            } else {
                passwordInputAll.forEach(element => {
                    element.classList.add('valid')
                    element.classList.remove('invalid')
                })
            }
        })
    })
})