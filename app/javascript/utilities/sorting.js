document.addEventListener('turbolinks:load', function() {
    let control = document.querySelector('.sort-by-title')

    if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
    let tbody = document.querySelector('tbody')

    // NodeList
    // https://developer.mozilla.org/en-US/docs/Web/API/NodeList
    let rows = tbody.querySelectorAll('tr')
    let sortedRows = []

    // select all table rows except the first one which is th header
    for (let i = 1; i < rows.length; i++) {
        sortedRows.push(rows[i])
    }

    // <=>
    if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
        sortedRows.sort(compareRowsAsc)
        this.querySelector('.octicon-arrow-up').classList.remove('hide')
        this.querySelector('.octicon-arrow-down').classList.add('hide')
    } else {
        sortedRows.sort(compareRowsDesc)
        this.querySelector('.octicon-arrow-down').classList.remove('hide')
        this.querySelector('.octicon-arrow-up').classList.add('hide')
    }

    let sortedTbody = document.createElement('tbody')
    sortedTbody.appendChild(rows[0])

    for (let i = 0; i < sortedRows.length; i++) {
        sortedTbody.appendChild(sortedRows[i])
    }

    tbody.parentNode.replaceChild(sortedTbody, tbody)
}

function compareRowsAsc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return -1}
    if (testTitle1 > testTitle2) { return 1 }
    return 0
}

function compareRowsDesc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return 1}
    if (testTitle1 > testTitle2) { return -1 }
    return 0
}