<?php
namespace Deployer;

require 'recipe/common.php';

task('deploy:clone', function() {
    writeln('<info>Clone Repository...</info>');
    run('cd {{app_dir}}/ && git clone {{repository}}');
});

task('deploy:pull', function() {
    writeln('<info>Pull repository...</info>');
    run('cd {{app_dir}}/{{application}} && git pull');
});

// Project name
set('application', 'EspertoMagento');

// Project name
set('app_dir', '/home/deploy/ftp/scripts');

// Project repository
set('repository', 'https://github.com/EspertoMagento/EspertoMagento.git');

// Local path
set('local_path', '/Volumes/MacintoshHD/Library/WebServer/Documents/Espertomagento');

// [Optional] Allocate tty for git clone. Default value is false.
set('git_tty', true); 

// Shared files/dirs between deploys 
//set('shared_files', []);
//set('shared_dirs', []);

// Writable dirs by web server 
//set('writable_dirs', []);

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
    ->set('deploy_path', '/Volumes/MacintoshHD/Library/WebServer/Documents/EspertoMagento')
    ->identityFile('~/.ssh/id_rsa');

// Tasks
task( 'deploy:link', function() {
    run( 'ln -sfn {{deploy_path}}/current {{app_dir}}/{{application}}' );
} );


task ('local:prepare', function(){
    writeln('<info>Change directory to Local app...</info>');
    run('cd {{local_path}}'); 
});

task('local:push', function() {
    //run('cd {{current_path}}');
    writeln('<info>Add files to repository...</info>');
    run('git add -u');
    writeln('<info>Commit files to repository...</info>');
    run('git commit -m "new commit" && git push');
    writeln('<info>Push completed!</info>');
});


desc('Deploy on local');
task('local', [
    'local:prepare',
    'local:push'
]); 

set('release_path', "{{app_dir}}");
desc('Deploy your project');
task('deploy', [
    'deploy:info',
    'deploy:prepare',
    'deploy:lock',
    'deploy:release',
    'deploy:update_code',
    //'deploy:shared',
    //'deploy:writable',
    //'deploy:vendors',
    'deploy:clear_paths',
    //'deploy:symlink',
    'deploy:link',
    'deploy:unlock',
    'cleanup',
    'success'
]);

// [Optional] If deploy fails automatically unlock.
after('deploy:failed', 'deploy:unlock');
