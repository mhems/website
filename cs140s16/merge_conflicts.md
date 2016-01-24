# Handling merge conflicts
### When one hand is not talking to the other, there can only be one

Be proactive. If you're working from multiple locales, `git pull` at
the start of each session to merge in possible changes. If you have a
merge conflict, read on.

---

In a distributed workflow where there are multiple developers/locales,
there is a chance your local changes divert from the remote version.
Even if there are differences between the files, git can merge them if
the differences are in different places.  If the differences happen in
the same location, git does not know which one is correct and cannot
automatically merge them.  This requires manual intervention - you
must pick which one is 'right'. This is an annoying part of any
version control software but it is better than git making silent
assumptions.

### A scenario:

You're working in the lab. You make a file, *foo.txt*, with the contents

```
Hello, I like apples
```

You then submit your files to gitlab.

Later, at home, you'd like to make some changes. You get your files
    with `git clone`. You're feeling tropical so you change the file
    to

```
Hello, I like pineapples
```

and push to gitlab.

Back in lab, its snowy on campus, so you change *foo.txt* to

```
Burr
```

After adding and committing, `git push` will fail, telling you your
push was rejected because '*the remote* (gitlab) *contains work that
you do not have locally*. Gitlab thinks you like pineapples but your
lab machine knows you're cold. Who's to say?

---

### The solution:

If you look at the error message, git suggests you `git pull` to sync
    your changes. Do just that - `git pull URL master`

git now tries to merge these two facts. Since the changes deal with
the same line in the same file, there is a **merge conflict**.

git will tell you that the merge could not complete because of a
conflict in *foo.txt*. Upon opening the file, you see something like
this

```
<<<<<<< HEAD
Hello, I like pineapples
=======
Burr
>>>>>>> 4efdfa7f0134dfa...
```

Keep the contents that you want, and delete what you don't want,
including the markup.

Then add, commit, and push to fully resolve the conflict.

There is another way to handle the conflict. If you trust that your
local changes are correct and complete without the remote changes, you
can *force push* your changes. This tells git that, when in doubt,
pick these local changes. This is a potentially dangerous act that is
typically discouraged. Your gitlab projects prevent you from doing
this. If you are unable to resolve the conflict as outlined above,
email me. Include the project that is giving you trouble. I will email
you back once I've given you the ability. You can then

```bash
git push --force URL master
```

---

### To summarize:

The key reason why the push didn't go through was that our lab
repository made changes without having the changes that were pushed to
gitlab. To solve this, we `git pull`ed to try and synchronize.

The key reason we had a merge conflict was the changes where in the
same location. To solve this, we manually edited the file to have only
what we wanted.
