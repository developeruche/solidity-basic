
// @devloperuche: Eccomerce Smart Contract
// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Ecommerce {

    struct Product {
        string name;
        string description;
        address payable seller_addr;
        uint productId;
        uint price;
        address buyer_addr;
        bool delivered;
    }
    uint counter=1;
    Product[] public products;

    // DAPPs events
    event added_product(string name, uint productId, address seller_addr);
    event bought_product(uint productId, address buyer_addr);
    event delivered_product(uint productId);

    function addNewProduct(string memory _name, string memory _description, uint _price) public {
        require(_price > 0, "The Price of product must be greater than zero.");
        // creating the product
        Product memory product_template;
        product_template.name = _name;
        product_template.description = _description;
        product_template.price = _price * 10**18;
        product_template.seller_addr = payable(msg.sender);
        product_template.productId=counter;
        products.push(product_template);
        counter++;
        emit added_product(_name, product_template.productId, msg.sender);
    }

    function buyProduct(uint _productId) payable public {
        require(products[_productId-1].price == msg.value, "Please Enter the correct price");
        require(products[_productId-1].seller_addr!=msg.sender, "Seller of a product cannot buy it own product to avoid loss of money");
        products[_productId].buyer_addr=msg.sender;
        // the money has now been stored in the contract wallet (pending the delivery of the product)

        emit bought_product(_productId, msg.sender);
    }

    function delivery(uint _productId) public {
        require(products[_productId-1].buyer_addr == msg.sender, "You didn't make this purchase");
        products[_productId-1].delivered=true;
        // The costumer just confirmed the product is deliveried (Sending the funds to the Marchant)
        products[_productId-1].seller_addr.transfer(products[_productId-1].price);

        emit delivered_product(_productId);
    }

    function return_all_prooducts() public view returns(Product[] memory) {
        return products;
    }
    
}
