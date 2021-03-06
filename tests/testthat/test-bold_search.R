# tests for bold_search fxn in taxize
context("bold_search")

test_that("col_search returns the correct value, dimensions, and classes", {
  skip_on_cran()

  a <- bold_search(name="Apis")
  b <- bold_search(name="Aga", fuzzy=TRUE)
  c <- bold_search(name=c("Apis","Puma concolor"))
  d <- bold_search(id=88899)

	expect_equal(names(a)[1], "input")
	expect_that(a$taxon, equals("Apis"))

  expect_that(dim(a), equals(c(1,8)))
  expect_that(dim(b)[2], equals(8))
  expect_that(dim(c), equals(c(2,8)))
  expect_that(dim(d), equals(c(1,7)))

	expect_that(a, is_a("data.frame"))
	expect_that(b, is_a("data.frame"))

	expect_that(a$tax_rank, is_a("character"))
	expect_that(d$parentname, is_a("character"))
})

test_that("bold_search is robust to user error", {
  skip_on_cran()

  expect_is(bold_search(name = "asdfsdf"), "data.frame")
  expect_is(bold_search(name = ""), "data.frame")
  expect_is(bold_search(id = "asdfsdf"), "data.frame")
  expect_error(bold_search())
})
