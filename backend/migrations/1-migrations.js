const Election = artifacts.require('Election');
module.exports = async function(deployer){
    await deployer.deploy(Election);
    const election = await Election.deployed();

    await election.addCandidate("Tinubu", 0);
    await election.addCandidate("Peter Obi", 0);
    await election.vote(0);
    const c1 = await election.getVote(0);

    console.log(c1.toString());
}