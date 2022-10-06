import Web3 from "web3"
const web3 = new Web3(Web3.givenProvider)

const abi = [
  {
    constant: false,
    inputs: [
      {
        name: "_spender",
        type: "address",
      },
      {
        name: "_value",
        type: "uint256",
      },
    ],
    name: "approve",
    outputs: [
      {
        name: "",
        type: "bool",
      },
    ],
    payable: false,
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    constant: false,
    inputs: [
      {
        name: "_from",
        type: "address",
      },
      {
        name: "_to",
        type: "address",
      },
      {
        name: "_value",
        type: "uint256",
      },
    ],
    name: "transferFrom",
    outputs: [
      {
        name: "",
        type: "bool",
      },
    ],
    payable: false,
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    constant: true,
    inputs: [],
    name: "INITIAL_SUPPLY",
    outputs: [
      {
        name: "",
        type: "uint256",
      },
    ],
    payable: false,
    stateMutability: "view",
    type: "function",
  },
]

const tokenContract = 0xc5d95dabf5ed71f64713e5377d1fd281414d9514

const spender = 0xeb21122fccbb336d7fa4627270abdaf556afec78

const contract = new web3.eth.Contract(abi, tokenContract)
const account = new web3.eth.accounts()[0]

async function test() {
  try {
    await contract.methods.approve(spender, 300).send({
      from: account.address,
    })
  } catch (err) {
    console.log("error here", err)
  }
}
test()
