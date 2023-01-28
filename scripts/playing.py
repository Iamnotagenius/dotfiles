#!/usr/bin/python
from subprocess import run

ICONS = {'playing': '', 'paused': ''}

def get_song():
    davis = run(["davis", "status"], text=True, capture_output=True)
    if "Stopped" in davis.stdout.split('\n')[0]:
        exit(1)
    davis = run(["davis", "current"], text=True, capture_output=True)
    artist, song = davis.stdout.split('\n')[:2]
    davis = run(["davis", "status"], text=True, capture_output=True)
    _, time, status, _, _, _, _, _, _, _ = davis.stdout.split('\n')
    artist, song, time, status = artist[4:-4], song[4:-4], time[17:-6], status[17:]
    print(f"{artist} - {song} {time} {ICONS[status]}")

if __name__ == "__main__":
    get_song()

