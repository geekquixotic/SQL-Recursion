# SQL Recursion

I am working with one of my Jamf clients to clean up their database before we migrate servers. The big challenge is groups.

Groups can either be "static" or "smart" as designated in my CSV and database by the "isSmart" field. 

Among the various _Smart Group_ criteria available is whether or not a device is a menmber of another group. Those groups can, in turn, be another _Smart Group_.

Just a cursory glance of the data suggests that there are places where this gets deeper than one or two layers. I'm trying to create a query that will recursively create a map that shows these relationships;.

Output I want:
```txt
123 - 455
390 - 227 - 551
958 - 219 - 267 - 111
```

I can then pull then names (hashed here for privacy) from the IDs. 

I found a [stack exchange](https://dba.stackexchange.com/questions/301903/recursive-query-on-a-self-referential-table-where-each-node-has-one-link-to-its) query that seemed to be close to what I wanted. The answer I liked provided [another link](https://dbfiddle.uk/KsuhsD1Q) that included a working execution.

From that, I created the code in ``wip.sh`` but I'm not getting the results I expect. Using my desired output as a guide, I expected this code to provide something like:

```
123|455
390|227
227|551
958|219
219|267
267|111
```

But I'm not even getting that. 

I swear I've done something like this before and without recursion, but can't find any code in my notes to do so. Elsewhere in that thread it is suggested that one issue I may have is that my current schema is parent->child and that flipping that would be better.

Feel free to push any changes/notes you have and thanks in advance for your help.