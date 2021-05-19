library trie;

class Trie {
  TrieNode root = new TrieNode.root();

  Map<dynamic, dynamic> dialpad = {
    " ": "0",
    "a": "2",
    "b": "2",
    "c": "2",
    "d": "3",
    "e": "3",
    "f": "3",
    "g": "4",
    "h": "4",
    "i": "4",
    "j": "5",
    "k": "5",
    "l": "5",
    "m": "6",
    "n": "6",
    "o": "6",
    "p": "7",
    "q": "7",
    "r": "7",
    "s": "7",
    "t": "8",
    "u": "8",
    "v": "8",
    "w": "9",
    "x": "9",
    "y": "9",
    "z": "9",
    "0": "0",
    "1": "1",
    "2": "2",
    "3": "3",
    "4": "4",
    "5": "5",
    "6": "6",
    "7": "7",
    "8": "8",
    "9": "9"
  };

  void insert(String word) {
    TrieNode curr = root;
    String lower = word.toLowerCase();
    for (int i = 0; i < word.length; i++) {
      String num = lower[i];
      int k = int.parse(dialpad[num]);
      if (curr.childs[k] == null) curr.childs[k] = new TrieNode();
      curr = curr.childs[k];
      curr.possible.add(word);
    }
  }

  List<String> search(String word) {
    List<String> na = ["NO MATCHES FOUND"];
    dynamic curr = root;
    for (int i = 0; i < word.length; i++) {
      int k = int.parse(word[i]);
      curr = curr.childs[k];
      if (curr == null) return na;
    }
    return curr.possible;
  }
}

class TrieNode {
  List<String> possible = [];
  List<dynamic> childs = List<dynamic>.filled(10, null);

  TrieNode.root();
  TrieNode();
}

// void main() {
//   Trie t = new Trie();
//   String num = "1";
//   List<String> users = ['God', 'Allah', 'Papa'];
//   for(int i=0;i<users.length;i++){
//     t.insert(users[i]);
//   }
//   List<String> res = t.search(num);
//   for(int i=0;i<res.length;i++){
//     print(res[i]);
//   }
//  }
