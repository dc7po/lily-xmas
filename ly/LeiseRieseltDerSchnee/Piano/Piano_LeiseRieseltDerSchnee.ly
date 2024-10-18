\version "2.24.4"
%%% myVersion 0.00.004 alpha
%%% nach https://www.liederprojekt.org/lied31659-Leise_rieselt_der_Schnee.html

\paper {
  #(set-default-paper-size "a4")
%  #(set-paper-size "a4" 'landscape) % Querformat
%  ragged-last-bottom = ##f
%  line-width = 7.5\in
%  left-margin = 0.5\in
%  bottom-margin = 0.25\in
%  top-margin = 0.25\in
}

\header {
  title = "Leise rieselt der Schnee"
%  subtitle = ""
  instrument = "Piano"
  poet = "Text: Eduard Ebel (1895)"
  composer = "Melodie: Eduard Ebel zugeschrieben"
%  meter = "Meter"
%  arranger = "DC7PO"
%  copyright = "Public Domain caused by copyright expire"
  tagline = ""  % empty removes lilypond footer
}

global = {
  \language "english"
  \key g \major
%  \defaultTimeSignature
   \numericTimeSignature \time 6/8
%  \tempo "Maestoso" 8 = 180
  \tempo "Maestoso" 4 = 90
% 21. Jh., japanisch
% Grave          40–44
% Largo          44–48
% Lento          48–54
% Adagio         54–58
% Larghetto      58–63
% Adagietto      63–69
% Andante        69–76
% Andantino      76–84
% Maestoso       84–92
% Moderato       92–104
% Allegretto    104–116
% Animato       116–126
% Allegro       126–138
% Assai         138–152
% Vivace        152–176
% Presto        176–200
% Prestissimo   ≥ 208
}

upper = \relative c''' {
  \global
  \clef "treble^8"
  \set fingeringOrientations = #'(left)
  <b-5>4^"G" b8 <a-4>^"D7/F#" <b-5> <a-4> |
  <g-3>4.~^"G" g4 r8 |
  <g-3>4^"C/G" <e-2>8 g^\markup { \finger "3-4" } <f-sharp-3> <e-2> |
  <d-1>4.~^"G" d4 r8 |
  <a'-4>8^"D7/F#" <g-sharp-3> <a-4> <c-5>^"B7/F#" b a |
  <g-2>4.~^"Em7/G (G6)" g4 r8 |
  <a-3>8.^"C6/G (Am7/G)" <e-1>16 e8 f-sharp^"D7/F#" e f-sharp |
  g4.~^"G" g4 r8 |
  \bar "|."
}

lower = \relative c {
  \global
  \clef "bass^8"
  \chordmode {
  g,4  r8 d4:7/f-sharp r8 |
  g,2 r4 | 
  c2/g r4 |
  g,2 r4 |
  d4:7/f-sharp r8 b,4:7/f-sharp r8 |
  e2:m7/g r4 |
  c4:6/g r8 d4:7/f-sharp r8 |
  g,2 r4 |
  }
}

verse_one = \lyricmode {
\set stanza = "1."Lei -- se rie -- selt der | Schnee, __ |
     still und starr liegt der | See, __ |
     weih -- nacht -- lich glän -- zet der | Wald: __ |
     Freu -- e dich, Christ -- kind kommt bald. __ |
}

verse_two = \lyricmode {
\set stanza = "2."In -- den Her -- zen  ist’s | warm, __ |
     still schweigt Kum -- mer und | Harm, __ |
     Sorg -- e d -- es Le -- bens | verhallt: __ |
     Freu -- e dich, Christ -- kind kommt bald. __ | 
}

verse_three = \lyricmode {
\set stanza = "3."Bald ist hei -- li -- ge | Nacht, __ |
     Ch -- or der En -- gel | erwacht, __ |
     horch’ nur, wie lieb -- lich es | schallt: __ |
     Freu -- e dich, Christ -- kind kommt bald. __ | 
}

\score {
  \new PianoStaff \with {
    midiInstrument = "acoustic grand"
    instrumentName = "Piano"
  } <<
    \new Staff = upper { \new Voice = "one" \upper }
    \new Lyrics \lyricsto "one" \verse_one
    \new Lyrics \lyricsto "one" \verse_two
    \new Lyrics \lyricsto "one" \verse_three
    \new Staff = "lower" \lower
  >>
  \layout { }
  \midi { }
}
