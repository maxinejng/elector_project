const _deploy_contract = require("../migrations/2_deploy_contract");

var Election = artifacts.require("./Election.sol");

_deploy_contract("Election", function(accounts) {

});