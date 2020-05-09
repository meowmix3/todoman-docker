todoman/vdirsyncer Dockerfile, for use with automated tasks 

### Running

Place your vdirsyncer/todoman config **folders** in the `config` directory then, edit & run the `start.sh` file to your liking.

I use this to add daily/weekly/etc services to my CalDAV todo list, for example;

To sync the vdirsyncer files, I use:
```
*/30 * * * * docker exec -t todoman vdirsyncer -v CRITICAL sync
22 */1 * * * docker exec -t todoman vdirsyncer -v CRITICAL metasync
```

...and for the tasks, I use:
```
00 04 * * * docker exec -t todoman /usr/local/bin/todo new -l Personal --priority high --due 11PM Anki

```
