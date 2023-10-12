Return-Path: <SRS0=XK7G=F2=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9718CCDB46E
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 07:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79CB1C433D9; Thu, 12 Oct 2023 07:40:22 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6365FC433CA
	for <soc@kernel.org>; Thu, 12 Oct 2023 07:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6365FC433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-690d2e13074so544532b3a.1
        for <soc@kernel.org>; Thu, 12 Oct 2023 00:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697096420; x=1697701220; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeyFnsq7kj9nc73z+mJcYj/SpiIQNbMhSQED5EpeFnk=;
        b=ry1y77qFhs2aC57EZIcYJtECM704RQTAgWTONmM0DZlPtd0ftv1hKIV+dOUjzrfsyP
         dBYnpwzVu+3yjKkViFbJbzmFTJAwAnxmWmnS38gzqkBGA22lgzBYLsDwXWRDUn66H23y
         XjgC2TwX9dNzidQHFnferTtiV74hCrRA7d9JPuUJTVsoztjB1/jaRM1MUUBcCZFtFOnw
         o8syh5H2CycwhJokIQzVfHOTUE2AHOTAaH1fGpO5sMHUEEfsxDK8jty0v0QPVF383WES
         TtVeQ1v6eyxZnHGqORmFmP/1Pnrl8QOuAZs6AAOTsvDye3J8KC0+2tXOL12GXOJwOdb8
         JCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697096420; x=1697701220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WeyFnsq7kj9nc73z+mJcYj/SpiIQNbMhSQED5EpeFnk=;
        b=Wp3iqhObzWNjSf6QkhdVd3KrC1G25+4kvgjOY5gSOk76l3N5ZJ3DZ8zh85t088gb0n
         GLiAfpuh1yG50mBPZfqre/j7u9SBl3jM7WMUI7qSr8uaN//6hTh8L9P9QLtJoPNY7Ke7
         PqbO4UEjY2Xu4mUH0zq0zUbQuyZQehj5+lU+YfMyltqYMHJWpglkJNNkCzOWdCq/RIE8
         oCygTaQOiMDa7kxcbo0KdClWWNKm7BjE8lm19TmCsR6ILUey1lCztW2zIFdVWGAf2K3S
         6AwE6z/Xz1Y5waKW3HG4yr58B9qJ9PFjE3DzQbCrN03TKS7wVAq3cxbNdtp+MqeOE7Qi
         7lzg==
X-Gm-Message-State: AOJu0YyjtBow4j3LC0580YloDpZhEjor+sjSxISZpB1GYyJWSC6ydmhz
	vOP/2RVbO0i9DxEhWtQN2WA6TFTNwGIjkCGmRrn7lA==
X-Google-Smtp-Source: AGHT+IH/pqOJSGAUpimWG1P472lbC+Hea49S/OE3uBkgKRUitvR9pB1D0mSrJquRil0M1gwvWAx/gEyoiscMqY9skRo=
X-Received: by 2002:a05:6a20:4286:b0:159:e0b9:bd02 with SMTP id
 o6-20020a056a20428600b00159e0b9bd02mr25980791pzj.40.1697096419671; Thu, 12
 Oct 2023 00:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-19-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-19-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 12 Oct 2023 02:40:07 -0500
Message-ID: <CAPLW+4mX5bK7zxpxS_1a5Gi1gG8UFRDpMehnSxxXibTFCn_Txg@mail.gmail.com>
Subject: Re: [PATCH v3 18/20] arm64: dts: google: Add initial Oriole/pixel 6
 board support
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	cw00.choi@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add initial board support for the Pixel 6 phone code named Oriole. This
> has been tested with a minimal busybox initramfs and boots to a shell.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm64/boot/dts/google/Makefile         |  4 ++
>  arch/arm64/boot/dts/google/gs101-oriole.dts | 79 +++++++++++++++++++++
>  2 files changed, 83 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/google/Makefile
>  create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dts
>
> diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/go=
ogle/Makefile
> new file mode 100644
> index 000000000000..5cea8ff27141
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +dtb-$(CONFIG_ARCH_GOOGLE_TENSOR) +=3D \
> +       gs101-oriole.dtb \
> diff --git a/arch/arm64/boot/dts/google/gs101-oriole.dts b/arch/arm64/boo=
t/dts/google/gs101-oriole.dts
> new file mode 100644
> index 000000000000..3bebca989d34
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/gs101-oriole.dts
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Oriole Device Tree
> + *
> + * Copyright 2021-2023 Google,LLC
> + */
> +
> +/dts-v1/;
> +/plugin/;

Why is this needed? Is that really not possible to build this board
dts as actual dtb, not dtbo (and remove this 'plugin' line)? If GS
bootloader is similar to Exynos850 bootloader, it should be possible
to only use dtb, and flash empty dtbo image. Just a thought.

> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include "gs101-pinctrl.h"
> +#include "gs101.dtsi"
> +
> +/ {
> +       model =3D "Oriole";
> +       compatible =3D "google,gs101-oriole", "google,gs101";
> +
> +       chosen {
> +               bootargs =3D "earlycon=3Dexynos4210,mmio32,0x10A00000 con=
sole=3DttySAC0";

Why is that earlycon is needed here? The serial should work fine (and
actually even better) without that. Might be very useful for debugging
though, but in production dts I'd remove that bit. Also, not sure why
console is needed. Isn't it enough to just have something like:

        stdout-path =3D &serial_0;

inside of /chosen node?

Btw, why isn't serial node enabled somewhere in this dts?

> +       };
> +
> +       gpio-keys {
> +               compatible =3D "gpio-keys";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&key_voldown &key_volup &key_power>;
> +
> +               button-vol-down {
> +                       label =3D "KEY_VOLUMEDOWN";
> +                       linux,code =3D <KEY_VOLUMEDOWN>;
> +                       gpios =3D <&gpa7 3 GPIO_ACTIVE_LOW>;
> +                       wakeup-source;
> +               };
> +
> +               button-vol-up {
> +                       label =3D "KEY_VOLUMEUP";
> +                       linux,code =3D <KEY_VOLUMEUP>;
> +                       gpios =3D <&gpa8 1 GPIO_ACTIVE_LOW>;
> +                       wakeup-source;
> +               };
> +
> +               button-power {
> +                       label =3D "KEY_POWER";
> +                       linux,code =3D <KEY_POWER>;
> +                       gpios =3D <&gpa10 1 GPIO_ACTIVE_LOW>;
> +                       wakeup-source;
> +               };
> +       };
> +};
> +
> +&pinctrl_1 {
> +       key_voldown: key-voldown-pins {
> +               samsung,pins =3D "gpa7-3";
> +               samsung,pin-function =3D <0xf>;
> +               samsung,pin-pud =3D <0>;

Here and further: maybe replace pid-function and pin-pud hard-coded
values with corresponding named constants?

> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       key_volup: key-volup-pins {
> +               samsung,pins =3D "gpa8-1";
> +               samsung,pin-function =3D <0xf>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +};
> +
> +&pinctrl_0 {
> +       key_power: key-power-pins {
> +               samsung,pins =3D "gpa10-1";
> +               samsung,pin-function =3D <0xf>;
> +               samsung,pin-pud =3D <0>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +};
> +
> +&watchdog_cl0 {
> +       timeout-sec =3D <30>;

No status =3D "okay" here? The same question goes for wdt_cl1.

> +};
> --
> 2.42.0.655.g421f12c284-goog
>
