function setupEnv()
%SETUPENV Configure the Java environment for the SDMX toolbox.
%
%   sdmx.setupEnv() adds the bundled SDMX Java archive to MATLAB's
%   dynamic Java class path when it is not already present.

% Get java dynamic path
djp = javaclasspath("-dynamic");

% Get location of JAR file
sdmxRoot = fileparts(fileparts(mfilename('fullpath')));
jarPath = fullfile(sdmxRoot, 'lib', 'SDMX.jar');

if ~isfile(jarPath)
    error('sdmx:setupEnv:missingJar', 'The JAR file is missing, please reinstall the toolbox');
end

if ~any(contains(djp, jarPath))
    % JAR not in path, add it
    javaaddpath(jarPath);
end