class MerkleTree {

    constructor(leaves, concat) {
        this.leaves = leaves;
        this.concat = concat;
    }

    getRoot(layer = this.leaves) {
        if (layer.length == 1) return layer[0];
        if (layer.length == 2) return this.concat(layer[0], layer[1]);

        const newLayer = [];

        for (let i = 0; i < layer.length; i += 2) {
            let left = layer[i];
            let right = layer[i + 1];

            if (right) {
                newLayer.push(this.concat(left, right));

            } else {
                newLayer.push(left);
            }
        }

        return this.getRoot(newLayer);
    }

    getProof(index, layer = this.leaves, proof = []) {
        if (layer.length === 1) return proof;

        const newLayer = [];

        for (let i = 0; i < layer.length; i += 2) {
            let left = layer[i];
            let right = layer[i + 1];

            if (!right) {
                newLayer.push(left);

            } else {
                newLayer.push(this.concat(left, right));

                if (i === index || i === index - 1) {
                    let isLeft = !(index % 2);

                    proof.push({
                        data: isLeft ? right : left,
                        left: !isLeft
                    });
                }
            }
        }

        return this.getProof(Math.floor(index / 2), newLayer, proof);
    }
}

module.exports = MerkleTree;
