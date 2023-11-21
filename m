Return-Path: <SRS0=O7bH=HC=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D71C61D85
	for <soc@archiver.kernel.org>; Tue, 21 Nov 2023 18:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45E71C433C7; Tue, 21 Nov 2023 18:39:54 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 114FAC433CB
	for <soc@kernel.org>; Tue, 21 Nov 2023 18:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 114FAC433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cf6bdf8274so352625ad.1
        for <soc@kernel.org>; Tue, 21 Nov 2023 10:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700591991; x=1701196791; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88OBIvtQUDQ1J1FmUcJfKPLmP+A7EipGuNLwHhkdaGU=;
        b=xrBHRjFKSZtBmzxvQppPnYSkWKEKHg9ZQ8WcXspmEbTe32OF5Vyrf85jXxkq6a6LW7
         zsRiDswUmVqwQyyb/tAUVwhotxbD931mdmTx3aJwTMAn+rDNRpQcudIsmz9w1lV9tqrr
         /dLH23+id7ZHOYfaNuBxarPD0RZ4VntZ3ca5yZfpeZOM/ahD3O2/+iWX7oUJhImPE56M
         KnIreszTKoeQ7CbbY6GqgUgfN/2Ucd+qFNJL7f/1y1Kpm5kWvfD2PiufrAyfni0o7q47
         dFU7FMzfIaEfKYgMdhRg2rWGdquT2+DyEDL+HD0n09Tai0f7n3VE+QrFz6+AHH/OZ9kc
         z6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700591991; x=1701196791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88OBIvtQUDQ1J1FmUcJfKPLmP+A7EipGuNLwHhkdaGU=;
        b=i32qSWqBPYSjj+WRmGHzesoPy9xulDpMecfFnPx/IqShl6o6/ACciR9T9NyspEj+UL
         GRdYH+IT//yXnZPfbDd2eHdD3oL+9SkbhBNis/EiU5sqiWRn7PFuyba1Ri0Unf46FOgb
         ApqhLSOmU2wVEPHQTgmdpSpydZUIlyqDRQveySb3jBCd3Zk8FBrho9RFOyN2FoEECkBz
         nYfSyaZiX+Z/xdYoJcd0YOAhkojiZyN45PzBZtFRIlxbSktUgz4k0VQH0D2jtPWvbYoU
         A0RK9rEdnua3cnPZKew5U6DYSWWWIJLlXrHo5Bmkl5P/cqDVsvpPWosMk+cTRewy1Rp6
         +l+Q==
X-Gm-Message-State: AOJu0YwJdvyaaOJYkhrPfo+NOw0A4uUfAE0jE3TMLe+VUJtgM0xWIjU9
	0TgCwiYm0OlXcBmCcTU6j3qBJx1OvOS1ksGX/PxjGg==
X-Google-Smtp-Source: AGHT+IEhYaU4m2OTY3a0PI+MToJaIVcF/4UdYe32j14vCIjXKkqf40PVc53uZa36ibIBrkb58eNTKgucMjF0E4QOZMA=
X-Received: by 2002:a17:90b:4a87:b0:280:204e:9121 with SMTP id
 lp7-20020a17090b4a8700b00280204e9121mr277345pjb.23.1700591991220; Tue, 21 Nov
 2023 10:39:51 -0800 (PST)
MIME-Version: 1.0
References: <20231120212037.911774-1-peter.griffin@linaro.org> <20231120212037.911774-19-peter.griffin@linaro.org>
In-Reply-To: <20231120212037.911774-19-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 21 Nov 2023 12:39:40 -0600
Message-ID: <CAPLW+4k=M1q1thr2RXG4fGkvD51H7NxS1A3Ck+Up7W1nTcUPcw@mail.gmail.com>
Subject: Re: [PATCH v4 18/19] arm64: dts: exynos: google: Add initial
 Oriole/pixel 6 board support
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 3:21=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add initial board support for the Pixel 6 phone code named Oriole. This
> has been tested with a minimal busybox initramfs and boots to a shell.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/Makefile           |  2 +
>  arch/arm64/boot/dts/exynos/google/Makefile    |  4 +
>  .../boot/dts/exynos/google/gs101-oriole.dts   | 79 +++++++++++++++++++
>  3 files changed, 85 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/google/Makefile
>  create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
>
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/ex=
ynos/Makefile
> index 6e4ba69268e5..44c24a8ad9e1 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -1,4 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
> +subdir-y +=3D google
> +
>  dtb-$(CONFIG_ARCH_EXYNOS) +=3D \
>         exynos5433-tm2.dtb              \
>         exynos5433-tm2e.dtb             \
> diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/boot=
/dts/exynos/google/Makefile
> new file mode 100644
> index 000000000000..0a6d5e1fe4ee
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/google/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +dtb-$(CONFIG_ARCH_EXYNOS) +=3D \
> +       gs101-oriole.dtb \
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/ar=
m64/boot/dts/exynos/google/gs101-oriole.dts
> new file mode 100644
> index 000000000000..111665490840
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
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

Now that the dts is being built as a dtb (not dtbo), I don' think this
/plugin/ bit is needed here?

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
> +       };
> +
> +       gpio-keys {
> +               compatible =3D "gpio-keys";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&key_voldown>, <&key_volup>, <&key_power>;
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
> +};
> --
> 2.43.0.rc1.413.gea7ed67945-goog
>
