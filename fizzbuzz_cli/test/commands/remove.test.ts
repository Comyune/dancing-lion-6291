import {expect, test} from '@oclif/test'

describe('remove', () => {
  test.stdout({print: true}).command(
    ['remove', '5432'],
  ).it('prints result from server', ctx => {
    const expectedJson = {deleted: true, number: 5432, favourite: true, result: '5432'}
    expect(JSON.parse(ctx.stdout)).to.deep.equal(expectedJson)
  })
})
