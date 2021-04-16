<?php
namespace Deployer;

require 'recipe/common.php';

task('deploy:staging', function() {
    writeln('<info>Deploying...</info>');
    #run('git pull');
});

// Project name
set('application', 'magento_utility');

// Project repository
set('repository', 'https://github.com/EspertoMagento/EspertoMagento.git');

// [Optional] Allocate tty for git clone. Default value is false.
set('git_tty', true); 

// Shared files/dirs between deploys 
set('shared_files', []);
set('shared_dirs', []);

// Writable dirs by web server 
set('writable_dirs', []);

task('current_path', function () {
    return run('pwd');
});

// Hosts
host('kontabo')       
    ->configFile('~/.ssh/config')
    ->stage('production')    
    ->set('deploy_path', '/home/deploy/ftp');
    
host('localhost')
    ->stage('dev')
    ->set('deploy_path', '/Volumes/MacintoshHD/Library/WebServer/Documents/EspertoMagento');
// Tasks

desc('Deploy your project');
task('deploy', [
    'deploy:info',
    'deploy:prepare',
    'deploy:lock',
    'deploy:release',
    'deploy:update_code',
    'deploy:shared',
    'deploy:writable',
    'deploy:vendors',
    'deploy:clear_paths',
    'deploy:symlink',
    'deploy:unlock',
    'cleanup',
    'success'
]);

// [Optional] If deploy fails automatically unlock.
after('deploy:failed', 'deploy:unlock');
