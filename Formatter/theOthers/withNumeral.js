const numeral = require('numeral')
const withNumeral = (x) => {
    return numeral(x).format('$0,0.00')
}

module.exports = withNumeral