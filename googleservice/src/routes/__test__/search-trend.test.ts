import request from "supertest";
import { app, getScoreA, getScoreB } from "../../app";


it('should get A', () => {
  const result = getScoreA()

  // Assertion
  expect(result).toEqual('A')
})

it('should get B', () => {
  const result = getScoreB()

  // Assertion
  expect(result).toEqual('B')
})


// it('fail when not found keyword', async () => {
// 	// make a keyword
// 	const keyword = 'qwaszx';
// 	const response = await request(app)
// 		.get(`/api/google/search/trend/${keyword}`)
// 		.send()
// 		.expect(404);
  
//   expect(response.body).toEqual(undefined || {});
// });


// it("fetch with keyword google trends api", async () => {
//   // make a keyword
//   const keyword = "google";
//   const response = await request(app)
//     .get(`/api/google/search/trend/${keyword}`)
//     .send()
//     .expect(200);

//   expect(response.body).not.toEqual(undefined || {});
// });

