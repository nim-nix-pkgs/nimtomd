{
  description = ''Convert Nim code and files to Markdown'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-nimtomd-v0_2_1.flake = false;
  inputs.src-nimtomd-v0_2_1.owner = "ThomasTJdev";
  inputs.src-nimtomd-v0_2_1.ref   = "v0_2_1";
  inputs.src-nimtomd-v0_2_1.repo  = "nimtomd";
  inputs.src-nimtomd-v0_2_1.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-nimtomd-v0_2_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-nimtomd-v0_2_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}