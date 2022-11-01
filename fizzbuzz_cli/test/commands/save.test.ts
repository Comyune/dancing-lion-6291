import {expect, test} from '@oclif/test'

describe('save', () => {
  test.stdout({print: true}).command(
    ['save', '5432'],
  ).it('prints result from server', ctx => {
    const expectedJson = {number: 5432, favourite: true, result: '5432'}
    expect(JSON.parse(ctx.stdout)).to.deep.equal(expectedJson)
  })
})
