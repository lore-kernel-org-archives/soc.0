Return-Path: <SRS0=EptG=OB=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C73C433EF
	for <soc@archiver.kernel.org>; Sat, 11 Sep 2021 03:18:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 18D4B611BD; Sat, 11 Sep 2021 03:18:44 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2EE66103D
	for <soc@kernel.org>; Sat, 11 Sep 2021 03:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2EE66103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-qk1-f176.google.com with SMTP id 22so4323219qkg.2
        for <soc@kernel.org>; Fri, 10 Sep 2021 20:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yglhQiqMuWRPXEcp/S7cp6xw4g2Boo9OI0xnp6CMYq0=;
        b=WIz8lZM8PLGizh5UoEnFP8TfCrOQRzhtjoMSFgBW6nZVGw1g7pIgTv2s7R4uf7BE7i
         1Vcn6md5a/DpD/uE0Z0jbqm3xF+uW+OJ5FNv465mG9zup5WjKMvfgXkPtpdqUb6ibXaD
         +ebjUbCnGE5zhrzDu0fCNtIWBpGDOoWEO3TC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yglhQiqMuWRPXEcp/S7cp6xw4g2Boo9OI0xnp6CMYq0=;
        b=v/YuM6PjIGQvoFqF6t1jwAvYqH/THl46MTR8ax8IqB5CpR97Fr4ogSttJOoI4FAjJr
         C2pw5DMtN3iLVnPNI/s3K1DInVErfx22eh8+LtzK46N72H9Zu9G+v4oQv5Q6YLE0RPhc
         mEy3DOOty2+GhHx80zFuciwIIjQlFuyS2WV7sR9GDKh/oMB/81bEl/Z98koDAi5w6vjn
         UvEn4yeBtQYviL2ftLeuzS0DEKBNo5MLwHFcyB/ENFevdpW+D43SfnXpO80SRovc+Wzk
         U6Lc3wcIsX1AmWBZI+i0dUih9cUOSowRktRumsGQOqrhEBovvleRiYPOLnzOihK2HMyv
         duIg==
X-Gm-Message-State: AOAM533GETFEqux8MPU71Vc4Zs/iN7NNAOcUnt2wsR4/WjJOdMAmiR68
	UJvdygEMNkMpYg/z3KoXmrEMsCnorqI8mZ48YIiaq62LlK4=
X-Google-Smtp-Source: ABdhPJxrshc0/e0qK2u4rQeCBzQr0P9W4mE/w2bCGPbHuyvvD1MoYhyx+d2tpScTXawu9idjHi4apmLNG0MU0Rawwm4=
X-Received: by 2002:a05:620a:228a:: with SMTP id o10mr545406qkh.342.1631330322890;
 Fri, 10 Sep 2021 20:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com> <20210910190322.27058-3-romain.perier@gmail.com>
In-Reply-To: <20210910190322.27058-3-romain.perier@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 11 Sep 2021 12:18:32 +0900
Message-ID: <CAFr9PXmRXcu_ifE62dT5AwZv2uFbYVfAc5ZX5qBoRkEPKGB+JA@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: mstar: Add the Wireless Tag IDO-SBC2D06-V1B-22W
To: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	SoC Team <soc@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Romain,

On Sat, 11 Sept 2021 at 04:03, Romain Perier <romain.perier@gmail.com> wrote:
> +              - wirelesstag,ido-som2d01 # Wireless Tag IDO-SOM2D01
> +              - wirelesstag,ido-sbc2d06-v1b-22w # Wireless Tag IDO-SBC2D06-1VB-22W

For anyone wondering why we have two strings here:
The SBC board is made up of a SoM and a board with the connectors.
The SoM could be used standalone so we might as well have a compatible
for it too.
We have some dtsis for the SoM but really those could be built as is
to support someone using the SoM on it's own.

> +++ b/arch/arm/boot/dts/mstar-infinity2m-ssd201-som2d01-common.dtsi

For anyone wondering:

The som2d01 can come with an SSD201 (64MB DDR2 integrated) or SSD202D
(128MB DDR3 integrated) and they need different fixed regulators for
the DDR supply.
So we have a common dtsi and then override the regulator in another
layer of dtsi for the SSD202D version.

Thinking about it now I think we can drop common from the file name.

> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright (c) 2021 thingy.jp.
> + * Author: Daniel Palmer <daniel@thingy.jp>
> + * Author: Romain Perier <romain.perier@gmail.com>
> + */
> +
> +/ {
> +

Unneeded space.

> +       reg_vcc_dram: regulator-vcc-dram {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vcc_dram";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-boot-on;
> +       };
> +};
> +
> +&pm_uart {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts
> new file mode 100644
> index 000000000000..20b40b711d4f
> --- /dev/null
> +++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright (c) 2021 thingy.jp.
> + * Author: Daniel Palmer <daniel@thingy.jp>
> + * Author: Romain Perier <romain.perier@gmail.com>
> + */
> +
> +/dts-v1/;
> +#include "mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +       model = "Wireless Tag IDO-SBC2D06-1VB-22W";
> +       compatible = "wirelesstag,ido-sbc2d06-v1b-22w", "wirelesstag,ido-som2d01", "mstar,infinity2m";
> +
> +       leds {
> +               compatible = "gpio-leds";
> +               sys_led {
> +                       gpios = <&gpio SSD20XD_GPIO_GPIO85 GPIO_ACTIVE_LOW>;
> +                       linux,default-trigger = "heartbeat";
> +               };
> +       };
> +};
> diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi
> new file mode 100644
> index 000000000000..06567a5219c5
> --- /dev/null
> +++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-wirelesstag-ido-som2d01.dtsi
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright (c) 2021 thingy.jp.
> + * Author: Daniel Palmer <daniel@thingy.jp>
> + * Author: Romain Perier <romain.perier@gmail.com>
> + */
> +
> +/dts-v1/;
> +#include "mstar-infinity2m-ssd202d.dtsi"
> +#include "mstar-infinity2m-ssd201-som2d01-common.dtsi"
> +
> +/ {
> +       model = "Wireless Tag IDO-SOM2D01 (SSD202D)";
> +       compatible = "wirelesstag,ido-som2d01", "mstar,infinity2m";
> +
> +       aliases {
> +               serial0 = &pm_uart;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +};
> +
> +&reg_vcc_dram {
> +       regulator-min-microvolt = <1500000>;
> +       regulator-max-microvolt = <1500000>;
> +};
> --
> 2.33.0
>

Cheers,

Daniel
