open Jest

let () = {
  Only.test("Only.test", () => pass)

  Only.testAsync("Only.testAsync", finish => finish(pass))
  Only.testAsync("testAsync - timeout ok", ~timeout=1, finish => finish(pass))

  Only.testPromise("Only.testPromise", () => Js.Promise2.resolve(pass))
  Only.testPromise("testPromise - timeout ok", ~timeout=1, () => Js.Promise2.resolve(pass))

  Only.testAll("testAll", list{"foo", "bar", "baz"}, input =>
    if Js.String.length(input) === 3 {
      pass
    } else {
      fail("")
    }
  )
  Only.testAll("testAll - tuples", list{("foo", 3), ("barbaz", 6), ("bananas!", 8)}, ((
    input,
    output,
  )) =>
    if Js.String.length(input) === output {
      pass
    } else {
      fail("")
    }
  )
  Only.testAllPromise("testAllPromise", list{"foo", "bar", "baz"}, input =>
    Js.Promise2.resolve(
      if Js.String.length(input) === 3 {
        pass
      } else {
        fail("")
      },
    )
  )
  Only.testAllPromise(
    "testAllPromise - tuples",
    list{("foo", 3), ("barbaz", 6), ("bananas!", 8)},
    ((input, output)) =>
      Js.Promise2.resolve(
        if Js.String.length(input) === output {
          pass
        } else {
          fail("")
        },
      ),
  )

  Only.describe("Only.describe", () => test("some aspect", () => pass))
}
