const CURRENCY_DELIMITER = ','
const DECIMAL_DELIMITER = '.'
const PRECISION = 2
const THRESHOLD = 1000
const PAD_LIMIT = 3
/**
 * Formats the provided number and returns a string representation of the number based on the provided options
 * @example
 * // returns -99¢
 * formatter(-.99)
 * @example
 * // returns $1,234,567.00
 * formatter(1234567)
 * @param {number} number - The number to format
 * @param {Object} options - provide currency and change symbols to use. Example: {currency: '$', change: '¢'}
 * @returns {string}
 * @throws logs an error and returns the input, if the input type is not of type {number}
 */
formatter = (number, options = {currency: '$', change: '¢'}) => {
    console.log(`INFO:: Formatting number...`)
    if (typeof number !== 'number') {
        console.log('ERROR::Received input is not a Number.')
        return number
    }
    if (!Number.isSafeInteger(number)) {
        console.log('WARNING: Number exceeds the safe integer value of ± 9007199254740991. Precision of the result will be effected.')
    }
    const { currency, change } = options
    const sign = Math.sign(number) === -1 ? '-' : ''
    // Extracting the cents value and storing it to be concatenated to the final result
    const cents = (number - Math.trunc(number)).toFixed(PRECISION).toString().split(DECIMAL_DELIMITER)[1]
    let dollars = Math.trunc(number)
    if (dollars === 0) {
        return sign + cents + change
    } 
    dollars = format(Math.abs(dollars)).slice(0, -1)  
    console.log(`DEBUG::Formatted ${number} is ${currency + dollars + DECIMAL_DELIMITER + cents}.`) 
    console.log(`INFO::Formatting complete.`) 
    return currency + sign + dollars + DECIMAL_DELIMITER + cents
}

/**
 * Divides the input number by the set THRESHOLD and 
 * then recursively divides the result with the THRESHOLD until the result is 0.
 * When result reaches 0, the remainder of the division operation is returned with the delimiter appended.
 * @param {number} number - The integer part of the original number to format
 * @returns {string} Formatted number
 */
format = (number) => {
    if (number < THRESHOLD)  {
        return number + CURRENCY_DELIMITER
    }
    const quotient = Math.floor(number / THRESHOLD)
    const remainder = number % THRESHOLD
    //The remainder should always be of 3 digits so we are explicitly padding it with zeros. 
    //For example: Dividing 1003 by 1000 will give us 3 as remainder but we need 003 for our formatting
    let res = format(quotient).concat(remainder.toString().padStart(PAD_LIMIT, '0')).concat(CURRENCY_DELIMITER)
    return res
}

module.exports = formatter