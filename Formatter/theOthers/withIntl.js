const withIntl = (x) => {
    const options = { style: 'currency', currency: 'USD' };
    var numberFormat = new Intl.NumberFormat('en-US', options);
    return numberFormat.format(x)
}

module.exports = withIntl