# --- EDGE_ADMIN_SECRET
resource "random_password" "initial_edge_admin_secret" {
  length           = 100
  special          = true
  upper            = true
  lower            = true
  numeric          = true
  min_special      = 1
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  override_special = "!@#$%^&*()_+-=[]{}:;<>/?"
}

resource "oci_vault_secret" "edge_admin_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_ADMIN_SECRET_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "Secret to encode/sign admin tokens"
   secret_content {
      content_type = "BASE64"
      content      = nonsensitive (base64encode(random_password.initial_edge_admin_secret.result))
   }
   lifecycle {
      ignore_changes = all
   }
}

# --- EDGE_BE_SESSION_SECRET
resource "random_password" "initial_edge_be_session_secret" {
  length           = 100
  special          = true
  upper            = true
  lower            = true
  numeric          = true
  min_special      = 1
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  override_special = "!@#$%^&*()_+-=[]{}:;<>/?"
}

resource "oci_vault_secret" "edge_be_session_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_BE_SESSION_SECRET_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "Secret to encode/sign backend session tokens"
   secret_content {
      content_type = "BASE64"
      content      = base64encode(random_password.initial_edge_be_session_secret.result)
   }
   lifecycle {
      ignore_changes = all
   }
}

# --- EDGE_BE_AUTH_SECRET
resource "random_password" "initial_edge_be_auth_secret" {
  length           = 100
  special          = true
  upper            = true
  lower            = true
  numeric          = true
  min_special      = 1
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  override_special = "!@#$%^&*()_+-=[]{}:;<>/?"
}

resource "oci_vault_secret" "edge_be_auth_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_BE_AUTH_SECRET_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "Secret to encode/sign backend auth tokens"
   secret_content {
      content_type = "BASE64"
      content      = base64encode(random_password.initial_edge_be_auth_secret.result)
   }
   lifecycle {
      ignore_changes = all
   }
}

# --- EDGE_SESSION_SECRET
resource "random_password" "initial_edge_session_secret" {
  length           = 100
  special          = true
  upper            = true
  lower            = true
  numeric          = true
  min_special      = 1
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  override_special = "!@#$%^&*()_+-=[]{}:;<>/?"
}

resource "oci_vault_secret" "session_edge_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_SESSION_SECRET_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "Secret to encode/sign session tokens"
   secret_content {
      content_type = "BASE64"
      content      = base64encode(random_password.initial_edge_session_secret.result)
   }
   lifecycle {
      ignore_changes = all
   }
}

# --- EDGE_ORG_TOKEN_PUBKEY_PEM
resource "oci_vault_secret" "org_token_pubkey_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_DX_ORGTOKEN_PUBKEY_PEM_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "DACSLABS orgToken public key in PEM format"
   secret_content {
      content_type = "BASE64"
      content      = local.orgTokenPubKeyB64[local.env]
   }
   lifecycle {
      ignore_changes = all
   }
}

# --- EDGE_IB_SECRET
resource "random_password" "initial_edge_ib_secret" {
  length           = 100
  special          = true
  upper            = true
  lower            = true
  numeric          = true
  min_special      = 1
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  override_special = "!@#$%^&*()_+-=[]{}:;<>/?"
}

resource "oci_vault_secret" "edge_ib_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_IB_SECRET_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "Secret to encode/sign ib session tokens"
   secret_content {
      content_type = "BASE64"
      content      = base64encode(random_password.initial_edge_ib_secret.result)
   }
   lifecycle {
      ignore_changes = all
   }
}


# --- EDGE_AUTH_SECRET
resource "random_password" "initial_edge_auth_secret" {
  length           = 100
  special          = true
  upper            = true
  lower            = true
  numeric          = true
  min_special      = 1
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  override_special = "!@#$%^&*()_+-=[]{}:;<>/?"
}

resource "oci_vault_secret" "edge_auth_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_AUTH_SECRET_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "Secret to encode/sign auth tokens"
   secret_content {
      content_type = "BASE64"
      content      = base64encode(random_password.initial_edge_auth_secret.result)
   }
   lifecycle {
      ignore_changes = all
   }
}

# --- EDGE_ORG_SECRET
#     (aes-256-cbc algorithm: fixed key length: 32 bytes)
resource "random_password" "initial_edge_org_secret" {
  length           = 32
  special          = false
  upper            = true
  lower            = true
  numeric          = true
  min_special      = 0
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  override_special = "!@#$%^&*()_+-=[]{}:;<>/?"
}

resource "oci_vault_secret" "edge_org_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_ORG_SECRET_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "Secret to encrypt/decrypt organization passphrases"
   secret_content {
      content_type = "BASE64"
      content      = base64encode(random_password.initial_edge_org_secret.result)
   }
   lifecycle {
      ignore_changes = all
   }
}

# --- EDGE_ENGINE_BASE_URL
resource "oci_vault_secret" "edge_engine_baseurl_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_ENGINE_BASE_URL_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "URL to access the ROCKIT Engine"
   secret_content {
      content_type = "BASE64"
      content      = base64encode (var.EDGE_ENGINE_BASE_URL)
   }
   lifecycle {
      ignore_changes = all
   }
}

# --- EDGE_ENGINE_ADMIN_TOKEN
resource "oci_vault_secret" "edge_engine_admin_token_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_ENGINE_ADMIN_TOKEN_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "ROCKIT Engine admin token"
   secret_content {
      content_type = "BASE64"
      content      = base64encode (var.EDGE_ENGINE_ADMIN_TOKEN)
   }
   lifecycle {
      ignore_changes = all
   }
}


# --- EDGE_ENGINE_SUBSCRIPTION_SECRET
resource "random_password" "initial_edge_engine_subscription_secret" {
  length           = 100
  special          = true
  upper            = true
  lower            = true
  numeric          = true
  min_special      = 1
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  override_special = "!@#$%^&*()_+-=[]{}:;<>/?"
}

resource "oci_vault_secret" "edge_engine_subscription_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_ENGINE_SUBSCRIPTION_SECRET_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "Secret to encode/sign engine subscription tokens"
   secret_content {
      content_type = "BASE64"
      content      = base64encode(random_password.initial_edge_engine_subscription_secret.result)
   }
   lifecycle {
      ignore_changes = all
   }
}

# --- EDGE_DEPLOYMENTS_SECRET
#     (aes-256-cbc algorithm: fixed key length: 32 bytes)
resource "random_password" "initial_edge_deployment_secret" {
  length           = 32
  special          = false
  upper            = true
  lower            = true
  numeric          = true
  min_special      = 0
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  override_special = "!@#$%^&*()_+-=[]{}:;<>/?"
}

resource "oci_vault_secret" "edge_deployment_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_DEPLOYMENT_SECRET_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "Secret to encode deployments"
   secret_content {
      content_type = "BASE64"
      content      = base64encode(random_password.initial_edge_deployment_secret.result)
   }
   lifecycle {
      ignore_changes = all
   }
}

# --- EDGE_SLACK_TOKEN
resource "oci_vault_secret" "edge_slack_token_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_SLACK_TOKEN_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "Slack token to post messages to workspace"
   secret_content {
      content_type = "BASE64"
      content      = base64encode (var.EDGE_SLACK_TOKEN)
   }
   lifecycle {
      ignore_changes = all
   }
}

# --- EDGE_SLACK_INFO_CHANNEL
resource "oci_vault_secret" "edge_slack_info_channel_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_SLACK_INFO_CHANNEL_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "Slack info channel"
   secret_content {
      content_type = "BASE64"
      content      = base64encode (var.EDGE_SLACK_INFO_CHANNEL)
   }
   lifecycle {
      ignore_changes = all
   }
}

# --- EDGE_SLACK_ADMIN_CHANNEL
resource "oci_vault_secret" "edge_slack_admin_channel_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_SLACK_ADMIN_CHANNEL_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "Slack admin channel"
   secret_content {
      content_type = "BASE64"
      content      = base64encode (var.EDGE_SLACK_ADMIN_CHANNEL)
   }
   lifecycle {
      ignore_changes = all
   }
}

# --- EDGE_SLACK_ERROR_CHANNEL
resource "oci_vault_secret" "edge_slack_error_channel_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_SLACK_ERROR_CHANNEL_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "Slack error channel"
   secret_content {
      content_type = "BASE64"
      content      = base64encode (var.EDGE_SLACK_ERROR_CHANNEL)
   }
   lifecycle {
      ignore_changes = all
   }
}

# --- EDGE_DB_PW
resource "random_password" "edge_db_pw" {
  length           = 20
  special          = false
  upper            = true
  lower            = true
  numeric          = true
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
}

resource "oci_vault_secret" "edge_db_pw_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_DB_PW_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "MongoDB password"
   secret_content {
      content_type = "BASE64"
      content      = base64encode(random_password.edge_db_pw.result)
   }
   lifecycle {
      ignore_changes = all
   }
}

data "oci_secrets_secretbundle" "edge_db_pw_secret" {
   secret_id = oci_vault_secret.edge_db_pw_secret.id
}

# --- EDGE_DB_CONNSTR
resource "oci_vault_secret" "edge_db_connstr_secret" {
   depends_on = [
      mongodbatlas_cluster.edge_mongodb_cluster  # for $local.mongodb_connstr}
   ]
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_DB_CONNSTR_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "MongoDB connection string"
   secret_content {
      content_type = "BASE64"
      content      = base64encode(local.mongodb_connstr)
   }
   lifecycle {
      ignore_changes = all
   }
}

# --- TRC_BUCKET_READWRITE_URL_
resource "oci_vault_secret" "edge_trc_bucket_rw_url_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_TRC_BUCKET_READWRITE_URL_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "Download/upload URL to access the trc bucket"
   secret_content {
      content_type = "BASE64"
      content      = base64encode(local.edge_trc_bucket_readwrite_url)
   }
   lifecycle {
      ignore_changes = all
   }
}

# --- DEPS_BUCKET_READWRITE_URL_
resource "oci_vault_secret" "edge_deps_bucket_rw_url_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_DEPS_BUCKET_READWRITE_URL_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "Download/upload URL to access the deps bucket"
   secret_content {
      content_type = "BASE64"
      content      = base64encode(local.edge_deps_bucket_readwrite_url)
   }
   lifecycle {
      ignore_changes = all
   }
}

# --- EDGE_ASSETS_BUCKET_READWRITE_URL
resource "oci_vault_secret" "edge_assets_bucket_rw_url_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_ASSETS_BUCKET_READWRITE_URL_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "Download/upload URL to access the assets bucket"
   secret_content {
      content_type = "BASE64"
      content      = base64encode(local.edge_assets_bucket_readwrite_url)
   }
   lifecycle {
      ignore_changes = all
   }
}


# --- EDGE_ORG_ADMIN_SECRET
resource "random_password" "initial_edge_org_admin_secret" {
  length           = 100
  special          = true
  upper            = true
  lower            = true
  numeric          = true
  min_special      = 1
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  override_special = "!@#$%^&*()_+-=[]{}:;<>/?"
}

resource "oci_vault_secret" "edge_org_admin_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_ORG_ADMIN_SECRET_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "Secret to encode/sign organization admin tokens"
   secret_content {
      content_type = "BASE64"
      content      = base64encode(random_password.initial_edge_org_admin_secret.result)
   }
   lifecycle {
      ignore_changes = all
   }
}

# --- EDGE_CLIENT_SECRET
resource "random_password" "initial_edge_client_secret" {
  length           = 100
  special          = true
  upper            = true
  lower            = true
  numeric          = true
  min_special      = 1
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  override_special = "!@#$%^&*()_+-=[]{}:;<>/?"
}

resource "oci_vault_secret" "edge_client_secret" {
   compartment_id = oci_identity_compartment.edge_comp.id
   vault_id       = var.EDGE_VAULT_OCID
   key_id         = var.EDGE_VAULT_KEY_OCID
   secret_name    = nonsensitive ("EDGE_CLIENT_SECRET_${local.WORKSPACE}.${random_password.edge_instance_id.result}")
   description    = "Secret to encode/sign ROCKIT Client tokens"
   secret_content {
      content_type = "BASE64"
      content      = base64encode(random_password.initial_edge_client_secret.result)
   }
   lifecycle {
      ignore_changes = all
   }
}

resource "time_sleep" "edge_wait_for_secrets" {
  depends_on = [
     oci_vault_secret.edge_admin_secret,
     oci_vault_secret.edge_be_session_secret,
     oci_vault_secret.edge_be_auth_secret,
     oci_vault_secret.session_edge_secret,
     oci_vault_secret.edge_ib_secret,
     oci_vault_secret.edge_auth_secret,
     oci_vault_secret.edge_org_secret,
     oci_vault_secret.edge_engine_baseurl_secret,
     oci_vault_secret.edge_engine_admin_token_secret,
     oci_vault_secret.edge_engine_subscription_secret,
     oci_vault_secret.edge_deployment_secret,
     oci_vault_secret.edge_slack_token_secret,
     oci_vault_secret.edge_slack_info_channel_secret,
     oci_vault_secret.edge_slack_error_channel_secret,
     oci_vault_secret.edge_db_pw_secret,
     oci_vault_secret.edge_db_connstr_secret,
     oci_vault_secret.edge_trc_bucket_rw_url_secret,
     oci_vault_secret.edge_deps_bucket_rw_url_secret,
     oci_vault_secret.edge_assets_bucket_rw_url_secret,
     oci_vault_secret.edge_org_admin_secret,
     oci_vault_secret.edge_client_secret
  ]
  create_duration = "10s"
}