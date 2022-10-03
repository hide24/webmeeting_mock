<template>
  <div :key="locale">
    <v-app>
      <v-app-bar
        app
        style="z-index:4"
        color="#6A76AB"
        dark
        :key="this.$route.path"
      >
        <v-app-bar-title>
          <router-link :to="linkTo" class="toolbar-title">
            {{ title }}
          </router-link>
        </v-app-bar-title>
        <v-spacer></v-spacer>

        <v-menu
          left
          bottom
          offset-y
        >
          <template #activator="{ on, attrs }">
            <v-btn
              rounded
              v-bind="attrs"
              v-on="on"
              class="language-btn"
            >
              <v-icon class="mr-1">mdi-web</v-icon>Language
            </v-btn>
          </template>

          <v-list>
            <v-list-item
              key="japanese"
              @click=""
            >
              <v-list-item-title>{{ 'japanese' }}</v-list-item-title>
            </v-list-item>
            <v-list-item
              key="english"
              @click=""
            >
              <v-list-item-title>{{ 'english' }}</v-list-item-title>
            </v-list-item>
          </v-list>
        </v-menu>
      </v-app-bar>
      <v-main>
        <router-view ref="currentPage"></router-view>
        <div class="mb-4">&nbsp;</div>
      </v-main>
      <v-footer padless>
        <v-col class="font-weight-medium text-center" cols="12">
          <a href="/users">Users</a>
          <a href="/external_services">Services</a>
          <a href="/meetings">Meetings</a>
        </v-col>
      </v-footer>
    </v-app>
  </div>
</template>

<script>

export default {
  data() {
    return {
      locale: 'ja',
      title: 'service_name',
    }
  },
  computed: {
    id() {
      if(this.$route.params) {
        return this.$route.params.id
      } else {
        return null
      }
    },
    linkTo() {
      return '/'
    },
  },
  methods: {
    goHome() {
      this.$router.push({name: 'rootPage'})
    },
  },
  mounted() {
  },
}
</script>

<style>
.toolbar-title {
  color: inherit !important;
  text-decoration: none !important;
}
.v-app-bar-title__content {
  width: 500px !important;
}
.language-btn {
  height: 42px !important;
}
</style>
