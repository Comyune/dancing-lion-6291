import {Command, Flags} from '@oclif/core'
import Config from '../config'
import fetch from 'node-fetch'

export default class Save extends Command {
  static description = 'Saves a FizzBuzz number as a favourite.'
  static examples = ['$ fizzbuss save 1234']

  static flags = {
    host: Flags.string({
      char: 'h',
      description: 'Host server location',
      default: Config.defaultHost(),
    }),
  }

  static args = [{
    name: 'number',
    description: 'The number you wish to save.',
    required: true,
  }]

  async run(): Promise<void> {
    const {flags, args} = await this.parse(Save)
    const url = `${flags.host}/api/`

    try {
      const response = await fetch(url, {
        method: 'POST',
        body: JSON.stringify({favourite: args.number}),
        headers: {'Content-Type': 'application/json'},
      })

      this.log(JSON.stringify(await response.json()))
    } catch (error) {
      this.error(`Could not save favourite number.\n    ${error}`)
    }
  }
}
