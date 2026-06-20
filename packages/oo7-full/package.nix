{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  dbus,
  openssl,
  pam,
  ...
}:

rustPlatform.buildRustPackage rec {
  pname = "oo7-full";
  version = "0.6.0";

  src = fetchFromGitHub {
    owner = "linux-credentials";
    repo = "oo7";
    rev = version;
    hash = "sha256-FPt37KEap7z1ant+6VHqqFBRwwE4YV3yQrc0V/kd+Mo=";
  };

  cargoHash = "sha256-79bSlSbDaOtAXsJe1suMhvhsC/LoSDMZ+G/dhTTQ4EA=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    dbus
    openssl
    pam
  ];

  cargoBuildFLags = [ "--workspace" ];
  doCheck = false;

  postInstall = ''
    mkdir -p $out/lib/security
    cp target/*/release/libpam_oo7.so $out/lib/security/pam_oo7.so
  '';

  meta = with lib; {
    description = "oo7-full";
    homepage = "https://github.com/linux-credentials/oo7";
    license = licenses.mit;
    mainProgram = "oo7-cli";
  };
}
