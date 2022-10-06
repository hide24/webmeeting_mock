<template>
  <div class="text-center">
    <v-dialog
      v-model="dialog"
      width="500"
      scrollable
    >
      <v-card>
        <v-card-title class="text-h5 grey lighten-2">
          Web会議サービス連携
        </v-card-title>

        <v-card-text>
          {{ user.display_name }}の{{ service.service_name }}アカウントとの連携に失敗しました。
          {{ user.display_name }}の{{ service.service_name }}アカウント名を入力するか「{{ service.service_name }}をゲストとして利用する」を選択してください。

          <v-row dense class="mt-2">
            <v-col
              cols="12"
            >
              <div class="h5">{{ service.service_name }}アカウント名</div>

              <v-text-field
                dense
                outlined
                autofocus
                v-model="extraAccount"
              ></v-text-field>
            </v-col>
          </v-row>

          <v-row dense>
            <v-col
              cols="12"
              text
            >
            <v-btn
              text
              @click="close"
            >{{ service.service_name }}をゲストとして利用する</v-btn>
            </v-col>
          </v-row>

        </v-card-text>

        <v-divider></v-divider>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            tile
            @click="addUserCanceled"
          >
            キャンセル
          </v-btn>
          <v-btn
            color="primary"
            tile
            @click="close"
          >
            登録
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      user: {},
      service: {},
      dialog: false,
      extraAccount: '',
    }
  },
  computed: {
  },
  methods: {
    open(user, service) {
      this.user = user
      this.service = service
      this.dialog = true
    },
    close() {
      this.dialog = false
    },
    addUserCanceled() {
      this.$emit('cancelEvent')
      this.close()
    },
  },
}
</script>

<style scoped>
</style>
