{ pkgs, hostname, ... }:

{
  services = {
    displayManager = {
      sessionPackages = with pkgs; [
        mangowc # mangowc provides no session file for dm by default 
      ];
      ly.enable=true;
    };
    xserver = {
      xkb = {
        layout = "us";
        variant = "";
      };
    };
#    nextjs-ollama-llm-ui.enable=true;
#    nextjs-ollama-llm-ui.hostname="0.0.0.0";
#    ollama = {
#      enable = true;
#      package = pkgs.ollama-rocm;
#      acceleration = "rocm";
#    rocmOverrideGfx = "10.3.0";
#
#      syncModels = true;
#      loadModels = [ 
#        "glm-4.7-flash:q4_K_M" 
#        "phi4-reasoning:14b-q4_K_M"
#        "phi4:14b-q4_K_M"
#        "hf.co/bartowski/TheDrummer_Skyfall-31B-v4.2-GGUF:Q4_K_S"
#       "hf.co/Qwen/Qwen3.6-35B-A3B:Q4_K_S"
#      ];
#      environmentVariables = {
#        OLLAMA_FLASH_ATTENTION = "1";
#        OLLAMA_NUM_PARALLEL = "3";
#        OLLAMA_MAX_LOADED_MODELS= "1";
#        OLLAMA_KEEP_ALIVE = "10m";
#        OLLAMA_CONTEXT_LENGTH = "10512";
#      };
#    };
    # 1. Enable the Tailscale service
  tailscale.enable = true;

  # 2. Automate IP forwarding and firewall rules
  tailscale.useRoutingFeatures = "both"; 



  };
  services.open-webui = {
    enable = true;
    host = "0.0.0.0"; 
    port = 8080;
  };
services.sunshine.enable = true;
security.polkit.enable = true;
  # polkit rule to allow starting corectrl for user in wheel group without needing password
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if ((action.id == "org.corectrl.helper.init" || action.id == "org.corectrl.helperkiller.init") &&
            subject.local == true &&
            subject.active == true &&
            subject.isInGroup("wheel")) {
        return polkit.Result.YES;
      }
    });
  '';
systemd.user.services.polkit-gnome-authentication-agent-1 = {
  description = "polkit-gnome-authentication-agent-1";
  wantedBy = [ "graphical-session.target" ];
  wants = [ "graphical-session.target" ];
  after = [ "graphical-session.target" ];
  serviceConfig = {
    Type = "simple";
    ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    Restart = "on-failure";
    RestartSec = 1;
    TimeoutStopSec = 10;
  };
};
}
