Logic Controls For AC Panel

| LOGIC INPUTS       | Number | Value | Desc.                                | --- | LOGIC OUTPUTS | Number | Value  | Desc.                      |
| Touchscreen Pulse  | 1      | 1/0   | Single Press From Screen             | --- | Heater Toggle | 1      | On/Off | To Heater Matrix           |
| Touchscreen Timer  | 2      | 1/0   | Pulsed Blinker From Screen           | --- | Auto Button   | 2      | Pulse  | To Toggle Switch Via Pulse |
| Temperture Unit    | 3      | C/F   | Changes Units From F (OFF) to C (ON) | --- | Max Button    | 3      | Pulse  | To Toggle Switch Via Pulse |
| Auto Button        | 4      | 1/0   | From Toggle Switch For Button        | --- | Power Button  | 4      | Pulse  | To Toggle Switch Via Pulse |
| Max Button         | 5      | 1/0   | From Toggle Switch For Button        | --- | ------------- | ------ | ------ | -------------------------- |
| Power Button       | 6      | 1/0   | From Toggle Switch For Button        | --- | ------------- | ------ | ------ | -------------------------- |
| ------------------ | ------ | ----- | ------------------------------------ | --- | ------------- | ------ | ------ | -------------------------- |
| ------------------ | ------ | ----- | ------------------------------------ | --- | ------------- | ------ | ------ | -------------------------- |
| Monitor Width      | 1      | X     | From Touchscreen                     | --- | ------------- | ------ | ------ | -------------------------- |
| Monitor Length     | 2      | X     | From Touchscreen                     | --- | ------------- | ------ | ------ | -------------------------- |
| Touchscreen X      | 3      | X     | From Touchscreen                     | --- | ------------- | ------ | ------ | -------------------------- |
| Touchscreen Y      | 4      | X     | From Touchscreen                     | --- | ------------- | ------ | ------ | -------------------------- |
| Outside Temperture | 5      | X (C) | From Temperture Probe                | --- | ------------- | ------ | ------ | -------------------------- |

| Property    | Type | Value                     | Desc.                                           |
| Heater Type | Bool | On (Auto), Off (Non-Auto) | Adds AUTO to temperture sensor equiped vehicles |
|             |      |                           |                                                 |