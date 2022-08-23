box::use(
  testthat[...],
)

box::use(
  app/logic/data[filter_species],
)

test_that("filter_species() works", {
  data <- data.frame(
    Id = c(1, 2, 3),
    Species = c("A", "B", "A")
  )
  expect_identical(filter_species(data, "A")$Id, c(1, 3))
  expect_identical(filter_species(data, "B")$Id, 2)
  expect_identical(filter_species(data, "C")$Id, numeric())
})
