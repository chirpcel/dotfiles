{
  fetchFromGitHub,
  lib,
  pkg-config,
  rustPlatform,
  testers,
  pam,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "oo7";
  version = "0.6.0";
  src = fetchFromGitHub {
    owner = "linux-credentials";
    repo = "oo7";
    tag = finalAttrs.version;
    hash = "sha256-FPt37KEap7z1ant+6VHqqFBRwwE4YV3yQrc0V/kd+Mo=";
  };
  buildAndTestSubdir = "pam";
  cargoHash = "sha256-79bSlSbDaOtAXsJe1suMhvhsC/LoSDMZ+G/dhTTQ4EA=";
  nativeBuildInputs = [
    pkg-config
    pam
  ];
  meta = {
    description = "James Bond went on a new mission as a Secret Service provider (PAM)";
    homepage = "https://github.com/linux-credentials/oo7";
    changelog = "https://github.com/linux-credentials/oo7/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      getchoo
      Scrumplex
    ];
    platforms = lib.platforms.linux;
  };
})
