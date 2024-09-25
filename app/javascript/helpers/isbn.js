export function convertIsbn(isbn, format) {
    // Remove any hyphens or spaces
    isbn = isbn.replace(/[-\s]/g, '');

    // Check if the ISBN is valid
    const isValidIsbn10 = (isbn) => {
        if (isbn.length !== 10) return false;
        let sum = 0;
        for (let i = 0; i < 9; i++) {
            sum += (10 - i) * parseInt(isbn[i], 10);
        }
        const checkDigit = (11 - (sum % 11)) % 11;
        return (checkDigit === 10 ? 'X' : checkDigit.toString()) === isbn[9].toUpperCase();
    };

    const isValidIsbn13 = (isbn) => {
        if (isbn.length !== 13) return false;
        let sum = 0;
        for (let i = 0; i < 12; i++) {
            const weight = i % 2 === 0 ? 1 : 3;
            sum += weight * parseInt(isbn[i], 10);
        }
        const checkDigit = (10 - (sum % 10)) % 10;
        return checkDigit.toString() === isbn[12];
    };

    // Function to add hyphens to ISBN-10
    const hyphenateIsbn10 = (isbn) => {
        return `${isbn.slice(0, 1)}-${isbn.slice(1, 4)}-${isbn.slice(4, 9)}-${isbn.slice(9)}`;
    };

    // Function to add hyphens to ISBN-13
    const hyphenateIsbn13 = (isbn) => {
        // Adjusting the hyphen placement according to your requirement
        return `${isbn.slice(0, 3)}-${isbn.slice(3, 4)}-${isbn.slice(4, 10)}-${isbn.slice(10, 12)}-${isbn.slice(12)}`;
    };

    let result;

    // Check format and validate
    if (format === 'ISBN-10' && isValidIsbn10(isbn)) {
        result = isbn; // Already valid ISBN-10
    } else if (format === 'ISBN-13' && isValidIsbn13(isbn)) {
        result = isbn; // Already valid ISBN-13
    } else if (isbn.length === 13 && isbn.startsWith('978')) {
        // Convert ISBN-13 to ISBN-10
        let sum = 0;
        for (let i = 3; i < 12; i++) {
            sum += (10 - (i - 3)) * parseInt(isbn[i], 10);
        }
        const checkDigit = (11 - (sum % 11)) % 11;
        result = isbn.slice(3, 12) + (checkDigit === 10 ? 'X' : checkDigit.toString());
    } else if (isbn.length === 10) {
        // Convert ISBN-10 to ISBN-13
        const prefix = '978';
        let sum = 0;
        for (let i = 0; i < 12; i++) {
            const digit = i < 3 ? prefix[i] : isbn[i - 3];
            sum += (i % 2 === 0 ? 1 : 3) * parseInt(digit, 10);
        }
        const checkDigit = (10 - (sum % 10)) % 10;
        result = prefix + isbn.slice(0, 9) + checkDigit;
    } else {
        throw new Error('Invalid ISBN format');
    }

    // Add hyphens to the result
    return result.length === 10 ? hyphenateIsbn10(result) : hyphenateIsbn13(result);
}
