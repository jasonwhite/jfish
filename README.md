# jfish

This is a simple bookmarking command for [fish](http://fishshell.com) (the
Friendly Interactive Shell). It saves the trouble of having to `cd` to
frequently visited directories. Tab-completion of the bookmark name is
supported.

## Usage

Just `cd` to the desired directory and add it as a bookmark:

```bash
$ cd a/far/away/directory/
$ j add mybookmark
```

You can jump to it later with:

```bash
$ j to mybookmark
```

Bookmark names work with tab-completion. Typing part of the name and pressing
`<tab>` will complete it:

```bash
$ j to myb<tab>
```

You can also list all the bookmarks that have been set:

```bash
$ j list
mybookmark
```

Bookmarks can be renamed as well:

```bash
$ j list
mybookmark
$ j rename mybookmark mybookmark2
$ j list
mybookmark2
```

If you decide you don't want that bookmark anymore, you can remove it with:

```bash
$ j remove mybookmark2
```

## List of Subcommands

 * `j add <bookmark>`

    Adds the current working directory as a bookmark with the name `<bookmark>`.

 * `j to <bookmark>`

    Changes the directory to the one represented by`<bookmark>`.

 * `j remove <bookmark>` or `j rm <bookmark>`

    Removes the bookmark with the name `<bookmark>`.

 * `j list` or `j ls`

    Lists all bookmarks.

 * `j rename <src> <dest>` or `j mv <src> <dest>`

    Renames the bookmark `<src>` to `<dest>`.

## Installation

### Automatic

Run the `install` script to install:

```bash
$ ./install
```

### Manual

```bash
cp -r functions/ completions/ ~/.config/fish/
```

## Uninstallation

```bash
rm ~/.config/fish/functions/j.fish
rm ~/.config/fish/completions/j.fish
rm -r ~/.gofish/
```
