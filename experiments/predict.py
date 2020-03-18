from __future__ import print_function
from rdkit import Chem

def smi_tokenizer(smi):
    """
    Tokenize a SMILES molecule or reaction
    """
    import re
    pattern =  "(\[[^\]]+]|Br?|Cl?|N|O|S|P|F|I|b|c|n|o|s|p|\(|\)|\.|=|#|-|\+|\\\\|\/|:|~|@|\?|>|\*|\$|\%[0-9]{2}|[0-9])"
    regex = re.compile(pattern)
    tokens = [token for token in regex.findall(smi)]
    assert smi == ''.join(tokens)
    return ' '.join(tokens)

m = Chem.MolToSmiles(Chem.MolFromSmiles('Cc3ccc(c2ccc(CC(=O)Nc1cccn(C)c1=O)c(F)c2)cc3'))
print(smi_tokenizer(m))