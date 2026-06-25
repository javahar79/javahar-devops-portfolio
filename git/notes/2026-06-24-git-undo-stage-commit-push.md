# Git undo, stage, commit, and push — what I learned from the tutorial

I followed the Git basic workflow tutorial and here's what I figured out about staging, committing, pushing, and undoing stuff when things go sideways.

## What I did

1. **Staging** — `git add` moves changes from my working directory into the staging area. I practiced `git add <file>` for specific files and `git add .` for everything.
2. **Committing** — `git commit -m "message"` saves the staged snapshot. I learned to write meaningful messages, not just "fix stuff".
3. **Pushing** — `git push origin <branch>` sends my commits to the remote. First time I forgot to set upstream and got prompted — `git push -u origin main` fixed it.
4. **Undoing** — This is where it got interesting.

## Got stuck on

**Unstaging a file I didn't mean to add.** I ran `git add .` and realized I'd picked up a temp file. Tried `git reset HEAD <file>` but got confused because `reset` sounds destructive. Turns out `git restore --staged <file>` is the more intuitive way — it un-stages without touching the working copy.

**Amending a commit message.** Typo in my commit message. Found `git commit --amend -m "correct message"` but it opens an editor by default. Adding `--no-edit` keeps the message as-is if I just want to add a missed file.

**Undoing a commit I pushed.** That's the scary one. `git revert <hash>` creates a new commit that reverses the old one — safe for shared branches. `git reset` is for local-only. I tested both on a throwaway branch to see the difference.

## What I'd try next

Next I want to try `git stash` for saving work-in-progress without committing, and `git cherry-pick` for pulling specific commits between branches. Also want to practice interactive rebase (`git rebase -i`) for squashing messy commit history before pushing.
