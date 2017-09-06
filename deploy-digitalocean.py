#!/usr/bin/env python2.7
''' Deploy 41h to Digital Ocean. '''

import sys
import time
import logging
import click
import digitalocean


@click.command()
@click.option('--api-token', help='Digital Ocean API Token')
@click.option(
    '--region',
    help='Region to deploy into (default: sfo1)',
    default='sfo1'
)
@click.option(
    '--size',
    help='Size of droplet to deploy (default: 48gb)',
    default='48gb'
)
@click.option(
    '--cloud-config',
    help='The user-data / cloud-config to use (default: cloud-config.yaml)',
    default='cloud-config.yaml'
)
def main(api_token, region, size, cloud_config):
    ''' Attempts to deploy a 41h instance to Digital Ocean. '''
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s - %(process)d - [%(levelname)s] %(message)s'
    )
    log = logging.getLogger()

    # Ensure a token was provided.
    if api_token is None:
        log.error('No API token provided in call, cannot continue!')
        sys.exit(-1)

    # Read in user-data.
    log.info('Attempting to read user-data from %s', cloud_config)
    with open(cloud_config, 'r') as hndl:
        user_data = hndl.read()

    # Launch.
    log.info('Attempting to create %s droplet in %s', size, region)
    droplet = digitalocean.Droplet(
        name='41h-ctf',
        token=api_token,
        image='ubuntu-16-04-x64',
        region=region,
        size_slug=size,
        user_data=user_data,
    )
    droplet.create()
    log.info('Droplet launched!')

    # Start monitoring until built.
    running = False
    while not running:
        actions = droplet.get_actions()
        for action in actions:
            action.load()

            # Check whether the droplet is up.
            if action.status == 'completed':
                running = True
                log.info('Droplet is up!')
                break

            # Otherwise wait and try again soon.
            log.info('Droplet still in state %s', action.status)
            time.sleep(10)

    # Print IP and exit.
    droplet.load()
    log.info('New 41h host should be running at %s', droplet.ip_address)


if __name__ == '__main__':
    main()
