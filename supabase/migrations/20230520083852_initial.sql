-- Create the tables
CREATE TABLE flows (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL REFERENCES auth.users (id) ON DELETE CASCADE,
    data text NOT NULL DEFAULT 'W3siaWQiOiIyOGEwMGY1YzQ5MjI3ZTFjIiwidHlwZSI6InN1YmZsb3ciLCJuYW1lIjoic2V0IGNhY2hlIiwiaW5mbyI6IiIsImNhdGVnb3J5IjoiIiwiaW4iOlt7IngiOjIyMCwieSI6MTYwLCJ3aXJlcyI6W3siaWQiOiJhMWExMjUzOTIzNTJjMTMzIn1dfV0sIm91dCI6W3sieCI6NTAwLCJ5IjozNjAsIndpcmVzIjpbeyJpZCI6IjQ3MGI5MjM2NDQ2NTJjMzIiLCJwb3J0IjowfV19XSwiZW52IjpbeyJuYW1lIjoiY2FjaGVOYW1lIiwidHlwZSI6InN0ciIsInZhbHVlIjoiZ3B0In1dLCJtZXRhIjp7fSwiY29sb3IiOiIjRERBQTk5In0seyJpZCI6IjA3NDQzZGJkMDc2MjIwYjMiLCJ0eXBlIjoiZmlsZSIsInoiOiIyOGEwMGY1YzQ5MjI3ZTFjIiwibmFtZSI6IiIsImZpbGVuYW1lIjoiZmlsZW5hbWUiLCJmaWxlbmFtZVR5cGUiOiJtc2ciLCJhcHBlbmROZXdsaW5lIjpmYWxzZSwiY3JlYXRlRGlyIjp0cnVlLCJvdmVyd3JpdGVGaWxlIjoidHJ1ZSIsImVuY29kaW5nIjoibm9uZSIsIngiOjM0MCwieSI6MjgwLCJ3aXJlcyI6W1siMWMyZDRiNzZhN2UwZDUxMyJdXX0seyJpZCI6IjQ3MGI5MjM2NDQ2NTJjMzIiLCJ0eXBlIjoiY2hhbmdlIiwieiI6IjI4YTAwZjVjNDkyMjdlMWMiLCJuYW1lIjoiIiwicnVsZXMiOlt7InQiOiJkZWxldGUiLCJwIjoiZmlsZW5hbWUiLCJwdCI6Im1zZyJ9LHsidCI6ImRlbGV0ZSIsInAiOiJoYXNoIiwicHQiOiJtc2cifV0sImFjdGlvbiI6IiIsInByb3BlcnR5IjoiIiwiZnJvbSI6IiIsInRvIjoiIiwicmVnIjpmYWxzZSwieCI6MzYwLCJ5IjozNjAsIndpcmVzIjpbW11dfSx7ImlkIjoiYTFhMTI1MzkyMzUyYzEzMyIsInR5cGUiOiJzdWJmbG93OjQxMWUwYzhkNWU5OWYyNDkiLCJ6IjoiMjhhMDBmNWM0OTIyN2UxYyIsIm5hbWUiOiIiLCJlbnYiOlt7Im5hbWUiOiJza2lwSGFzaCIsInZhbHVlIjoidHJ1ZSIsInR5cGUiOiJib29sIn1dLCJ4IjozNjAsInkiOjE2MCwid2lyZXMiOltbIjIyNTRhZTM0M2Y5M2MxNDMiXV19LHsiaWQiOiI1ZTZiYjA3ZDg5N2VmNmMyIiwidHlwZSI6ImZ1bmN0aW9uIiwieiI6IjI4YTAwZjVjNDkyMjdlMWMiLCJuYW1lIjoiZnVuY3Rpb24gOCIsImZ1bmMiOiJtc2cucGF5bG9hZCA9IGpzb25TdHJpbmdpZnlTYWZlKG1zZylcbnJldHVybiBtc2c7Iiwib3V0cHV0cyI6MSwibm9lcnIiOjAsImluaXRpYWxpemUiOiIiLCJmaW5hbGl6ZSI6IiIsImxpYnMiOlt7InZhciI6Impzb25TdHJpbmdpZnlTYWZlIiwibW9kdWxlIjoianNvbi1zdHJpbmdpZnktc2FmZSJ9XSwieCI6MzQwLCJ5IjoyNDAsIndpcmVzIjpbWyIwNzQ0M2RiZDA3NjIyMGIzIl1dfSx7ImlkIjoiMWMyZDRiNzZhN2UwZDUxMyIsInR5cGUiOiJzdWJmbG93OmEyNWJlMGUxMjdmYzllMjQiLCJ6IjoiMjhhMDBmNWM0OTIyN2UxYyIsIm5hbWUiOiIiLCJ4IjozNDAsInkiOjMyMCwid2lyZXMiOltbIjQ3MGI5MjM2NDQ2NTJjMzIiXV19LHsiaWQiOiIyMjU0YWUzNDNmOTNjMTQzIiwidHlwZSI6InN1YmZsb3c6NTIwYTEwODEyMTczZTcwMSIsInoiOiIyOGEwMGY1YzQ5MjI3ZTFjIiwibmFtZSI6IiIsImVudiI6W3sibmFtZSI6ImNsZWFyIiwidmFsdWUiOiJmYWxzZSIsInR5cGUiOiJib29sIn1dLCJ4IjozMzAsInkiOjIwMCwid2lyZXMiOltbIjVlNmJiMDdkODk3ZWY2YzIiXV19LHsiaWQiOiI0MTFlMGM4ZDVlOTlmMjQ5IiwidHlwZSI6InN1YmZsb3ciLCJuYW1lIjoiZ2V0IGNhY2hlIHBhdGgiLCJpbmZvIjoiIiwiY2F0ZWdvcnkiOiIiLCJpbiI6W3sieCI6MTIwLCJ5IjoxNDAsIndpcmVzIjpbeyJpZCI6IjE5ZGExZjhkYTMzZDQxZTQifV19XSwib3V0IjpbeyJ4Ijo2ODAsInkiOjE4MCwid2lyZXMiOlt7ImlkIjoiODBlYjU4ZjZkYjEzZjE5ZiIsInBvcnQiOjB9XX1dLCJlbnYiOlt7Im5hbWUiOiJjYWNoZU5hbWUiLCJ0eXBlIjoiZW52IiwidmFsdWUiOiJjYWNoZU5hbWUifSx7Im5hbWUiOiJza2lwSGFzaCIsInR5cGUiOiJib29sIiwidmFsdWUiOiJmYWxzZSJ9XSwibWV0YSI6e30sImNvbG9yIjoiI0REQUE5OSJ9LHsiaWQiOiIzMmFmMjNjY2VmMDZkZDU1IiwidHlwZSI6ImZ1bmN0aW9uIiwieiI6IjQxMWUwYzhkNWU5OWYyNDkiLCJuYW1lIjoiaGFzaCBtc2ciLCJmdW5jIjoiZnVuY3Rpb24gY29tcHV0ZVNIQTI1Nihfb2JqKSB7XG4gICAgY29uc3Qge2hpc3RvcnksIHRlbXBlcmF0dXJlLCBwYXlsb2FkLCBuLCBtYXhfdG9rZW5zfSA9IF9vYmpcbiAgICBjb25zdCBvYmogPSB7IGhpc3RvcnksIHRlbXBlcmF0dXJlLCBwYXlsb2FkLCBuLCBtYXhfdG9rZW5zIH07XG4gICAgY29uc3QganNvblN0cmluZyA9IGpzb25TdHJpbmdpZnlTYWZlKG9iaik7XG4gICAgY29uc3QgaGFzaCA9IGNyeXB0by5jcmVhdGVIYXNoKCdzaGEyNTYnKTtcbiAgICBoYXNoLnVwZGF0ZShqc29uU3RyaW5nKTtcbiAgICByZXR1cm4gaGFzaC5kaWdlc3QoJ2hleCcpO1xufVxuXG5tc2cuaGFzaCA9IHVuZGVmaW5lZDtcbm1zZy5oYXNoID0gY29tcHV0ZVNIQTI1Nihtc2cpO1xuXG5cblxucmV0dXJuIG1zZzsiLCJvdXRwdXRzIjoxLCJub2VyciI6MCwiaW5pdGlhbGl6ZSI6IiIsImZpbmFsaXplIjoiIiwibGlicyI6W3sidmFyIjoiY3J5cHRvIiwibW9kdWxlIjoiY3J5cHRvIn0seyJ2YXIiOiJqc29uU3RyaW5naWZ5U2FmZSIsIm1vZHVsZSI6Impzb24tc3RyaW5naWZ5LXNhZmUifSx7InZhciI6ImZzIiwibW9kdWxlIjoiZnMifV0sIngiOjUwMCwieSI6MTQwLCJ3aXJlcyI6W1siODBlYjU4ZjZkYjEzZjE5ZiJdXX0seyJpZCI6IjgwZWI1OGY2ZGIxM2YxOWYiLCJ0eXBlIjoiY2hhbmdlIiwieiI6IjQxMWUwYzhkNWU5OWYyNDkiLCJuYW1lIjoiIiwicnVsZXMiOlt7InQiOiJzZXQiLCJwIjoiZmlsZW5hbWUiLCJwdCI6Im1zZyIsInRvIjoiJGpvaW4oW1wiLi9jYWNoZS9cIiwgJGVudignY2FjaGVOYW1lJyksXCIvXCIsIGhhc2hdKSIsInRvdCI6Impzb25hdGEifV0sImFjdGlvbiI6IiIsInByb3BlcnR5IjoiIiwiZnJvbSI6IiIsInRvIjoiIiwicmVnIjpmYWxzZSwieCI6NTMwLCJ5IjoxODAsIndpcmVzIjpbW11dfSx7ImlkIjoiMTlkYTFmOGRhMzNkNDFlNCIsInR5cGUiOiJzd2l0Y2giLCJ6IjoiNDExZTBjOGQ1ZTk5ZjI0OSIsIm5hbWUiOiJzaG91bGQgc2tpcCBoYXNoPyIsInByb3BlcnR5Ijoic2tpcEhhc2giLCJwcm9wZXJ0eVR5cGUiOiJlbnYiLCJydWxlcyI6W3sidCI6ImZhbHNlIn0seyJ0IjoidHJ1ZSJ9XSwiY2hlY2thbGwiOiJ0cnVlIiwicmVwYWlyIjpmYWxzZSwib3V0cHV0cyI6MiwieCI6MjcwLCJ5IjoxNDAsIndpcmVzIjpbWyIzMmFmMjNjY2VmMDZkZDU1Il0sWyI4MGViNThmNmRiMTNmMTlmIl1dfSx7ImlkIjoiODBhODQxOTNiYzJlNDQzMCIsInR5cGUiOiJzdWJmbG93IiwibmFtZSI6ImNoZWNrIGNhY2hlIiwiaW5mbyI6IiIsImNhdGVnb3J5IjoiIiwiaW4iOlt7IngiOjEwMCwieSI6MjgwLCJ3aXJlcyI6W3siaWQiOiJhNGVkYzU3ZTAwY2U5ZWU4In1dfV0sIm91dCI6W3sieCI6NDIwLCJ5IjoyNDAsIndpcmVzIjpbeyJpZCI6IjdhZDE4ODk2OGQzYmIyY2YiLCJwb3J0IjowfV19LHsieCI6NDIwLCJ5Ijo1MjAsIndpcmVzIjpbeyJpZCI6Ijc0ZmQzYmM5MmU2YWE0OTgiLCJwb3J0IjowfV19XSwiZW52IjpbeyJuYW1lIjoiY2FjaGVOYW1lIiwidHlwZSI6InN0ciIsInZhbHVlIjoiZ3B0In1dLCJtZXRhIjp7fSwiY29sb3IiOiIjRERBQTk5Iiwic3RhdHVzIjp7IngiOjQyMCwieSI6ODAsIndpcmVzIjpbeyJpZCI6ImU4OGU0NjBlNzFlMDJiYjAiLCJwb3J0IjowfV19fSx7ImlkIjoiZjdiNjViYmI2YmZiNjY2OSIsInR5cGUiOiJjYXRjaCIsInoiOiI4MGE4NDE5M2JjMmU0NDMwIiwibmFtZSI6ImNhY2hlIG1pc3MiLCJzY29wZSI6WyJhN2NmNTEwMGM4YzdmZWNiIiwiZjc0ODE1YTU3NmMwNzJjNiJdLCJ1bmNhdWdodCI6ZmFsc2UsIngiOjIzMCwieSI6MTIwLCJ3aXJlcyI6W1siODYwZjhmZDY0MWU4ZDgyNCJdXX0seyJpZCI6IjdhZDE4ODk2OGQzYmIyY2YiLCJ0eXBlIjoiY2hhbmdlIiwieiI6IjgwYTg0MTkzYmMyZTQ0MzAiLCJuYW1lIjoicmVtb3ZlIGVycm9ycyIsInJ1bGVzIjpbeyJ0IjoiZGVsZXRlIiwicCI6ImVycm9yIiwicHQiOiJtc2cifSx7InQiOiJkZWxldGUiLCJwIjoiX2Vycm9yIiwicHQiOiJtc2cifV0sImFjdGlvbiI6IiIsInByb3BlcnR5IjoiIiwiZnJvbSI6IiIsInRvIjoiIiwicmVnIjpmYWxzZSwieCI6MjQwLCJ5IjoyNDAsIndpcmVzIjpbW11dfSx7ImlkIjoiZTg4ZTQ2MGU3MWUwMmJiMCIsInR5cGUiOiJzdGF0dXMiLCJ6IjoiODBhODQxOTNiYzJlNDQzMCIsIm5hbWUiOiIiLCJzY29wZSI6bnVsbCwieCI6MjIwLCJ5Ijo4MCwid2lyZXMiOltbXV19LHsiaWQiOiI4NjBmOGZkNjQxZThkODI0IiwidHlwZSI6InN1YmZsb3c6YTI1YmUwZTEyN2ZjOWUyNCIsInoiOiI4MGE4NDE5M2JjMmU0NDMwIiwibmFtZSI6InJlc3RvcmUgcGFydHMiLCJ4IjoyMzAsInkiOjE2MCwid2lyZXMiOltbImI4MmE1YjFkY2I0MjkzNzciXV19LHsiaWQiOiJiODJhNWIxZGNiNDI5Mzc3IiwidHlwZSI6InN1YmZsb3c6YTI1YmUwZTEyN2ZjOWUyNCIsInoiOiI4MGE4NDE5M2JjMmU0NDMwIiwibmFtZSI6InJlc3RvcmUgcGF5bG9hZCIsIngiOjI0MCwieSI6MjAwLCJ3aXJlcyI6W1siN2FkMTg4OTY4ZDNiYjJjZiJdXX0seyJpZCI6ImE3Y2Y1MTAwYzhjN2ZlY2IiLCJ0eXBlIjoiZmlsZSBpbiIsInoiOiI4MGE4NDE5M2JjMmU0NDMwIiwibmFtZSI6ImNhY2hlIGhpdCIsImZpbGVuYW1lIjoiZmlsZW5hbWUiLCJmaWxlbmFtZVR5cGUiOiJtc2ciLCJmb3JtYXQiOiJ1dGY4IiwiY2h1bmsiOmZhbHNlLCJzZW5kRXJyb3IiOmZhbHNlLCJlbmNvZGluZyI6Im5vbmUiLCJhbGxQcm9wcyI6ZmFsc2UsIngiOjIyMCwieSI6NDAwLCJ3aXJlcyI6W1siZjc0ODE1YTU3NmMwNzJjNiJdXX0seyJpZCI6ImE0ZWRjNTdlMDBjZTllZTgiLCJ0eXBlIjoic3ViZmxvdzo0MTFlMGM4ZDVlOTlmMjQ5IiwieiI6IjgwYTg0MTkzYmMyZTQ0MzAiLCJuYW1lIjoiIiwieCI6MjQwLCJ5IjoyODAsIndpcmVzIjpbWyJiOWE3MWE3Y2RkMzg1YzQ3Il1dfSx7ImlkIjoiZjc0ODE1YTU3NmMwNzJjNiIsInR5cGUiOiJmdW5jdGlvbiIsInoiOiI4MGE4NDE5M2JjMmU0NDMwIiwibmFtZSI6InBhcnNlIGhpdCIsImZ1bmMiOiJsZXQgaGl0cyA9IGZsb3cuZ2V0KCdoaXRzJykgfHwgMDtcbmhpdHMrKztcbmZsb3cuc2V0KCdoaXRzJywgaGl0cyk7XG5ub2RlLnN0YXR1cyh7IGZpbGw6IFwiZ3JlZW5cIiwgc2hhcGU6IFwiZG90XCIsIHRleHQ6IGAke2hpdHN9YCB9KTtcblxubGV0IHtoaXN0b3J5LCBmdWxsLCBwYXlsb2FkLCB0ZW1wZXJhdHVyZSwgbn0gPSBKU09OLnBhcnNlKG1zZy5wYXlsb2FkKTtcblxubXNnLmhpc3RvcnkgPSBoaXN0b3J5O1xubXNnLmZ1bGwgPSBmdWxsO1xubXNnLnBheWxvYWQgPSBwYXlsb2FkO1xubXNnLmZ1bGwgPSBmdWxsO1xubXNnLm4gPSBuO1xuXG5yZXR1cm4gbXNnOyIsIm91dHB1dHMiOjEsIm5vZXJyIjowLCJpbml0aWFsaXplIjoiIiwiZmluYWxpemUiOiIiLCJsaWJzIjpbXSwieCI6MjIwLCJ5Ijo0NDAsIndpcmVzIjpbWyI3ODVhNDUyMDc2MDE4YzRkIl1dfSx7ImlkIjoiN2UyMDdlOThjMjlhNjI2MiIsInR5cGUiOiJzdWJmbG93OjUyMGExMDgxMjE3M2U3MDEiLCJ6IjoiODBhODQxOTNiYzJlNDQzMCIsIm5hbWUiOiJzdGFzaCBwYXJ0cyIsImVudiI6W3sibmFtZSI6ImNsZWFyIiwidmFsdWUiOiJmYWxzZSIsInR5cGUiOiJib29sIn1dLCJ4IjoyMzAsInkiOjM2MCwid2lyZXMiOltbImE3Y2Y1MTAwYzhjN2ZlY2IiXV19LHsiaWQiOiI3NGZkM2JjOTJlNmFhNDk4IiwidHlwZSI6InN1YmZsb3c6YTI1YmUwZTEyN2ZjOWUyNCIsInoiOiI4MGE4NDE5M2JjMmU0NDMwIiwibmFtZSI6InJlc3RvcmUgcGFydHMiLCJlbnYiOlt7Im5hbWUiOiJrZXkiLCJ2YWx1ZSI6InBhcnRzIiwidHlwZSI6InN0ciJ9XSwieCI6MjMwLCJ5Ijo1MjAsIndpcmVzIjpbW11dfSx7ImlkIjoiYjlhNzFhN2NkZDM4NWM0NyIsInR5cGUiOiJzdWJmbG93OjUyMGExMDgxMjE3M2U3MDEiLCJ6IjoiODBhODQxOTNiYzJlNDQzMCIsIm5hbWUiOiJzdGFzaCBwYXlsb2FkIiwieCI6MjQwLCJ5IjozMjAsIndpcmVzIjpbWyI3ZTIwN2U5OGMyOWE2MjYyIl1dfSx7ImlkIjoiNzg1YTQ1MjA3NjAxOGM0ZCIsInR5cGUiOiJzdWJmbG93OmEyNWJlMGUxMjdmYzllMjQiLCJ6IjoiODBhODQxOTNiYzJlNDQzMCIsIm5hbWUiOiJjbGVhciBwYXlsb2FkIiwiZW52IjpbeyJuYW1lIjoiYXBwbHkiLCJ2YWx1ZSI6ImZhbHNlIiwidHlwZSI6ImJvb2wifV0sIngiOjI0MCwieSI6NDgwLCJ3aXJlcyI6W1siNzRmZDNiYzkyZTZhYTQ5OCJdXX0seyJpZCI6IjUyMGExMDgxMjE3M2U3MDEiLCJ0eXBlIjoic3ViZmxvdyIsIm5hbWUiOiJzdGFzaCIsImluZm8iOiIiLCJjYXRlZ29yeSI6ImZ1bmN0aW9uIiwiaW4iOlt7IngiOjYwLCJ5Ijo0MCwid2lyZXMiOlt7ImlkIjoiZGQxODZhYTZhMjY1ZmM1ZCJ9XX1dLCJvdXQiOlt7IngiOjM0MCwieSI6NDAsIndpcmVzIjpbeyJpZCI6ImRkMTg2YWE2YTI2NWZjNWQiLCJwb3J0IjowfV19XSwiZW52IjpbeyJuYW1lIjoia2V5IiwidHlwZSI6InN0ciIsInZhbHVlIjoicGF5bG9hZCJ9LHsibmFtZSI6ImNsZWFyIiwidHlwZSI6ImJvb2wiLCJ2YWx1ZSI6InRydWUifSx7Im5hbWUiOiJjbG9uZSIsInR5cGUiOiJib29sIiwidmFsdWUiOiJ0cnVlIn1dLCJtZXRhIjp7fSwiY29sb3IiOiIjRERBQTk5IiwiaWNvbiI6Im5vZGUtcmVkL2ZpbGUtaW4uc3ZnIn0seyJpZCI6ImRkMTg2YWE2YTI2NWZjNWQiLCJ0eXBlIjoiZnVuY3Rpb24iLCJ6IjoiNTIwYTEwODEyMTczZTcwMSIsIm5hbWUiOiJzdGFzaCBrZXkgdmFsdWUgIiwiZnVuYyI6ImlmICghbXNnLnN0YXNoKXtcbiAgICBtc2cuc3Rhc2ggPSB7fVxufVxuXG5jb25zdCBrZXkgPSBlbnYuZ2V0KCdrZXknKVxuXG5pZiAoIW1zZy5zdGFzaFtrZXldKXtcbiAgICBtc2cuc3Rhc2hba2V5XSA9IFtdXG59XG5cbmNvbnN0IHJlY29yZCA9IGVudi5nZXQoJ2Nsb25lJykgPyBKU09OLnBhcnNlKEpTT04uc3RyaW5naWZ5KG1zZ1trZXldIHx8ICcnKSkgOiBtc2dba2V5XTtcblxubXNnLnN0YXNoW2tleV0ucHVzaChyZWNvcmQpXG5cbmlmIChlbnYuZ2V0KCdjbGVhcicpKSB7XG4gICAgZGVsZXRlIG1zZ1trZXldO1xufVxucmV0dXJuIG1zZzsiLCJvdXRwdXRzIjoxLCJub2VyciI6MCwiaW5pdGlhbGl6ZSI6IiIsImZpbmFsaXplIjoiIiwibGlicyI6W10sIngiOjIwMCwieSI6NDAsIndpcmVzIjpbW11dfSx7ImlkIjoiYTI1YmUwZTEyN2ZjOWUyNCIsInR5cGUiOiJzdWJmbG93IiwibmFtZSI6InN0YXNoIHBvcCIsImluZm8iOiIiLCJjYXRlZ29yeSI6ImZ1bmN0aW9uIiwiaW4iOlt7IngiOjgwLCJ5Ijo2MCwid2lyZXMiOlt7ImlkIjoiNDAyMjZkNTA5MzU1MjE3NiJ9XX1dLCJvdXQiOlt7IngiOjMyMCwieSI6NjAsIndpcmVzIjpbeyJpZCI6IjQwMjI2ZDUwOTM1NTIxNzYiLCJwb3J0IjowfV19XSwiZW52IjpbeyJuYW1lIjoia2V5IiwidHlwZSI6InN0ciIsInZhbHVlIjoicGF5bG9hZCJ9LHsibmFtZSI6ImRlcHRoIiwidHlwZSI6Im51bSIsInZhbHVlIjoiMSJ9LHsibmFtZSI6ImFwcGx5IiwidHlwZSI6ImJvb2wiLCJ2YWx1ZSI6InRydWUifV0sIm1ldGEiOnt9LCJjb2xvciI6IiNEREFBOTkiLCJpY29uIjoibm9kZS1yZWQvZmlsZS1vdXQuc3ZnIn0seyJpZCI6IjQwMjI2ZDUwOTM1NTIxNzYiLCJ0eXBlIjoiZnVuY3Rpb24iLCJ6IjoiYTI1YmUwZTEyN2ZjOWUyNCIsIm5hbWUiOiJwb3AiLCJmdW5jIjoiaWYgKCFtc2cuc3Rhc2gpe1xuICAgIG1zZy5zdGFzaCA9IHt9XG59XG5cbmNvbnN0IGtleSA9IGVudi5nZXQoJ2tleScpXG5cbmlmICghbXNnLnN0YXNoW2tleV0pe1xuICAgIG1zZy5zdGFzaFtrZXldID0gW11cbn1cblxubGV0IGRlcHRoID0gZW52LmdldCgnZGVwdGgnKVxuXG53aGlsZSAoZGVwdGgpe1xuICAgIGNvbnN0IHN0YXNoID0gbXNnLnN0YXNoW2tleV0ucG9wKClcbiAgICBpZiAoc3Rhc2ggJiYgZW52LmdldCgnYXBwbHknKSl7XG4gICAgICAgIG1zZ1trZXldID0gc3Rhc2g7XG4gICAgfVxuICAgIC8vIEB0cy1pZ25vcmVcbiAgICBkZXB0aC0tO1xufVxucmV0dXJuIG1zZzsiLCJvdXRwdXRzIjoxLCJub2VyciI6MCwiaW5pdGlhbGl6ZSI6IiIsImZpbmFsaXplIjoiIiwibGlicyI6W10sIngiOjE5MCwieSI6NjAsIndpcmVzIjpbW11dfSx7ImlkIjoiZjllMGVjOTEuZTc2N2UiLCJ0eXBlIjoic3ViZmxvdyIsIm5hbWUiOiJNaW5pZnkgSlNPTiIsImluZm8iOiIiLCJjYXRlZ29yeSI6IkNoYXRHUFQiLCJpbiI6W3sieCI6ODAsInkiOjE2MCwid2lyZXMiOlt7ImlkIjoiZmZkY2Q2MWQuNjRkYTM4In1dfV0sIm91dCI6W3sieCI6MzQwLCJ5IjoxNjAsIndpcmVzIjpbeyJpZCI6ImZmZGNkNjFkLjY0ZGEzOCIsInBvcnQiOjB9XX1dLCJlbnYiOltdLCJtZXRhIjp7fSwiY29sb3IiOiIjODdBOTgwIiwiaWNvbiI6ImZvbnQtYXdlc29tZS9mYS1hcmNoaXZlIn0seyJpZCI6ImZmZGNkNjFkLjY0ZGEzOCIsInR5cGUiOiJmdW5jdGlvbiIsInoiOiJmOWUwZWM5MS5lNzY3ZSIsIm5hbWUiOiJtaW5pZnktanNvbiIsImZ1bmMiOiJjb25zdCBpbnB1dExpc3QgPSBBcnJheS5pc0FycmF5KG1zZy5oaXN0b3J5KSA/IG1zZy5oaXN0b3J5IDogW107XG5cbmlucHV0TGlzdC5mb3JFYWNoKChpdGVtKSA9PiB7XG4gIGl0ZW0uY29udGVudCA9IGl0ZW0uY29udGVudC5yZXBsYWNlKC9gYGAuKlxcbihbXFxzXFxTXSo/KVxcbmBgYC9nLCAobWF0Y2gsIGNvZGVCbG9jaykgPT4ge1xuICAgICAgdHJ5IHtcbiAgICAgICAgICBjb25zdCByZWdleCA9IC8oXFxufFxcXFxufFxccilcXHMqL2c7IC8vIG5vdGUgdGhlICdnJyBmbGFnIGZvciBnbG9iYWwgcmVwbGFjZW1lbnRcbiAgICAgICAgICByZXR1cm4gJ2BgYGpzb25cXG4nICsgY29kZUJsb2NrLnJlcGxhY2UocmVnZXgsICcnKTsgKyAnXFxuYGBgJztcbiAgICAgIH0gY2F0Y2ggKGVycm9yKSB7XG4gICAgICAgICAgcmV0dXJuIG1hdGNoO1xuICAgICAgfVxuICB9KTtcbn0pO1xuXG5yZXR1cm4gbXNnOyIsIm91dHB1dHMiOjEsIm5vZXJyIjowLCJpbml0aWFsaXplIjoiIiwiZmluYWxpemUiOiIiLCJsaWJzIjpbXSwieCI6MjEwLCJ5IjoxNjAsIndpcmVzIjpbW11dfSx7ImlkIjoiZTk2MTMzNGNkZTg5MTQ0YyIsInR5cGUiOiJ0YWIiLCJsYWJlbCI6ImdwdCBxdWV1ZSIsImRpc2FibGVkIjpmYWxzZSwiaW5mbyI6IiIsImVudiI6W119LHsiaWQiOiJkN2FmZmNkZjcwNGI5YjU0IiwidHlwZSI6Imdyb3VwIiwieiI6ImU5NjEzMzRjZGU4OTE0NGMiLCJuYW1lIjoiYXBpIGVycm9yIHJlY292ZXJ5Iiwic3R5bGUiOnsic3Ryb2tlIjoiI2ZmMDAwMCIsImZpbGwiOiIjZmZlZmJmIiwibGFiZWwiOnRydWUsImNvbG9yIjoiIzAwMDAwMCJ9LCJub2RlcyI6WyIwOWFlMjIzYzgwMjFiZmIxIiwiZGQyMDM4YmM3MTcyMWMxZiIsImI3MjJlYjVlN2RkNzBmMTMiLCJjYjA0MGVhMDQ3ZGM4NGZiIiwiZTY2YzdlMmI5YzI4MDdhYSIsIjQ1ZDBhM2E1ZjJlMmIwMjQiLCI3NDJkMTBmYjE0NGYzYzk5IiwiMzUxOGM3NTNmYWM4M2JkNiIsImM4ZWQ2Mjk5YTdkYjFiYWMiLCJjYzYyOTU2YzNiODEzMDNmIiwiZTY1Y2U1ZThlNzg1MmU4ZSIsIjNhODM1Y2VkZjBmNmUyNzIiXSwieCI6Mzk0LCJ5IjoyNzksInciOjQ1MiwiaCI6MzIyfSx7ImlkIjoiZjM5MWM1MGQ1ZGI4N2VhYSIsInR5cGUiOiJncm91cCIsInoiOiJlOTYxMzM0Y2RlODkxNDRjIiwibmFtZSI6InF1ZXVlIiwic3R5bGUiOnsic3Ryb2tlIjoiIzAwNzBjMCIsImZpbGwiOiIjYmZkYmVmIiwibGFiZWwiOnRydWUsImNvbG9yIjoiIzAwMDAwMCJ9LCJub2RlcyI6WyI4YzFjYmEyMjRkOTQ5ZDA5IiwiNGI3MzVkNGJlOTMyMzExNyIsImI5ODMzMmZkYzAyOTAyNDYiLCI4ODc3Nzk2MmZjZGVkMWIwIiwiYzAwNTYyMmMzMzc4MDJlMSJdLCJ4IjozOTQsInkiOjM5LCJ3IjozNTIsImgiOjIyMn0seyJpZCI6IjBlNjA5M2RlNDYyNTk0NzMiLCJ0eXBlIjoiZ3JvdXAiLCJ6IjoiZTk2MTMzNGNkZTg5MTQ0YyIsIm5hbWUiOiJwcmVwcm9jZXNzIiwic3R5bGUiOnsibGFiZWwiOnRydWUsImNvbG9yIjoiIzAwMDAwMCIsInN0cm9rZSI6IiNhNGE0YTQiLCJmaWxsIjoiI2UzZjNkMyIsImxhYmVsLXBvc2l0aW9uIjoibmUifSwibm9kZXMiOlsiNWQ0NTlmYzgtZWVjNy00YWNlLTk0ZTUtYjY1M2M0N2U1MDYxIiwiYjYzNmI5ZWE1YmY0NTQzNSIsImEzNTU3NzI3NTNiNzc0MDMiXSwieCI6MTc0LCJ5IjozOSwidyI6MTkyLCJoIjoxNjJ9LHsiaWQiOiJjZWYxZGYzNjc5MWE0ZDA5IiwidHlwZSI6Imdyb3VwIiwieiI6ImU5NjEzMzRjZGU4OTE0NGMiLCJuYW1lIjoicG9zdHByb2Nlc3MiLCJzdHlsZSI6eyJsYWJlbCI6dHJ1ZSwic3Ryb2tlIjoiI2E0YTRhNCIsImZpbGwiOiIjZTNmM2QzIiwiY29sb3IiOiIjMDAwMDAwIiwibGFiZWwtcG9zaXRpb24iOiJuZSJ9LCJub2RlcyI6WyJkMmVlMWZiMGI3NWU5M2I2IiwiZDVmNDQ0ZGUxZjhjZWFiYiIsIjE5OWEwZjBiOTQ2NWMwZjQiXSwieCI6MTE0LCJ5IjozMTksInciOjI1MiwiaCI6MjAyfSx7ImlkIjoiYzhlZDYyOTlhN2RiMWJhYyIsInR5cGUiOiJqdW5jdGlvbiIsInoiOiJlOTYxMzM0Y2RlODkxNDRjIiwiZyI6ImQ3YWZmY2RmNzA0YjliNTQiLCJ4Ijo2MDAsInkiOjQwMCwid2lyZXMiOltbImRkMjAzOGJjNzE3MjFjMWYiXV19LHsiaWQiOiJjYzYyOTU2YzNiODEzMDNmIiwidHlwZSI6Imp1bmN0aW9uIiwieiI6ImU5NjEzMzRjZGU4OTE0NGMiLCJnIjoiZDdhZmZjZGY3MDRiOWI1NCIsIngiOjgyMCwieSI6NDQwLCJ3aXJlcyI6W1siZGQyMDM4YmM3MTcyMWMxZiJdXX0seyJpZCI6IjcyN2Y5NzYyOThjZmM0OTAiLCJ0eXBlIjoianVuY3Rpb24iLCJ6IjoiZTk2MTMzNGNkZTg5MTQ0YyIsIngiOjE2MCwieSI6MjgwLCJ3aXJlcyI6W1siMTk5YTBmMGI5NDY1YzBmNCJdXX0seyJpZCI6ImVlNDAzMzJhYmRhN2MzYWUiLCJ0eXBlIjoianVuY3Rpb24iLCJ6IjoiZTk2MTMzNGNkZTg5MTQ0YyIsIngiOjg0MCwieSI6NDAsIndpcmVzIjpbWyJiOTgzMzJmZGMwMjkwMjQ2Il1dfSx7ImlkIjoiY2NmMWUyZGVlNzNlZTM4NCIsInR5cGUiOiJqdW5jdGlvbiIsInoiOiJlOTYxMzM0Y2RlODkxNDRjIiwieCI6MTIwLCJ5IjoyMjAsIndpcmVzIjpbWyI3MjdmOTc2Mjk4Y2ZjNDkwIl1dfSx7ImlkIjoiZTY1Y2U1ZThlNzg1MmU4ZSIsInR5cGUiOiJqdW5jdGlvbiIsInoiOiJlOTYxMzM0Y2RlODkxNDRjIiwiZyI6ImQ3YWZmY2RmNzA0YjliNTQiLCJ4Ijo0MjAsInkiOjQwMCwid2lyZXMiOltbImI3MjJlYjVlN2RkNzBmMTMiXV19LHsiaWQiOiI4YzFjYmEyMjRkOTQ5ZDA5IiwidHlwZSI6ImRlbGF5IiwieiI6ImU5NjEzMzRjZGU4OTE0NGMiLCJnIjoiZjM5MWM1MGQ1ZGI4N2VhYSIsIm5hbWUiOiJncHQ0IGxpbWl0IiwicGF1c2VUeXBlIjoicmF0ZSIsInRpbWVvdXQiOiI1IiwidGltZW91dFVuaXRzIjoic2Vjb25kcyIsInJhdGUiOiIxIiwibmJSYXRlVW5pdHMiOiIxMyIsInJhdGVVbml0cyI6InNlY29uZCIsInJhbmRvbUZpcnN0IjoiNSIsInJhbmRvbUxhc3QiOiIyMCIsInJhbmRvbVVuaXRzIjoic2Vjb25kcyIsImRyb3AiOmZhbHNlLCJhbGxvd3JhdGUiOmZhbHNlLCJvdXRwdXRzIjoxLCJ4Ijo2NjAsInkiOjEyMCwid2lyZXMiOltbIjg4Nzc3OTYyZmNkZWQxYjAiXV19LHsiaWQiOiI0YjczNWQ0YmU5MzIzMTE3IiwidHlwZSI6ImRlbGF5IiwieiI6ImU5NjEzMzRjZGU4OTE0NGMiLCJnIjoiZjM5MWM1MGQ1ZGI4N2VhYSIsIm5hbWUiOiJ0dXJibyBsaW1pdCIsInBhdXNlVHlwZSI6InJhdGUiLCJ0aW1lb3V0IjoiNSIsInRpbWVvdXRVbml0cyI6InNlY29uZHMiLCJyYXRlIjoiMTUiLCJuYlJhdGVVbml0cyI6IjYwIiwicmF0ZVVuaXRzIjoic2Vjb25kIiwicmFuZG9tRmlyc3QiOiI1IiwicmFuZG9tTGFzdCI6IjIwIiwicmFuZG9tVW5pdHMiOiJzZWNvbmRzIiwiZHJvcCI6ZmFsc2UsImFsbG93cmF0ZSI6ZmFsc2UsIm91dHB1dHMiOjEsIngiOjQ4MCwieSI6MTIwLCJ3aXJlcyI6W1siODg3Nzc5NjJmY2RlZDFiMCJdXX0seyJpZCI6ImI5ODMzMmZkYzAyOTAyNDYiLCJ0eXBlIjoic3dpdGNoIiwieiI6ImU5NjEzMzRjZGU4OTE0NGMiLCJnIjoiZjM5MWM1MGQ1ZGI4N2VhYSIsIm5hbWUiOiIiLCJwcm9wZXJ0eSI6InRvcGljIiwicHJvcGVydHlUeXBlIjoibXNnIiwicnVsZXMiOlt7InQiOiJlcSIsInYiOiJncHQ0IiwidnQiOiJzdHIifSx7InQiOiJlcSIsInYiOiJ0dXJibyIsInZ0Ijoic3RyIn1dLCJjaGVja2FsbCI6InRydWUiLCJyZXBhaXIiOmZhbHNlLCJvdXRwdXRzIjoyLCJ4Ijo0NzAsInkiOjgwLCJ3aXJlcyI6W1siOGMxY2JhMjI0ZDk0OWQwOSJdLFsiNGI3MzVkNGJlOTMyMzExNyJdXX0seyJpZCI6ImYyMzQyZDQ5OTE2YTRlMjMiLCJ0eXBlIjoibGluayBpbiIsInoiOiJlOTYxMzM0Y2RlODkxNDRjIiwibmFtZSI6ImdwdCBpbiIsImxpbmtzIjpbXSwieCI6NzUsInkiOjgwLCJ3aXJlcyI6W1siYjYzNmI5ZWE1YmY0NTQzNSJdXX0seyJpZCI6IjlmNGQwMTU0YmNhYTViZGIiLCJ0eXBlIjoibGluayBvdXQiLCJ6IjoiZTk2MTMzNGNkZTg5MTQ0YyIsIm5hbWUiOiJncHQgb3V0IiwibW9kZSI6InJldHVybiIsImxpbmtzIjpbXSwieCI6MzU1LCJ5Ijo1NDAsIndpcmVzIjpbXX0seyJpZCI6IjFkMDc3M2JjZjM0MTY0MDQiLCJ0eXBlIjoiY2hhdGdwdCIsInoiOiJlOTYxMzM0Y2RlODkxNDRjIiwibmFtZSI6IiIsIk9yZ2FuaXphdGlvbiI6IiAiLCJ0b3BpYyI6Il9fRU1QVFlfXyIsIkJhc2VVcmwiOiJodHRwczovL2FwaS5vcGVuYWkuY29tIiwieCI6MjgwLCJ5IjoyNjAsIndpcmVzIjpbWyI3MjdmOTc2Mjk4Y2ZjNDkwIl1dfSx7ImlkIjoiMDlhZTIyM2M4MDIxYmZiMSIsInR5cGUiOiJjYXRjaCIsInoiOiJlOTYxMzM0Y2RlODkxNDRjIiwiZyI6ImQ3YWZmY2RmNzA0YjliNTQiLCJuYW1lIjoiY2F0Y2ggZ3B0IGVycm9ycyIsInNjb3BlIjpbIjFkMDc3M2JjZjM0MTY0MDQiXSwidW5jYXVnaHQiOmZhbHNlLCJ4Ijo1MDAsInkiOjM2MCwid2lyZXMiOltbIjQ1ZDBhM2E1ZjJlMmIwMjQiLCIzYTgzNWNlZGYwZjZlMjcyIl1dfSx7ImlkIjoiZGQyMDM4YmM3MTcyMWMxZiIsInR5cGUiOiJjaGFuZ2UiLCJ6IjoiZTk2MTMzNGNkZTg5MTQ0YyIsImciOiJkN2FmZmNkZjcwNGI5YjU0IiwibmFtZSI6IiIsInJ1bGVzIjpbeyJ0IjoiZGVsZXRlIiwicCI6ImVycm9yIiwicHQiOiJtc2cifV0sImFjdGlvbiI6IiIsInByb3BlcnR5IjoiIiwiZnJvbSI6IiIsInRvIjoiIiwicmVnIjpmYWxzZSwieCI6NzIwLCJ5Ijo0MDAsIndpcmVzIjpbWyJlZTQwMzMyYWJkYTdjM2FlIl1dfSx7ImlkIjoiYjcyMmViNWU3ZGQ3MGYxMyIsInR5cGUiOiJzd2l0Y2giLCJ6IjoiZTk2MTMzNGNkZTg5MTQ0YyIsImciOiJkN2FmZmNkZjcwNGI5YjU0IiwibmFtZSI6Imtub3duIGVycm9ycyIsInByb3BlcnR5IjoiZXJyb3IubWVzc2FnZSIsInByb3BlcnR5VHlwZSI6Im1zZyIsInJ1bGVzIjpbeyJ0IjoiY29udCIsInYiOiI0MjkiLCJ2dCI6InN0ciJ9LHsidCI6ImNvbnQiLCJ2IjoiNTAyIiwidnQiOiJzdHIifSx7InQiOiJjb250IiwidiI6InJlYWQgRUNPTk5SRVNFVCIsInZ0Ijoic3RyIn0seyJ0IjoiY29udCIsInYiOiJzb2NrZXQgaGFuZyB1cCIsInZ0Ijoic3RyIn0seyJ0IjoiY29udCIsInYiOiJSYXRlIGxpbWl0IHJlYWNoZWQiLCJ2dCI6InN0ciJ9LHsidCI6ImNvbnQiLCJ2IjoibWF4aW11bSBjb250ZXh0IGxlbmd0aCIsInZ0Ijoic3RyIn0seyJ0IjoiZWxzZSJ9XSwiY2hlY2thbGwiOiJmYWxzZSIsInJlcGFpciI6ZmFsc2UsIm91dHB1dHMiOjcsIngiOjUxMCwieSI6NDQwLCJ3aXJlcyI6W1siYzhlZDYyOTlhN2RiMWJhYyJdLFsiYzhlZDYyOTlhN2RiMWJhYyJdLFsiYzhlZDYyOTlhN2RiMWJhYyJdLFsiYzhlZDYyOTlhN2RiMWJhYyJdLFsiMzUxOGM3NTNmYWM4M2JkNiJdLFsiY2IwNDBlYTA0N2RjODRmYiJdLFsiNzQyZDEwZmIxNDRmM2M5OSJdXX0seyJpZCI6ImQyZWUxZmIwYjc1ZTkzYjYiLCJ0eXBlIjoic3ViZmxvdzpmOWUwZWM5MS5lNzY3ZSIsInoiOiJlOTYxMzM0Y2RlODkxNDRjIiwiZyI6ImNlZjFkZjM2NzkxYTRkMDkiLCJuYW1lIjoibWluaWZ5IEpTT04gaW4gaGlzdG9yeSIsIngiOjI0MCwieSI6NDAwLCJ3aXJlcyI6W1siZDVmNDQ0ZGUxZjhjZWFiYiJdXX0seyJpZCI6ImQ1ZjQ0NGRlMWY4Y2VhYmIiLCJ0eXBlIjoic3ViZmxvdzphMjViZTBlMTI3ZmM5ZTI0IiwieiI6ImU5NjEzMzRjZGU4OTE0NGMiLCJnIjoiY2VmMWRmMzY3OTFhNGQwOSIsIm5hbWUiOiJyZXN0b3JlIHRvcGljIiwiZW52IjpbeyJuYW1lIjoia2V5IiwidmFsdWUiOiJ0b3BpYyIsInR5cGUiOiJzdHIifV0sIngiOjIxMCwieSI6NDgwLCJ3aXJlcyI6W1siOWY0ZDAxNTRiY2FhNWJkYiJdXX0seyJpZCI6IjVkNDU5ZmM4LWVlYzctNGFjZS05NGU1LWI2NTNjNDdlNTA2MSIsInR5cGUiOiJmdW5jdGlvbiIsInoiOiJlOTYxMzM0Y2RlODkxNDRjIiwiZyI6IjBlNjA5M2RlNDYyNTk0NzMiLCJuYW1lIjoiaGVhZHJvb20iLCJmdW5jIjoiY29uc3QgZW5jb2RlID0gZ3B0M0VuY29kZXIuZW5jb2RlO1xubXNnLnRvcGljID0gbXNnLnRvcGljIHx8ICd0dXJibyc7XG5cbmxldCBzdW0gPSAobXNnLmhpc3RvcnkgfHwgW10pLmZpbHRlcihlID0+IGUpLnJlZHVjZSgoYWNjLCBjdXIpID0+IGFjYyArIGVuY29kZShjdXIuY29udGVudCkubGVuZ3RoLCAwKTtcbnN1bSArPSBlbmNvZGUobXNnLnBheWxvYWQpLmxlbmd0aDtcbnN1bSArPSAzMDA7IC8vIGdpdmUgdGhlIGVuY29kZXIgc29tZSB3aWdnbGUgcm9vbVxubm9kZS5sb2coJ3Rva2VuIHN1bTogJyArIHN1bSk7XG5pZiAoZW52LmF1dG80XG4mJiAobXNnLnRvcGljICE9PSAnZ3B0NCcpIFxuLy8gQHRzLWlnbm9yZVxuJiYgKDQwOTYgLSBzdW0gPCAobXNnLm1pbl90b2tlbnMgfHwgMCkpKSB7XG4gICAgbXNnLnRvcGljID0gJ2dwdDQnXG59XG5cbi8vIGlmIChlbnYuZ2V0KCdhdXRvNCcpXG4vLyAmJiAobXNnLnRvcGljID09ICdncHQ0Jylcbi8vICYmICg0MDk2IC0gc3VtID4gKG1zZy5taW5fdG9rZW5zIHx8IDApKSl7XG4vLyAgICAgbXNnLnRvcGljID0gJ3R1cmJvJztcbi8vIH1cblxubXNnLm1heF90b2tlbnMgPSAoKG1zZy50b3BpYyA9PT0gJ2dwdDQnKSA/IDgxOTIgOiA0MDk2KSAtIHN1bTtcblxuXG5yZXR1cm4gbXNnOyIsIm91dHB1dHMiOjEsIm5vZXJyIjowLCJpbml0aWFsaXplIjoiIiwiZmluYWxpemUiOiIiLCJsaWJzIjpbeyJ2YXIiOiJncHQzRW5jb2RlciIsIm1vZHVsZSI6ImdwdC0zLWVuY29kZXIifV0sIngiOjI3MCwieSI6MTIwLCJ3aXJlcyI6W1siYTM1NTc3Mjc1M2I3NzQwMyJdXX0seyJpZCI6ImI2MzZiOWVhNWJmNDU0MzUiLCJ0eXBlIjoic3ViZmxvdzo1MjBhMTA4MTIxNzNlNzAxIiwieiI6ImU5NjEzMzRjZGU4OTE0NGMiLCJnIjoiMGU2MDkzZGU0NjI1OTQ3MyIsIm5hbWUiOiJzdGFzaCB0b3BpYyIsImVudiI6W3sibmFtZSI6ImtleSIsInZhbHVlIjoidG9waWMiLCJ0eXBlIjoic3RyIn0seyJuYW1lIjoiY2xlYXIiLCJ2YWx1ZSI6ImZhbHNlIiwidHlwZSI6ImJvb2wifV0sIngiOjI3MCwieSI6ODAsIndpcmVzIjpbWyI1ZDQ1OWZjOC1lZWM3LTRhY2UtOTRlNS1iNjUzYzQ3ZTUwNjEiXV19LHsiaWQiOiJjYjA0MGVhMDQ3ZGM4NGZiIiwidHlwZSI6ImZ1bmN0aW9uIiwieiI6ImU5NjEzMzRjZGU4OTE0NGMiLCJnIjoiZDdhZmZjZGY3MDRiOWI1NCIsIm5hbWUiOiJmaXggdG9rZW4gb3ZlcmFnZSIsImZ1bmMiOiJmdW5jdGlvbiBleHRyYWN0TnVtYmVyc0Zyb21TdHJpbmcoc3RyKSB7XG4gICAgY29uc3QgcmVnZXggPSAvXFxkKy9nOyAvLyBSZWd1bGFyIGV4cHJlc3Npb24gdG8gbWF0Y2ggb25lIG9yIG1vcmUgZGlnaXRzXG4gICAgY29uc3QgbWF0Y2hlcyA9IHN0ci5tYXRjaChyZWdleCk7IC8vIEV4dHJhY3QgYWxsIG51bWJlcnMgZnJvbSB0aGUgc3RyaW5nXG5cbiAgICBjb25zdCByZXN1bHQgPSB7XG4gICAgICAgIG1heGltdW1Db250ZXh0TGVuZ3RoOiBwYXJzZUludChtYXRjaGVzWzBdKSxcbiAgICAgICAgcmVxdWVzdGVkVG9rZW5zOiBwYXJzZUludChtYXRjaGVzWzFdKSxcbiAgICAgICAgdG9rZW5zSW5NZXNzYWdlczogcGFyc2VJbnQobWF0Y2hlc1syXSksXG4gICAgICAgIHRva2Vuc0luQ29tcGxldGlvbjogcGFyc2VJbnQobWF0Y2hlc1szXSlcbiAgICB9O1xuXG4gICAgcmV0dXJuIHJlc3VsdDtcbn1cblxuY29uc3QgdmFsdWVzID0gZXh0cmFjdE51bWJlcnNGcm9tU3RyaW5nKG1zZy5lcnJvci5tZXNzYWdlKTtcbmNvbnNvbGUubG9nKCd2YWx1ZXMnLCB2YWx1ZXMpXG5jb25zdCBvdmVyYWdlID0gdmFsdWVzLnRva2Vuc0luQ29tcGxldGlvbiAtICh2YWx1ZXMucmVxdWVzdGVkVG9rZW5zIC0gdmFsdWVzLm1heGltdW1Db250ZXh0TGVuZ3RoKTtcbmlmICh2YWx1ZXMudG9rZW5zSW5Db21wbGV0aW9uIC0gbXNnLm1pbl90b2tlbnMgPCBvdmVyYWdlKSB7XG4gICAgLy8gd2UganVzdCBtaXNjYWxjdWxhdGVkLCBidXQgd2UncmUgc3RpbGwgZ29vZFxuICAgIG1zZy5tYXhfdG9rZW5zID0gdmFsdWVzLnRva2Vuc0luQ29tcGxldGlvbiAtIG92ZXJhZ2Vcbn0gZWxzZSBpZiAobXNnLmF1dG80ICYmIG1zZy50b3BpYyA9PT0gJ3R1cmJvJykge1xuICAgIC8vIHVwZ3JhZGUgbW9kZWxcbiAgICBtc2cudG9waWMgPSAnZ3B0NCdcbn0gZWxzZSBpZiAodmFsdWVzLnRva2Vuc0luQ29tcGxldGlvbiA+IG92ZXJhZ2UpIHtcbiAgICBtc2cubWF4X3Rva2VucyA9IHZhbHVlcy50b2tlbnNJbkNvbXBsZXRpb24gLSBvdmVyYWdlO1xufSBlbHNlIHtcbiAgICAvLyBiYWlsXG4gICAgbXNnLnBheWxvYWQgPSAndW5yZWNvdmVyYWJsZSB0b2tlbiBvdmVyYWdlJ1xuICAgIHJldHVybiBbbnVsbCwgbXNnXTtcbn1cblxubXNnLmhpc3RvcnkucG9wKClcblxuXG5yZXR1cm4gW21zZyxudWxsXTsiLCJvdXRwdXRzIjoyLCJub2VyciI6MCwiaW5pdGlhbGl6ZSI6IiIsImZpbmFsaXplIjoiIiwibGlicyI6W10sIngiOjczMCwieSI6NDgwLCJ3aXJlcyI6W1siY2M2Mjk1NmMzYjgxMzAzZiJdLFsiZTY2YzdlMmI5YzI4MDdhYSJdXX0seyJpZCI6ImU2NmM3ZTJiOWMyODA3YWEiLCJ0eXBlIjoiZGVidWciLCJ6IjoiZTk2MTMzNGNkZTg5MTQ0YyIsImciOiJkN2FmZmNkZjcwNGI5YjU0IiwibmFtZSI6ImZhdGFsIGVycm9yIiwiYWN0aXZlIjp0cnVlLCJ0b3NpZGViYXIiOnRydWUsImNvbnNvbGUiOmZhbHNlLCJ0b3N0YXR1cyI6ZmFsc2UsImNvbXBsZXRlIjoidHJ1ZSIsInRhcmdldFR5cGUiOiJmdWxsIiwic3RhdHVzVmFsIjoiIiwic3RhdHVzVHlwZSI6ImF1dG8iLCJ4Ijo3NDAsInkiOjU2MCwid2lyZXMiOltdfSx7ImlkIjoiNDVkMGEzYTVmMmUyYjAyNCIsInR5cGUiOiJmdW5jdGlvbiIsInoiOiJlOTYxMzM0Y2RlODkxNDRjIiwiZyI6ImQ3YWZmY2RmNzA0YjliNTQiLCJuYW1lIjoiY2xlYW4gaGlzdG9yeSIsImZ1bmMiOiJpZiAobXNnLmhpc3Rvcnkpe1xuICAgIGNvbnN0IHNlZW4gPSBuZXcgU2V0KClcbiAgICBtc2cuaGlzdG9yeSA9IG1zZy5oaXN0b3J5LmZpbHRlcihpdGVtID0+IHtcbiAgICAgICAgaWYgKHNlZW4uaGFzKGl0ZW0uY29udGVudCkpe1xuICAgICAgICAgICAgcmV0dXJuIGZhbHNlO1xuICAgICAgICB9XG4gICAgICAgIHNlZW4uYWRkKGl0ZW0uY29udGVudClcbiAgICAgICAgcmV0dXJuIHRydWU7XG4gICAgfSlcbn1cbnJldHVybiBtc2c7Iiwib3V0cHV0cyI6MSwibm9lcnIiOjAsImluaXRpYWxpemUiOiIiLCJmaW5hbGl6ZSI6IiIsImxpYnMiOltdLCJ4Ijo3MTAsInkiOjM2MCwid2lyZXMiOltbImU2NWNlNWU4ZTc4NTJlOGUiXV19LHsiaWQiOiI3NDJkMTBmYjE0NGYzYzk5IiwidHlwZSI6InN3aXRjaCIsInoiOiJlOTYxMzM0Y2RlODkxNDRjIiwiZyI6ImQ3YWZmY2RmNzA0YjliNTQiLCJuYW1lIjoiaWdub3JlIGR1cGxpY2F0ZXMiLCJwcm9wZXJ0eSI6ImVycm9yLm1lc3NhZ2UiLCJwcm9wZXJ0eVR5cGUiOiJtc2ciLCJydWxlcyI6W3sidCI6ImNvbnQiLCJ2IjoiVGhhdCBtb2RlbCBpcyBjdXJyZW50bHkgb3ZlcmxvYWRlZCB3aXRoIG90aGVyIHJlcXVlc3RzIiwidnQiOiJzdHIifSx7InQiOiJlcSIsInYiOiI0MDAiLCJ2dCI6InN0ciJ9LHsidCI6ImVsc2UifV0sImNoZWNrYWxsIjoiZmFsc2UiLCJyZXBhaXIiOmZhbHNlLCJvdXRwdXRzIjozLCJ4Ijo1MzAsInkiOjUyMCwid2lyZXMiOltbXSxbXSxbImU2NmM3ZTJiOWMyODA3YWEiXV19LHsiaWQiOiIzNTE4Yzc1M2ZhYzgzYmQ2IiwidHlwZSI6ImZ1bmN0aW9uIiwieiI6ImU5NjEzMzRjZGU4OTE0NGMiLCJnIjoiZDdhZmZjZGY3MDRiOWI1NCIsIm5hbWUiOiJzZXQgcmF0ZSBsaW1pdCIsImZ1bmMiOiJmbG93LnNldChcInJhdGVfbGltaXRfZW5jb3VudGVyZWRcIiwgdHJ1ZSk7XG5ub2RlLnN0YXR1cyh7IGZpbGw6IFwicmVkXCIsIHNoYXBlOiBcImRvdFwiLCB0ZXh0OiBcIlJhdGUgbGltaXQgZW5jb3VudGVyZWRcIiB9KTtcbnNldFRpbWVvdXQoKCkgPT4ge1xuICAgIGZsb3cuc2V0KFwicmF0ZV9saW1pdF9lbmNvdW50ZXJlZFwiLCBmYWxzZSk7XG4gICAgbm9kZS5zdGF0dXMoeyBmaWxsOiBcImJsdWVcIiwgc2hhcGU6IFwiZG90XCIsIHRleHQ6IFwiUmF0ZSBsaW1pdCBleHBpcmVkXCIgfSk7XG59KVxucmV0dXJuIG1zZzsiLCJvdXRwdXRzIjoxLCJub2VyciI6MCwiaW5pdGlhbGl6ZSI6IiIsImZpbmFsaXplIjoiIiwibGlicyI6W10sIngiOjcxMCwieSI6NDQwLCJ3aXJlcyI6W1siY2M2Mjk1NmMzYjgxMzAzZiJdXX0seyJpZCI6Ijg4Nzc3OTYyZmNkZWQxYjAiLCJ0eXBlIjoiZnVuY3Rpb24iLCJ6IjoiZTk2MTMzNGNkZTg5MTQ0YyIsImciOiJmMzkxYzUwZDVkYjg3ZWFhIiwibmFtZSI6InJhdGUgbGltaXQgaGl0IGNoZWNrZXIiLCJmdW5jIjoidmFyIHJhdGVMaW1pdEVuY291bnRlcmVkID0gZmxvdy5nZXQoXCJyYXRlX2xpbWl0X2VuY291bnRlcmVkXCIpIHx8IGZhbHNlO1xuaWYgKHJhdGVMaW1pdEVuY291bnRlcmVkKSB7XG4gICAgLy8gSWYgYSByYXRlIGxpbWl0IGhhcyBiZWVuIGVuY291bnRlcmVkLCBwYXVzZSBmb3IgMzAgc2Vjb25kc1xuICAgIG1zZy5kZWxheSA9IDMwMDAwO1xufSBcbi8vIFJlc2V0IHRoZSByYXRlIGxpbWl0IGVuY291bnRlcmVkIGZsYWdcbnJldHVybiBtc2c7XG4iLCJvdXRwdXRzIjoxLCJub2VyciI6MCwiaW5pdGlhbGl6ZSI6IiIsImZpbmFsaXplIjoiIiwibGlicyI6W10sIngiOjUyMCwieSI6MTgwLCJ3aXJlcyI6W1siYzAwNTYyMmMzMzc4MDJlMSJdXX0seyJpZCI6ImMwMDU2MjJjMzM3ODAyZTEiLCJ0eXBlIjoiZGVsYXkiLCJ6IjoiZTk2MTMzNGNkZTg5MTQ0YyIsImciOiJmMzkxYzUwZDVkYjg3ZWFhIiwibmFtZSI6InJhdGUgbGltaXQgaGl0IHF1ZXVlIiwicGF1c2VUeXBlIjoiZGVsYXl2IiwidGltZW91dCI6IjEiLCJ0aW1lb3V0VW5pdHMiOiJzZWNvbmRzIiwicmF0ZSI6IjEiLCJuYlJhdGVVbml0cyI6IjEzIiwicmF0ZVVuaXRzIjoic2Vjb25kIiwicmFuZG9tRmlyc3QiOiI1IiwicmFuZG9tTGFzdCI6IjIwIiwicmFuZG9tVW5pdHMiOiJzZWNvbmRzIiwiZHJvcCI6ZmFsc2UsImFsbG93cmF0ZSI6ZmFsc2UsIm91dHB1dHMiOjEsIngiOjUxMCwieSI6MjIwLCJ3aXJlcyI6W1siMWQwNzczYmNmMzQxNjQwNCJdXX0seyJpZCI6ImEzNTU3NzI3NTNiNzc0MDMiLCJ0eXBlIjoic3ViZmxvdzo4MGE4NDE5M2JjMmU0NDMwIiwieiI6ImU5NjEzMzRjZGU4OTE0NGMiLCJnIjoiMGU2MDkzZGU0NjI1OTQ3MyIsIm5hbWUiOiIiLCJ4IjoyNzAsInkiOjE2MCwid2lyZXMiOltbImI5ODMzMmZkYzAyOTAyNDYiXSxbImNjZjFlMmRlZTczZWUzODQiXV19LHsiaWQiOiIxOTlhMGYwYjk0NjVjMGY0IiwidHlwZSI6InN1YmZsb3c6MjhhMDBmNWM0OTIyN2UxYyIsInoiOiJlOTYxMzM0Y2RlODkxNDRjIiwiZyI6ImNlZjFkZjM2NzkxYTRkMDkiLCJuYW1lIjoiIiwieCI6MjAwLCJ5IjozNjAsIndpcmVzIjpbWyJkMmVlMWZiMGI3NWU5M2I2Il1dfSx7ImlkIjoiM2E4MzVjZWRmMGY2ZTI3MiIsInR5cGUiOiJkZWJ1ZyIsInoiOiJlOTYxMzM0Y2RlODkxNDRjIiwiZyI6ImQ3YWZmY2RmNzA0YjliNTQiLCJuYW1lIjoiYWxsIGVycm9ycyIsImFjdGl2ZSI6ZmFsc2UsInRvc2lkZWJhciI6dHJ1ZSwiY29uc29sZSI6ZmFsc2UsInRvc3RhdHVzIjpmYWxzZSwiY29tcGxldGUiOiJ0cnVlIiwidGFyZ2V0VHlwZSI6ImZ1bGwiLCJzdGF0dXNWYWwiOiIiLCJzdGF0dXNUeXBlIjoiYXV0byIsIngiOjcwMCwieSI6MzIwLCJ3aXJlcyI6W119LHsiaWQiOiIxNDBiMjAxOTc1N2E1YzFhIiwidHlwZSI6ImNhdGNoIiwieiI6ImU5NjEzMzRjZGU4OTE0NGMiLCJuYW1lIjoiIiwic2NvcGUiOlsiYjk4MzMyZmRjMDI5MDI0NiJdLCJ1bmNhdWdodCI6ZmFsc2UsIngiOjE5MCwieSI6NzIwLCJ3aXJlcyI6W1siNmExMDNiNDUyZTU1ZmQ0ZCJdXX0seyJpZCI6IjRkMzRmMGEyY2NiOWVmYWUiLCJ0eXBlIjoiY2F0Y2giLCJ6IjoiZTk2MTMzNGNkZTg5MTQ0YyIsIm5hbWUiOiIiLCJzY29wZSI6bnVsbCwidW5jYXVnaHQiOnRydWUsIngiOjIyMCwieSI6NzYwLCJ3aXJlcyI6W1siYmU1ODliMTk3ZjZmODNjOSJdXX0seyJpZCI6ImJlNTg5YjE5N2Y2ZjgzYzkiLCJ0eXBlIjoiZGVidWciLCJ6IjoiZTk2MTMzNGNkZTg5MTQ0YyIsIm5hbWUiOiJxdWV1ZSBlcnJvciIsImFjdGl2ZSI6dHJ1ZSwidG9zaWRlYmFyIjp0cnVlLCJjb25zb2xlIjpmYWxzZSwidG9zdGF0dXMiOmZhbHNlLCJjb21wbGV0ZSI6InRydWUiLCJ0YXJnZXRUeXBlIjoiZnVsbCIsInN0YXR1c1ZhbCI6IiIsInN0YXR1c1R5cGUiOiJhdXRvIiwieCI6NDMwLCJ5Ijo3NjAsIndpcmVzIjpbXX0seyJpZCI6IjZhMTAzYjQ1MmU1NWZkNGQiLCJ0eXBlIjoiZGVidWciLCJ6IjoiZTk2MTMzNGNkZTg5MTQ0YyIsIm5hbWUiOiJzd2l0Y2ggZXJyb3IiLCJhY3RpdmUiOnRydWUsInRvc2lkZWJhciI6dHJ1ZSwiY29uc29sZSI6ZmFsc2UsInRvc3RhdHVzIjpmYWxzZSwiY29tcGxldGUiOiJ0cnVlIiwidGFyZ2V0VHlwZSI6ImZ1bGwiLCJzdGF0dXNWYWwiOiIiLCJzdGF0dXNUeXBlIjoiYXV0byIsIngiOjQzMCwieSI6NzIwLCJ3aXJlcyI6W119XQ=='
);

CREATE TABLE credentials (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL REFERENCES auth.users (id) ON DELETE CASCADE,
    data text NOT NULL DEFAULT 'e30='
);

CREATE TABLE settings (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL REFERENCES auth.users (id) ON DELETE CASCADE,
    data text NOT NULL DEFAULT 'e30='
);

CREATE TABLE sessions (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL REFERENCES auth.users (id) ON DELETE CASCADE,
    data text NOT NULL DEFAULT 'W10='
);

-- Enable RLS
ALTER TABLE flows ENABLE ROW LEVEL SECURITY;
ALTER TABLE credentials ENABLE ROW LEVEL SECURITY;
ALTER TABLE settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE sessions ENABLE ROW LEVEL SECURITY;

-- Create Policies
CREATE POLICY user_flow_policy ON flows USING (user_id = auth.uid());
CREATE POLICY user_credentials_policy ON credentials USING (user_id = auth.uid());
CREATE POLICY user_settings_policy ON settings USING (user_id = auth.uid());
CREATE POLICY user_sessions_policy ON sessions USING (user_id = auth.uid());

-- Trigger function
CREATE OR REPLACE FUNCTION new_user_trigger() RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO flows (user_id) VALUES (NEW.id);
  INSERT INTO credentials (user_id) VALUES (NEW.id);
  INSERT INTO settings (user_id) VALUES (NEW.id);
  INSERT INTO sessions (user_id) VALUES (NEW.id);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER new_user_trigger
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION new_user_trigger();
