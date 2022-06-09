Return-Path: <SRS0=xbdU=WQ=gmail.com=maccraft123mc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837C7C43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 13:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69978C3411D; Thu,  9 Jun 2022 13:58:05 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C576C34114;
	Thu,  9 Jun 2022 13:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C576C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id c14so21864084pgu.13;
        Thu, 09 Jun 2022 06:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=96RW/mbL/2DXM4l3I73TuzvCiuTWdOKUYU3PG/oUzAI=;
        b=SlFMlYBtIJ/K5g5OCznvRlvul8d4SV8HRB+pG+lzVNyUqxOFclbbfZLuxq27CIKtyu
         4N3BPrpxDld8pG00PIuA20mHxX0oz9kBlygD0ZmiXuBxS6erJ7D4pRMjsPDqogyuvNzV
         bGSm2yOWc4m1fJZnW0KJcbqwV8wqK4A7bwKydp8hisrUK7uUX5p4Y1+6e3RxDcTwDQLs
         kwt0/PgrFHTlaDUr0PMxb44X2P2I0USvSdyyM4CGSTEXg7BSxAiWkASIx1V7KtW9yVv5
         6qKG9qEAD5AUWQih6Gez6cBRLwO2XjvHivcBP3g6/YbREDinrcn0csMsXHoRPc148rzu
         zlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=96RW/mbL/2DXM4l3I73TuzvCiuTWdOKUYU3PG/oUzAI=;
        b=dGPJucV3Ede5cQcxSOwlur6is4hnAB7mYP/brd6RlCwVeYEIlJoGgkG4LA0TH61w5w
         6B+ascVrxUIjVp2bKux2B0A8OcTekmJ2ubkWMAC7lfPZeNUzKx85Le9o2O2XIF1Qs9hz
         gIg+TdCWgbEpWRhBo8fXBDQIUqybHvj+Mhv5cxV1sG1CtOVV4+buEkF7/tQrxX5tVBtO
         WxHIxqaIZaTXe6unB/l3YvY3IRoU6tlAhpZlgLqQJ26Clqwk8GADM9PuDVrD5R3930N8
         /DHbkr2Fh6FAGVFBmhgtEBEqGmEHwwYwssnJyOnO26RagIC+22mn4V7DgmuuMXO3PyH2
         zO9A==
X-Gm-Message-State: AOAM531GUdjnAaN95p5bf/BLfTR3bKtb47e6mq9Gv8mmjbUtRQptw6wl
	In237R9OB+cgYALeWMSgpFv9ErhJPR/P9fhz/DU=
X-Google-Smtp-Source: ABdhPJxdQOsF/jy/W9Sm3gtlVbx9Q0MLLzsW63TqmMEat5HrSAEw2Wm/rDyrqDhSBuYXXOi9qMB0pvCET46e5qc4pC4=
X-Received: by 2002:a63:2:0:b0:3f6:5b37:e94c with SMTP id 2-20020a630002000000b003f65b37e94cmr34982956pga.356.1654783083815;
 Thu, 09 Jun 2022 06:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org> <20220609114026.380682-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220609114026.380682-3-krzysztof.kozlowski@linaro.org>
From: Maya Matuszczyk <maccraft123mc@gmail.com>
Date: Thu, 9 Jun 2022 15:57:27 +0200
Message-ID: <CAO_MupKxvaXRQvMyEUZMThBZ9033OeJec+BtBndjs5oZ3etTEQ@mail.gmail.com>
Subject: Re: [PATCH v2 32/48] arm64: dts: rockchip: align gpio-key node names
 with dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	devicetree <devicetree@vger.kernel.org>, 
	arm-mail-list <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

czw., 9 cze 2022 o 13:56 Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> napisa=C5=82(a):
>
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3308-evb.dts   |  2 +-
>  .../boot/dts/rockchip/rk3326-odroid-go2.dts   | 32 +++++++++----------
>  .../boot/dts/rockchip/rk3328-nanopi-r2s.dts   |  2 +-
>  arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi  |  2 +-
>  .../boot/dts/rockchip/rk3368-geekbox.dts      |  2 +-
>  .../dts/rockchip/rk3368-orion-r68-meta.dts    |  2 +-
>  .../boot/dts/rockchip/rk3368-px5-evb.dts      |  2 +-
>  arch/arm64/boot/dts/rockchip/rk3368-r88.dts   |  2 +-
>  .../boot/dts/rockchip/rk3399-firefly.dts      |  2 +-
>  .../dts/rockchip/rk3399-gru-chromebook.dtsi   |  2 +-
>  .../boot/dts/rockchip/rk3399-gru-kevin.dts    |  2 +-
>  .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi |  2 +-
>  .../boot/dts/rockchip/rk3399-khadas-edge.dtsi |  2 +-
>  .../boot/dts/rockchip/rk3399-nanopi-r4s.dts   |  4 +--
>  .../boot/dts/rockchip/rk3399-nanopi4.dtsi     |  2 +-
>  .../boot/dts/rockchip/rk3399-orangepi.dts     |  2 +-
>  .../boot/dts/rockchip/rk3399-pinebook-pro.dts |  4 +--
>  .../boot/dts/rockchip/rk3399-roc-pc.dtsi      |  2 +-
>  .../boot/dts/rockchip/rk3399-rockpro64.dtsi   |  2 +-
>  .../boot/dts/rockchip/rk3399-sapphire.dtsi    |  2 +-
>  .../boot/dts/rockchip/rk3566-pinenote.dtsi    |  2 +-
>  21 files changed, 38 insertions(+), 38 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3308-evb.dts b/arch/arm64/boo=
t/dts/rockchip/rk3308-evb.dts
> index 9b4f855ea5d4..4b5413b12bfa 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3308-evb.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3308-evb.dts
> @@ -75,7 +75,7 @@ gpio-keys {
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&pwr_key>;
>
> -               power {
> +               power-key {
>                         gpios =3D <&gpio0 RK_PA6 GPIO_ACTIVE_LOW>;
>                         linux,code =3D <KEY_POWER>;
>                         label =3D "GPIO Key Power";
> diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch/ar=
m64/boot/dts/rockchip/rk3326-odroid-go2.dts
> index ea0695b51ecd..72328dd993ee 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> @@ -71,82 +71,82 @@ gpio-keys {
>                  * |------------------------------------------------|
>                  */
>
> -               sw1 {
> +               switch-1 {
Wouldn't it make more sense to rename this and all other
renamed nodes in this dts into "button-dpad-up" or "button-1",
as on the physical device those are buttons and the naming
scheme of "sw" + number seems to be a carryover from
downstream sources.

>                         gpios =3D <&gpio1 RK_PB4 GPIO_ACTIVE_LOW>;
>                         label =3D "DPAD-UP";
>                         linux,code =3D <BTN_DPAD_UP>;
>                 };
> -               sw2 {
> +               switch-2 {
>                         gpios =3D <&gpio1 RK_PB5 GPIO_ACTIVE_LOW>;
>                         label =3D "DPAD-DOWN";
>                         linux,code =3D <BTN_DPAD_DOWN>;
>                 };
> -               sw3 {
> +               switch-3 {
>                         gpios =3D <&gpio1 RK_PB6 GPIO_ACTIVE_LOW>;
>                         label =3D "DPAD-LEFT";
>                         linux,code =3D <BTN_DPAD_LEFT>;
>                 };
> -               sw4 {
> +               switch-4 {
>                         gpios =3D <&gpio1 RK_PB7 GPIO_ACTIVE_LOW>;
>                         label =3D "DPAD-RIGHT";
>                         linux,code =3D <BTN_DPAD_RIGHT>;
>                 };
> -               sw5 {
> +               switch-5 {
>                         gpios =3D <&gpio1 RK_PA2 GPIO_ACTIVE_LOW>;
>                         label =3D "BTN-A";
>                         linux,code =3D <BTN_EAST>;
>                 };
> -               sw6 {
> +               switch-6 {
>                         gpios =3D <&gpio1 RK_PA5 GPIO_ACTIVE_LOW>;
>                         label =3D "BTN-B";
>                         linux,code =3D <BTN_SOUTH>;
>                 };
> -               sw7 {
> +               switch-7 {
>                         gpios =3D <&gpio1 RK_PA6 GPIO_ACTIVE_LOW>;
>                         label =3D "BTN-Y";
>                         linux,code =3D <BTN_WEST>;
>                 };
> -               sw8 {
> +               switch-8 {
>                         gpios =3D <&gpio1 RK_PA7 GPIO_ACTIVE_LOW>;
>                         label =3D "BTN-X";
>                         linux,code =3D <BTN_NORTH>;
>                 };
> -               sw9 {
> +               switch-9 {
>                         gpios =3D <&gpio2 RK_PA0 GPIO_ACTIVE_LOW>;
>                         label =3D "F1";
>                         linux,code =3D <BTN_TRIGGER_HAPPY1>;
>                 };
> -               sw10 {
> +               switch-10 {
>                         gpios =3D <&gpio2 RK_PA1 GPIO_ACTIVE_LOW>;
>                         label =3D "F2";
>                         linux,code =3D <BTN_TRIGGER_HAPPY2>;
>                 };
> -               sw11 {
> +               switch-11 {
>                         gpios =3D <&gpio2 RK_PA2 GPIO_ACTIVE_LOW>;
>                         label =3D "F3";
>                         linux,code =3D <BTN_TRIGGER_HAPPY3>;
>                 };
> -               sw12 {
> +               switch-12 {
>                         gpios =3D <&gpio2 RK_PA3 GPIO_ACTIVE_LOW>;
>                         label =3D "F4";
>                         linux,code =3D <BTN_TRIGGER_HAPPY4>;
>                 };
> -               sw13 {
> +               switch-13 {
>                         gpios =3D <&gpio2 RK_PA4 GPIO_ACTIVE_LOW>;
>                         label =3D "F5";
>                         linux,code =3D <BTN_TRIGGER_HAPPY5>;
>                 };
> -               sw14 {
> +               switch-14 {
>                         gpios =3D <&gpio2 RK_PA5 GPIO_ACTIVE_LOW>;
>                         label =3D "F6";
>                         linux,code =3D <BTN_TRIGGER_HAPPY6>;
>                 };
> -               sw15 {
> +               switch-15 {
>                         gpios =3D <&gpio2 RK_PA6 GPIO_ACTIVE_LOW>;
>                         label =3D "TOP-LEFT";
>                         linux,code =3D <BTN_TL>;
>                 };
> -               sw16 {
> +               switch-16 {
>                         gpios =3D <&gpio2 RK_PA7 GPIO_ACTIVE_LOW>;
>                         label =3D "TOP-RIGHT";
>                         linux,code =3D <BTN_TR>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts b/arch/ar=
m64/boot/dts/rockchip/rk3328-nanopi-r2s.dts
> index 3857d487ab84..1445b879ac7a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts
> @@ -34,7 +34,7 @@ keys {
>                 pinctrl-0 =3D <&reset_button_pin>;
>                 pinctrl-names =3D "default";
>
> -               reset {
> +               key-reset {
>                         label =3D "reset";
>                         gpios =3D <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
>                         linux,code =3D <KEY_RESTART>;

[snip]
