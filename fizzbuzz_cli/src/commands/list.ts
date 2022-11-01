import {Command, Flags} from '@oclif/core'
import Config from '../config'
import fetch from 'node-fetch'

export default class List extends Command {
  static description = 'Lists FizzBuzz results for a given page and per_page value.'
  static examples = ['$ fizzbuss list --page 123 --per-page 1000']

  static flags = {
    host: Flags.string({
      char: 'h',
      description: 'Host server location',
      default: Config.defaultHost(),
    }),

    page: Flags.string({
      char: 'p',
      description: 'Page you require',
      default: '1',
    }),

    'per-page': Flags.string({
      char: 'l',
      description: 'Items per page',
      default: '100',
    }),
  }

  async run(): Promise<void> {
    const {flags} = await this.parse(List)
    const url = `${flags.host}/api/?page=${flags.page}&per_page=${flags['per-page']}`

    try {
      const response = await fetch(url)
      this.log(JSON.stringify(await response.json()))
    } catch (error) {
      this.error(`Could not retrieve numbers from server.\n    ${error}`)
    }
  }
}
