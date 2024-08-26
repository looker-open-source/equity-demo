project_name: "crypto-mvp-kirby"

constant: database {
  value: "starry-center-349620"
}

constant: connection {
  value: "google_demo_-_backseat"
}

visualization: {
  id: "crytp_heatmap"
  label: "Crypto Heatmap"
  file: "crypto_heat.js"
}

visualization: {
  id: "hello_world"
  label: "Hello World"
  file: "hello_world.js"
  # url: "https://localhost:8081/looker_hello_world_viz_min.js"
}

visualization: {
  id: "crypto_data_card"
  label:"Crypto Data Card"
  file: "crypto_data_card.js"
  }

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
