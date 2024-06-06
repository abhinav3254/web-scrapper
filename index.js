const axios = require('axios');
const cheerio = require('cheerio');
const fs = require('fs');

async function scrapeWebsite(url) {
    try {
        const response = await axios.get(url);
        const $ = cheerio.load(response.data);

        // Array to store product information
        const products = [];

        // Loop through each product on the page
        $('.product').each((index, element) => {
            const $product = $(element);

            // Extracting product name
            const productName = $product.find('.jss654').text().trim();

            // Extracting product image URL
            const productImageURL = $product.find('.MuiBox-root.jss658 img').attr('src');

            // Extracting product prices
            const originalPrice = $product.find('.jss695').text().trim();
            const discountedPrice = $product.find('.jss698').text().trim();

            // Extracting product URL
            const productURL = $product.find('.jss648').attr('href');

            // Extracting product badges
            const badges = $product.find('.jss674 .MuiBox-root').map((index, el) => $(el).text().trim()).get();

            // Push product information to products array
            products.push({
                name: productName,
                imageURL: productImageURL,
                originalPrice: originalPrice,
                discountedPrice: discountedPrice,
                URL: productURL,
                badges: badges.join(',')
            });
        });

        // Write product information to CSV file
        const csvData = products.map(product => [
            product.name,
            product.imageURL,
            product.originalPrice,
            product.discountedPrice,
            product.URL,
            product.badges
        ]);

        const csvContent = csvData.map(row => row.join(',')).join('\n');
        fs.writeFileSync('products1.csv', csvContent);

        console.log('Product information written to products.csv');
    } catch (error) {
        console.error('Error fetching data:', error);
    }
}

// Example usage
const websiteUrl = '';
scrapeWebsite(websiteUrl);
