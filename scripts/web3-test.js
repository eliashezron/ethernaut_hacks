import Web3 from 'web3'
const web3 = new Web3(Web3.givenProvider)

// web3.eth.getStorageAt("0xDABA5cb0CFc16baF2af3792D79ABb11293f1f7a7", 1)
// .then(console.log)

// web3.eth.getStorageAt("0x60779577cF3E3D5373aAa2A3B25BCbf5a00673c0", 5)
// .then(console.log)
//  const x = "0x1adcb2e08a0da9d868602bfff36341ae84b36d17907b2bd3b51420f3600dcbb5"

// console.log(x.slice(0, 34))

const abi = [{
        "constant": false,
        "inputs": [
            {
                "name": "_spender",
                "type": "address"
            },
            {
                "name": "_value",
                "type": "uint256"
            }
        ],
        "name": "approve",
        "outputs": [
            {
                "name": "",
                "type": "bool"
            }
        ],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },{
        "constant": false,
        "inputs": [
            {
                "name": "_from",
                "type": "address"
            },
            {
                "name": "_to",
                "type": "address"
            },
            {
                "name": "_value",
                "type": "uint256"
            }
        ],
        "name": "transferFrom",
        "outputs": [
            {
                "name": "",
                "type": "bool"
            }
        ],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
        {
        "constant": true,
        "inputs": [],
        "name": "INITIAL_SUPPLY",
        "outputs": [
            {
                "name": "",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },]

const tokenContract = 0x5A0E9B3e4754b51A2f2F6D4407BD330aBa792496

const spender = 0xceA707280e428AD529053623093Ec9B83eDA84b4

const contract = new web3.eth.Contract(abi, tokenContract)
const account = new web3.eth.accounts()[6]


async function test(){
    try{
    const initial_supply = await contract.methods.INITIALSUPPLY()
    const approve = await contract.methods.approve(spender, initial_supply).send({
        from: account
    })
    if(approve){
        await contract.methods.transferFrom(spender,account,initial_supply ).send({
            from: account
    })
    }
    }catch(err){
        console.log("error here",err)
    }
}
test()
