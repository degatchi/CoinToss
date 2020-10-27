var web3 = new Web3(Web3.givenProvider);

$(document).ready(function() {
    window.ethereum.enable();

    $("#add_data_button").click(inputData)

});

function inputData() {
    var bet = $("#bet_input").val();

    var config = {
        value: web3.utils.toWei("1", "ether")
    }

    contractInsance.methods.setBet(_setBet).send(config)
    .on("transactionHash", function(has){
        console.log(hash);
    })
    .on("confirmation", function(confirmationNr){
        console.log(confirmationNr);
    })
    .on("receipt", function(receipt){
        console.log(receipt);
    })
}
