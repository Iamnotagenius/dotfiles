{ stdenv, fetchFromGitHub }:
stdenv.mkDerivation {
  pname = "miku-christmas-grub-theme"; 
  version = "1.3";
  src = fetchFromGitHub {
    owner = "13atm01";
    repo = "GRUB-Theme";
    rev = "FSN-v1.3";
    hash = "sha256-miodp8rRZkhqVF/CIR0z8ADIw1OlodQJFjdKTsg0ZRs=";
  };
  installPhase = "cp -r \"Miku (Christmas Version)/Miku-Christmas-Version\" $out";
}
