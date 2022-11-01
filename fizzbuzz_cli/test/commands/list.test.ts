import {expect, test} from '@oclif/test'

describe('list', () => {
  test.stdout({print: true}).command(
    ['list', '--page=5432', '--per-page=2'],
  ).it('prints results reading page and per page flags', ctx => {
    const expectedJson = {
      numbers: [
        {number: 10_863, favourite: false, result: 'Fizz'},
        {number: 10_864, favourite: false, result: '10864'},
      ],
    }

    expect(JSON.parse(ctx.stdout)).to.deep.equal(expectedJson)
  })
})
