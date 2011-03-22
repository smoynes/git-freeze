git-freeze
==========

git-freeze is a git extension that archives and restores branches.

When a branch is archived, it is moved to a new ref-namespace,
``refs/freezer``, and so doesn't appear in the list of branches. This
is useful when some of your branches are decided to be dead ends or
experimental and no longer needed, but you may want to restore or
review them at a later date.

Usage
-----

To archive a branch:

    $ git freeze BRANCH_NAME
    Freezing branch: BRANCH_NAME

The branch reference is copied to ``refs/freezer/BRANCH_NAME`` and
then the branch is deleted.

To list frozen branches:

    $ git freeze --list
    BRANCH_NAME (0d1e2a3d)
    ANOTHER_BRANCH_NAME (4b5e6e7f)

To restore a branch:

    $ git freeze --thaw FROZEN_BRANCH_NAME
    Thawing branch: FROZEN_BRANCH_NAME

The branch reference is copied from ``refs/freezer/BRANCH_NAME`` and
the frozen branch is deleted.

Frozen branches can also be pushed to a remote:

    $ git freeze --push REMOTE_NAME FROZEN_BRANCH_NAME
    Total 0 (delta 0), reused 0 (delta 0)
    To REMOTE_URL
     * [new branch]      refs/freezer/FROZEN_BRANCH_NAME -> refs/freezer/FROZEN_BRANCH_NAME

If ``REMOTE_NAME`` is not provided, it is defaulted to ``origin``.

To list frozen branches on a remote:

    $ git freeze --list --remote REMOTE_NAME
    From REMOTE_URL
    BRANCH_NAME (f001f00d))

To fetch a frozen branch from a remote:

    $ git freeze --fetch REMOTE_NAME FROZEN_BRANCH_NAME
    Fetching frozen branches
    From REMOTE_URL
     * [new branch]      refs/freezer/t2 -> refs/freezer/t2

To fetch all frozen branches from ``origin``:

    $ git freeze --fetch
    From REMOTE_URL
     * [new branch]      refs/freezer/FROZEN_BRANCH -> refs/freezer/FROZEN_BRANCH
     * [new branch]      refs/freezer/ANOTHER_FROZEN_BRANCH -> refs/freezer/ANOTHER_FROZEN_BRANCH

To delete a frozen branch from a remote:

    $ git freeze --push --delete REMOTE_NAME FROZEN_BRANCH_NAME
    To file:///Users/scott.moynes/Code/src/tests/test-remote/
     - [deleted]         refs/freezer/t2

Author
------

Scott Moynes <scott.moynes@gmail.com>
Twitter: @smoynes

License
-------

MIT License. See LICENSE for terms.
