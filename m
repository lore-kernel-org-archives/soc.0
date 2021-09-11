Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38036C433EF
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Sep 2021 03:18:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 163FB60F92
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Sep 2021 03:18:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbhIKDT6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Sep 2021 23:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhIKDT5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Sep 2021 23:19:57 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60BBC061756
        for <devicetree@vger.kernel.org>; Fri, 10 Sep 2021 20:18:43 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id t4so4288262qkb.9
        for <devicetree@vger.kernel.org>; Fri, 10 Sep 2021 20:18:43 -0700 (PDT)
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
        b=23TYo1mEvpmhmHwQWS63NFLr+kwrLXCQe0IBCCaOB0K+IjRIqeSuvuGNl8XY3DjAC+
         lya3HKb/scxwzjXLGdfrhORSpvUpuiOvB1hz8RL3BFpYwYoI0OH/2gw7v4ZZNrZph+6y
         Z5oRWCC8BzbdbljOg4Of+ED80HR2MFGa9I/l+6VOAXkPTqsbMNv3xLAllIq1/zM1Iy2B
         bGVMEzims45+4kFmbLIrUj2hOlx6iT1BKADHmc8Dvq4b86FHRNfgAqpwq08Yr/N/1cU1
         jmNkKXj5MNZqxvz+QnhMsahyeBWxDRfYMP34RISwMqzwxQaANiQxcK0oBTbs81TwGirD
         V+xA==
X-Gm-Message-State: AOAM531nrEG9pNxeGXLIgSHe2jm2oVAxLzWd+v2LX4r3hZHGfIr6LIBG
        dYPVWJnPXAib41NuDRxKClh36cx6TJLteh87miRWEQ==
X-Google-Smtp-Source: ABdhPJxrshc0/e0qK2u4rQeCBzQr0P9W4mE/w2bCGPbHuyvvD1MoYhyx+d2tpScTXawu9idjHi4apmLNG0MU0Rawwm4=
X-Received: by 2002:a05:620a:228a:: with SMTP id o10mr545406qkh.342.1631330322890;
 Fri, 10 Sep 2021 20:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com> <20210910190322.27058-3-romain.perier@gmail.com>
In-Reply-To: <20210910190322.27058-3-romain.perier@gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Sat, 11 Sep 2021 12:18:32 +0900
Message-ID: <CAFr9PXmRXcu_ifE62dT5AwZv2uFbYVfAc5ZX5qBoRkEPKGB+JA@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: mstar: Add the Wireless Tag IDO-SBC2D06-V1B-22W
To:     Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20210911031832.TW_fHBipj8znu5suOzQ7BzsvXy3EAmowtBCtoHfs3x0@z>

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
