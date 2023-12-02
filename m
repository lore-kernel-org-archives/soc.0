Return-Path: <SRS0=Zczl=HN=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2901C4167B
	for <soc@archiver.kernel.org>; Sat,  2 Dec 2023 02:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87F96C43391; Sat,  2 Dec 2023 02:28:14 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26930C433CA
	for <soc@kernel.org>; Sat,  2 Dec 2023 02:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26930C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d053c45897so10751345ad.2
        for <soc@kernel.org>; Fri, 01 Dec 2023 18:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701484092; x=1702088892; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76O+RH8qZeRuRBc1mT4uLTZ6BfSO4LNymM/dQ6nxNw0=;
        b=vEiLw7M05TVvqq9LjIm20/aOpKwrisnnvuUd3x8ZbzRnPUL57WZFryS8r3Lkkz5zKV
         kHRDESqDq30tesIV+SAVqKI6Lf6nbqGWmVfxQwCe3XOQahHsOb6EiBWehit6GQOLk6Xr
         9qjeXttuPCHNScjDgOPnM3f6BmlrpZFPFkicEZeesT1WyBeGhSOXld+BVPmrN7JF2bdR
         WbUrGwcQocWspO91HFbqOQenp4ghWUpspb8WiE8eihRgzXeo3ODSnBdNRJ+N+I+CcIPZ
         s/vHcNuz7TcIymo94Jlcl7dSjLU6cL0cE5wTPbuoYpkPvAAF847iQTP5ne/Skv2zkFYD
         kdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701484092; x=1702088892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76O+RH8qZeRuRBc1mT4uLTZ6BfSO4LNymM/dQ6nxNw0=;
        b=dpYhZrMktacAlM5oRsvF0clqhhRKVqsm35JXkhc4FhQIOn4HHaENBi9d4Y8UAzoXC7
         MP2plyiIcqL0rXbc0qndCQ8OKbA1iAHyqUD+Zydb1L6MV10Uygd2co0EV7eQKn8Nzb8M
         5KUt07tRMav9AEsb9O/m5gdrENdBmvckngHGJ/pR6Q3/fnhHEZANWZL5z3ld6VGjkbC3
         /BBDhWRDwIZC9TYOgV0jbggdzIy8ehVK7qPhXt+FFcsenXilhEGv/ENT/K/8pcKxaxzy
         cfvYtAh3vv+M/0N9HTXGPMNxqQgNbVX8vKGOvLh/acUl+1B/jhdhL6knD//+9oZFPQ38
         vmsQ==
X-Gm-Message-State: AOJu0YxSmwZhIJIpxTxCQmUo7l6vBP+JKUl08eIuT5x2pdJVkMQF8QQo
	br0kiNWjBsNrUKD8nFdxUQk5qh6mlGyzvVQpR+Wp6g==
X-Google-Smtp-Source: AGHT+IG1dE3nOssFf65P5OHRfkzUuH2N8dYYyAJ+WlkyZbyjQVISgvPG3LWKb2DVruVskMVXo7/YNmnqp8LpAD6HLwQ=
X-Received: by 2002:a17:903:41c1:b0:1ca:7f91:aa5d with SMTP id
 u1-20020a17090341c100b001ca7f91aa5dmr660536ple.16.1701484092499; Fri, 01 Dec
 2023 18:28:12 -0800 (PST)
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org> <20231201160925.3136868-20-peter.griffin@linaro.org>
In-Reply-To: <20231201160925.3136868-20-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Dec 2023 20:28:01 -0600
Message-ID: <CAPLW+4mOmQM+Hy-kUKn9onU25-ycgj4CWfAK+-vZVH+yw=FhtQ@mail.gmail.com>
Subject: Re: [PATCH v5 19/20] arm64: dts: exynos: google: Add initial
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

On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add initial board support for the Pixel 6 phone code named Oriole. This
> has been tested with a minimal busybox initramfs and boots to a shell.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/Makefile           |   2 +
>  arch/arm64/boot/dts/exynos/google/Makefile    |   4 +
>  .../boot/dts/exynos/google/gs101-oriole.dts   | 105 ++++++++++++++++++
>  3 files changed, 111 insertions(+)
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
> index 000000000000..6abd00fa337e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Oriole Device Tree
> + *
> + * Copyright 2021-2023 Google,LLC

Space after comma. Maybe also make this line consistent for all added
files. Checking existing files, it's usually spelled "Copyright (C)
<years>, Google LLC."

Btw, I forgot to mention in my review for PATCH #18: please double
check the commit message, there are some issues with punctuation
there.

> + * Copyright 2023 Linaro Ltd - <peter.griffin@linaro.org>
> + */
> +
> +/dts-v1/;
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
> +       aliases {
> +               serial0 =3D &serial_0;
> +       };
> +
> +       chosen {
> +               /* Bootloader expects bootargs specified otherwise it cra=
shes */

Just wanted to say: I think you are doing a great job with this
platform, and I can only imagine how hard it can be when you can't
actually tinker with the bootloader source code. But I do appreciate
that you was able to minimize stuff like earlycon, ect, etc :) And
this one actually LGTM.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> +               bootargs =3D "";
> +               stdout-path =3D &serial_0;
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
> +&ext_24_5m {
> +       clock-frequency =3D <24576000>;
> +};
> +
> +&ext_200m {
> +       clock-frequency =3D <200000000>;
> +};
> +
> +&pinctrl_far_alive {
> +       key_voldown: key-voldown-pins {
> +               samsung,pins =3D "gpa7-3";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_EINT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +
> +       key_volup: key-volup-pins {
> +               samsung,pins =3D "gpa8-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_EINT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +};
> +
> +&pinctrl_gpio_alive {
> +       key_power: key-power-pins {
> +               samsung,pins =3D "gpa10-1";
> +               samsung,pin-function =3D <GS101_PIN_FUNC_EINT>;
> +               samsung,pin-pud =3D <GS101_PIN_PULL_NONE>;
> +               samsung,pin-drv =3D <GS101_PIN_DRV_2_5_MA>;
> +       };
> +};
> +
> +&serial_0 {
> +       status =3D "okay";
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&uart0_bus>;
> +};
> +
> +&usi_uart {
> +       status =3D "okay";
> +       samsung,clkreq-on; /* needed for UART mode */
> +};
> +
> +&watchdog_cl0 {
> +       timeout-sec =3D <30>;
> +       status =3D "okay";
> +};
> --
> 2.43.0.rc2.451.g8631bc7472-goog
>
