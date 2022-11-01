import {Command, Flags} from '@oclif/core'
import Config from '../config'
import fetch from 'node-fetch'

export default class Remove extends Command {
  static description = 'Removes a FizzBuzz number as a favourite.'
  static examples = ['$ fizzbuss remove 1234']

  static flags = {
    host: Flags.string({
      char: 'h',
      description: 'Host server location',
      default: Config.defaultHost(),
    }),
  }

  static args = [{
    name: 'number',
    description: 'The number you wish to remove.',
    required: true,
  }]

  async run(): Promise<void> {
    const {flags, args} = await this.parse(Remove)
    const url = `${flags.host}/api/${args.number}`

    try {
      const response = await fetch(url, {method: 'DELETE'})
      this.log(JSON.stringify(await response.json()))
    } catch (error) {
      this.error(`Could not remove favourite number.\n    ${error}`)
    }
  }
}
