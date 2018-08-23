const formatter = require('./withToLocaleString')

test('5.20 => "$50.13"', () => {
    expect(formatter(5.2)).toBe('$5.2')
})

test('5.20 => "$50.13"', () => {
    expect(formatter(5.2)).toBe('$5.2')
})

test('5.20 => "$50.13"', () => {
    expect(formatter(5.2)).toBe('$5.2')
})

test('5.20 => "$50.13"', () => {
    expect(formatter(5.2)).toBe('$5.2')
})

test('5.20 => "$50.13"', () => {
    expect(formatter(5.2)).toBe('$5.2')
})
test('5.20 => "$50.13"', () => {
    expect(formatter(5.2)).toBe('$5.2')
})

test('5.20 => "$50.13"', () => {
    expect(formatter(5.2)).toBe('$5.2')
})

test('5.20 => "$50.13"', () => {
    expect(formatter(5.2)).toBe('$5.2')
})

test('5.20 => "$50.13"', () => {
    expect(formatter(5.2)).toBe('$5.2')
})

test('5.20 => "$50.13"', () => {
    expect(formatter(5.2)).toBe('$5.2')
})

test('5.20 => "$50.13"', () => {
    expect(formatter(5.2)).toBe('$5.2')
})

test('50.126 => $50.126', () => {
    expect(formatter(50.126)).toBe('$50.126')
})

test('500 => "$500"', () => {
    expect(formatter(500)).toBe('$500')
})

test('1234 => "$1,234"', () => {
    expect(formatter(1234)).toBe('$1,234')
})

test('1003 => "$1,003"', () => {
    expect(formatter(1003)).toBe('$1,003')
})

test('12345 => "$12,345"', () => {
    expect(formatter(12345)).toBe('$12,345')
})

test('123456 => "$123,456"', () => {
    expect(formatter(123456)).toBe('$123,456')
})

test('1234567 => "$1,234,567"', () => {
    expect(formatter(1234567)).toBe('$1,234,567')
})

test('12345678 => "$12,345,678"', () => {
    expect(formatter(12345678)).toBe('$12,345,678')
})

test('50000 => "$5,000"', () => {
    expect(formatter(5000)).toBe('$5,000')
})

test('50000 => "$50,000"', () => {
    expect(formatter(50000)).toBe('$50,000')
})

test('500000 => "$500,000"', () => {
    expect(formatter(500000)).toBe('$500,000')
})

test('5000000 => "$5,000,000"', () => {
    expect(formatter(5000000)).toBe('$5,000,000')
})

test('50000000 => "50,000,000"', () => {
    expect(formatter(50000000)).toBe('$50,000,000')
})

test('500000000 => "$500,000,000"', () => {
    expect(formatter(500000000)).toBe('$500,000,000')
})

test('5000000000 => "$5,000,000,000"', () => {
    expect(formatter(5000000000)).toBe('$5,000,000,000')
})

test('50000000000 => "$50,000,000,000"', () => {
    expect(formatter(50000000000)).toBe('$50,000,000,000')
})

test('500000000000000 => "$500,000,000,000,000"', () => {
    expect(formatter(500000000000000)).toBe('$500,000,000,000,000')
})

test('50000000000000000 => "$50,000,000,000,000,000"', () => {
    expect(formatter(50000000000000000)).toBe('$50,000,000,000,000,000')
})

test('9007199254740991 => "$9,007,199,254,740,991"', () => {
    expect(formatter(9007199254740991)).toBe('$9,007,199,254,740,991')
})