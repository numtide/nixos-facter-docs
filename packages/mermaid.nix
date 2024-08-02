{
  pkgs,
  pname,
  version ? "10.9.1",
  srcHash ? "sha256-JoMmFJd6TkYwn8td/io4Tz3KJKvjE7bmO7Y19urTPaU=",
  depsHash ? "sha256-M4H0JuEkOD8GvZ6wXIiiZbv6UzJxGA94SPZ22w4qVSA=",
  ...
}:
pkgs.stdenv.mkDerivation (final: {
  inherit pname version;

  src = pkgs.fetchFromGitHub {
    owner = "mermaid-js";
    repo = "mermaid";
    rev = "v${version}";
    hash = srcHash;
  };

  pnpmDeps = pkgs.pnpm.fetchDeps {
    inherit (final) pname version src;
    hash = depsHash;
  };

  nativeBuildInputs = [ pkgs.pnpm.configHook ];

  buildInputs = [ pkgs.nodejs ];

  buildPhase = ''
    runHook preBuild
    pnpm build:mermaid
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mv packages/mermaid/dist $out
    runHook postInstall
  '';
})
