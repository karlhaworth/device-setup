brew tap sdkman/tap
brew install sdkman-cli
export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

sdk install java 17.0.12-tem
sdk use java 17.0.12-tem
sdk default java 17.0.12-tem

sdk install maven
sdk default maven

sdk install gradle
sdk default gradle

brew install intellij-idea

idea installPlugins io.snyk-intelli-plugin org.sonarlint.idea com.github.copilot