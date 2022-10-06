<template>
  <div class="text-center">
    <v-dialog
      v-model="dialog"
      width="500"
      scrollable
    >
      <v-card>
        <v-card-title class="text-h5 grey lighten-2">
          新規参加者登録
        </v-card-title>

        <v-card-text>
          会議に新規参加者を招待します。
          参加者の情報を登録してください。

          <v-row dense>
            <v-col
              cols="12"
            >
              <div class="h5">表示名</div>

              <v-text-field
                dense
                outlined
                autofocus
                v-model="user.display_name"
              ></v-text-field>
            </v-col>
          </v-row>

          <v-row dense>
            <v-col
              cols="12"
            >
              <div class="h5">メールアドレス</div>

              <v-text-field
                dense
                outlined
                v-model="user.mail"
              ></v-text-field>
            </v-col>
          </v-row>

          <v-row v-if="externalLink"
            dense
            class="mt-2"
          >
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
                @click="addUser"
              >{{ service.service_name }}をゲストとして利用する</v-btn>
              </v-col>
            </v-row>

          </v-row>

        </v-card-text>

        <v-divider></v-divider>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            color="secandary"
            tile
            @click="addUserCanceled"
          >
            キャンセル
          </v-btn>
          <v-btn
            color="primary"
            tile
            @click="addUser"
          >
            追加
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import { UserApi } from 'services/ApiService'

export default {
  data() {
    return {
      user: {guest: true},
      service: {},
      externalLink: false,
      dialog: false,
    }
  },
  computed: {
  },
  methods: {
    open(service) {
      this.user = {guest: true}
      this.service = service
      this.dialog = true
      this.externalLink = false
    },
    close() {
      this.dialog = false
    },
    addUser() {
      if(!this.externalLink) {
        this.externalLink = true
        return
      }
      UserApi.create(this.user)
      .then(response => {
        const newUser = response.data
        this.$toasted.show('会議参加者情報を登録しました。')
        this.$emit('addEvent', newUser.id)
        this.close()
      })
      .catch(e => {
        this.$toasted.error('会議参加者情報の登録に失敗しました。')
      })
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
