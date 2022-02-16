Return-Path: <SRS0=aHvQ=S7=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F35CC433F5
	for <soc@archiver.kernel.org>; Wed, 16 Feb 2022 16:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E31A9C340EC; Wed, 16 Feb 2022 16:01:00 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38CBFC004E1;
	Wed, 16 Feb 2022 16:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 38CBFC004E1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f41.google.com ([209.85.128.41]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mkn8B-1nzUda0nOR-00mLmx; Wed, 16 Feb 2022 17:00:57 +0100
Received: by mail-wm1-f41.google.com with SMTP id m126-20020a1ca384000000b0037bb8e379feso4090658wme.5;
        Wed, 16 Feb 2022 08:00:57 -0800 (PST)
X-Gm-Message-State: AOAM532xGYTh/ciks34yapLngvKKGTBn2dWJGhhslpldqUJXErZqpT1Y
	PhmOJRG38Q4AXoRULPFNpfoRdTowdiQosvWcur8=
X-Google-Smtp-Source: ABdhPJynoAxya4wFmgdnms1koLXV7kTRWWb6Nv7KnLWbKzdNWIAOdEAPUd2d50HQv+qDZHVfp/C/GrTxO6eYP671+Xg=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr2278615wms.82.1645027256708; Wed, 16
 Feb 2022 08:00:56 -0800 (PST)
MIME-Version: 1.0
References: <nick.hawkins@hpe.com> <20220216153632.40981-1-nick.hawkins@hpe.com>
In-Reply-To: <20220216153632.40981-1-nick.hawkins@hpe.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 16 Feb 2022 17:00:40 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0NmyxrzxgfwfDXuFvhmc3OL_-yBj8PDdEHh-2qm4NVkw@mail.gmail.com>
Message-ID: <CAK8P3a0NmyxrzxgfwfDXuFvhmc3OL_-yBj8PDdEHh-2qm4NVkw@mail.gmail.com>
Subject: Re: [PATCH] [v3] arch: arm: boot: dts: Create HPE GXP Device Tree
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
List-Id: <soc.lore.kernel.org>
Cc: "Verdun, Jean-Marie" <verdun@hpe.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:my0pdvutxyr0aZF5GPuCG6lhvruG5NVW+c8h/RV8KxAQI+ZevZT
 AxgZlq3m3xSgbgUqcp8fs4i4iFlmMXCiIR0aiOl539S+RPCy/462xgQnkxKPflj1PPOMmCF
 PXBOeF3CPXuF0CyLd6cosA/NJAy6qQ0TIG/JgR8eHSEziRO/Qffl1nNwiiaeo5G0imhYD+t
 PNBHpQmdQwj70dFbg855A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HUEv/Kk6MNM=:rqMq4sM/8WNnrBzo2ZmtU0
 P2frNez/oVPqAEAh3sVr+J81jizNqnGQKKAOGeNzKKmVm3tseX6QkRqjbbF42x5twZVhr5Au3
 Cqwj6ZAqW8evMY0UO2Nc3ocxOIbHpC7RvbABcv8d4ZD6wCC4ZMnxPJIYhq2dB1LPxfwWuxEpI
 NtbIYeEfomakDcfiX0iVM4Do7WI536vjge+33ByIyd2G+VcL+6HFEQkpysxdxm+wuwKnwTdq2
 ms4sgG5bcHZ2qmjLlGb0mIu1iO2qPVJIkU4qp+gfRwjnUcSNqDNG/sERBEuzl6kr/aCP3+RGs
 VbLwYSsK5B1asHYx56ToKG+dVxhoAuMbhbFvecmh8QZMEATSdiiAz/U+Xw9jyHPvI1RrJBST8
 X49qV7PxdIbGpV58h4eRwT4v8St1tiUz9lgIoSzoROECEV6eayaXEJIYMKkL3Y6p0FAMnTavW
 32JIrITb/ZSFS4I2FPaSyIsJevub1/Q4Xe6nYk051SGKoCVM/uCGb9qEdk4ILmdmv9xFoa0lX
 iB+y6t+ndssOcRDpM/qSCguP8HgrMq6jjeZfAeELE3ZPkF5bGbkhdY5x9ChgojaZRx1VcLcPb
 1bfWo6KE/uzIVzzRjo+nmlAvH6F43yjAfJJbsZ51vP5yqi4sXGf2XQaoJgNkyRLg+xmtEyXSU
 ukLQTIw3XKInxXbZN+nIjGvJcevHvqsmYX3eT8jZJz2x5NGlQe+1/4fC8TJfm8z0R3rM=

On Wed, Feb 16, 2022 at 4:36 PM <nick.hawkins@hpe.com> wrote:
>
> From: Nick Hawkins <nick.hawkins@hpe.com>
>
> Description: Originally this was of a larger patch
> HPE BMC GXP SUPPORT that was rejected for being to big.
> This is why the label v3 is being used.
> This patch Create a basic device tree layout that
>  will allow the HPE GXP to boot. The undocumented
>  bindings hpe,gxp-wdt and hpe,gxp-timer are being
>  documented in patches:
>   [v1] dt-bindings: timer: Add HPE GXP Timer binding
>   [v1] dt-bindings: watchdog: Add HPE GXP Watchdog timer binding
>   [v1]dt-bindings: vendor-prefixes: add HPE Prefix
>  that are currently out for review.
> The dts file is largely empty for this initial patch but
> follow up patches will add more content.
>
> Information: GXP is the name of the HPE SoC.
>  This SoC is used to implement BMC features of HPE servers
>   (all ProLiant, Synergy, and many Apollo, and Superdome machines)
>    It does support many features including:
>         ARMv7 architecture, and it is based on a Cortex A9 core
>         Use an AXI bus to which
>                 a memory controller is attached, as well as
>                  multiple SPI interfaces to connect boot flash,
>                  and ROM flash, a 10/100/1000 Mac engine which
>                  supports SGMII (2 ports) and RMII
>                 Multiple I2C engines to drive connectivity with a
>                                  host infrastructure
>                 A video engine which support VGA and DP, as well as
>                  an hardware video encoder
>                 Multiple PCIe ports
>                 A PECI interface, and LPC eSPI
>                 Multiple UART for debug purpose, and Virtual UART for
>                  host connectivity
>                 A GPIO engine.

Something happened to the linewrapping here.

>
> +GXP ARM ARCHITECTURE
> +M:     Nick Hawkins <nick.hawkins@hpe.com>
> +M:     Jean-Marie <verdun@hpe.com>

It looks like you are missing the family name here.

> +S:     Maintained
> +F:     arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
> +F:     arch/arm/boot/dts/hpe-gxp.dtsi
> +

I would make a single entry for the platform with all the drivers here. Please
keep the MAINTAINERS file patch separate from the devicetree patch though.

> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 235ad559acb2..a96b4d5b7f68 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1549,3 +1549,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-vegman-n110.dtb \
>         aspeed-bmc-vegman-rx20.dtb \
>         aspeed-bmc-vegman-sx20.dtb
> +dtb-$(CONFIG_ARCH_HPE_GXP) += \
> +       hpe-bmc-dl360gen10.dtb

This Kconfig symbol does not yet exist

> diff --git a/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts b/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
> new file mode 100644
> index 000000000000..179de6945e3f
> --- /dev/null
> +++ b/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree file for HPE DL360Gen10
> + */
> +
> +/include/ "hpe-gxp.dtsi"
> +
> +/ {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       compatible = "hpe,gxp";

No board specific compatible string? Also, this value is not
documented anywhere.

> +       model = "Hewlett Packard Enterprise ProLiant dl360 Gen10";

> +               bootargs = "earlyprintk console=ttyS0,115200 user_debug=31";

'earlyprintk' and 'user_debug' should not go into the .dts, set these from
the boot loader when you are debugging.

You probably want to add some aliases, to assign fixed numbers to
the uart and mmc controller among other things.

> +               timer0: timer@c0000080 {
> +                       compatible = "hpe,gxp-timer";
> +                       reg = <0xc0000080 0x1>, <0xc0000094 0x01>, <0xc0000088 0x08>;
> +                       interrupts = <0>;
> +                       interrupt-parent = <&vic0>;
> +                       clock-frequency = <400000000>;
> +               };
> +
> +               watchdog: watchdog@c0000090 {
> +                       compatible = "hpe,gxp-wdt";
> +                       reg = <0xc0000090 0x02>, <0xc0000096 0x01>;
> +               };

As mentioned in a previous review, it would be helpful to have the drivers
and bindings together in the same series for easier review.

> +               uartc: serial@c00000f0 {
> +                       compatible = "ns16550a";
> +                       reg = <0xc00000f0 0x8>;
> +                       interrupts = <19>;
> +                       interrupt-parent = <&vic0>;
> +                       clock-frequency = <1846153>;
> +                       reg-shift = <0>;
> +               };
> +
> +               usb0: ehci@cefe0000 {
> +                       compatible = "generic-ehci";
> +                       reg = <0xcefe0000 0x100>;
> +                       interrupts = <7>;
> +                       interrupt-parent = <&vic0>;
> +               };

The ehci is almost never completely generic, I would recommend defining a
SoC specific compatible string as well, so you can add quirks later if you
find a problem. Having the generic string as a fallback is a good idea though,
as that means you can just use the normal driver as long as there are no
special requirements.

To a lesser degree, the same is true for the uart.

Please check the devicetree files in order to validate the bindings. In
this case, you should get a warning about the 'ehci@' name being
non-standard. The normal name is usb@

> +               sram@d0000000 {
> +                       compatible = "mtd-ram";
> +                       reg = <0xd0000000 0x80000>;
> +                       bank-width = <1>;
> +                       erase-size =<1>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       partition@0 {
> +                               label = "host-reserved";
> +                               reg = <0x0 0x10000>;
> +                       };
> +                       partition@10000 {
> +                               label = "nvram";
> +                               reg = <0x10000 0x70000>;
> +                       };
> +               };

What device is this exactly? The name indicates an sram, which would
use the compatible="mmio-sram" binding instead of "mtd-ram", but then
the partition has an "nvram" label that indicates that this is an nvmem
type device. "mtd-ram" is probably not what you want though.

> +
> +               vrom@58000000 {
> +                       compatible = "mtd-ram";

Same thing here, "vrom" is clearly not a standard name.

       Arnd
