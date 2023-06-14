output "container_id" {
  value       = docker_container.nginx_container.id
  description = "The container ID"
}