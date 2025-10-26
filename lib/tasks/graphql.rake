namespace :graphql do
  desc "Export GraphQL schema to schema.graphql"
  task dump_schema: :environment do
    schema_string = TemplateSchema.to_definition
    File.write(Rails.root.join('schema.graphql'), schema_string)
    puts "✓ Schema exported to schema.graphql"
  end
end