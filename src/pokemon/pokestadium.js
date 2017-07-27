// @flow

export default class Pokestadium {
    constructor ({ id, name, isShiny }: Object) {
        this.id = id;
        this.name = (name !== undefined) ? name : 'bulbasaur';
        this.isShiny = isShiny;
        this.pokestudiumName = this.createPokestudiumName(); // pokestudium.com用の名前
    }

    // pokestudium.com用の名前を作成する
    // ※形態変化があるポケモンはPokeAPIでは名前の後ろに'-'がついて画像名にそのまま使えない。
    createPokestudiumName (): string {
        if (Pokestadium.CHANGE_NAME_ARR.deletHyphen.indexOf(this.id) !== -1) {
            return this.name.replace(/-/, '');
        } else if (Pokestadium.CHANGE_NAME_ARR.deleteHyphenBack.indexOf(this.id) !== -1) {
            return this.name.replace(/(-)(.*)/, '');
        }
        return this.name;
    }

    // 画像パスを返却する
    getImgPath (): string {
        if (this.isShiny) {
            return `${Pokestadium.PATH.url}${Pokestadium.PATH.shiny}${this.pokestudiumName}.${Pokestadium.PATH.fileType}`;
        } else {
            return `${Pokestadium.PATH.url}${this.pokestudiumName}.${Pokestadium.PATH.fileType}`;
        }
    }

    // 画像path
    static get PATH (): Object {
        return {
            url: 'http://www.pokestadium.com/sprites/xy/',
            fileType: 'gif',
            shiny: 'shiny/'
        };
    }

    // 名前変換が必要なポケモンの種類分け
    static get CHANGE_NAME_ARR (): Object {
        return {
            deletHyphen: [ // ハイフンのみを削除
                29, // ニドラン♀
                32 // ニドラン♂
            ],
            deleteHyphenBack: [ // ハイフンから後ろを削除
                386, // デオキシス
                413, // ミノマダム
                487, // ギラティナ
                492, // シェイミ
                550, // バスラオ
                555, // ヒヒダルマ
                641, // トルネロス
                642, // ボルドロス
                645, // ランドロス
                647, // ケルディオ
                648, // メロエッタ
                678, // ニャオニクス
                681, // ギルガルド
                710, // バケッチャ
                711 // パンプジン
            ]
        };
    }
}
