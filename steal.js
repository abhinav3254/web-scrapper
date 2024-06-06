const cheerio = require('cheerio');
const fs = require('fs');

// Read HTML content from file
const html = fs.readFileSync('output.html', 'utf8');

const $ = cheerio.load(html);

// Prepare CSV data
const csvData = [
    ['Product Name', 'Product Image URL']
];

// Iterate over each product
$('.MuiGrid-root.jss1750').each((index, element) => {
    const product = {};

    // Extract product name
    product.name = $(element).find('.jss1759').text().trim();

    // Extract product image URL
    product.imageURL = $(element).find('img').attr('src');

    // Add product to CSV data
    csvData.push([product.name, product.imageURL]);
});

// Convert CSV data to string
const csvContent = csvData.map(row => row.join(',')).join('\n');

// Write CSV file
fs.writeFileSync('product.csv', csvContent);

console.log('Product information written to product_info.csv');
