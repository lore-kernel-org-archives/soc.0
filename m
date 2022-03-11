Return-Path: <SRS0=38w0=TW=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49710C433EF
	for <soc@archiver.kernel.org>; Fri, 11 Mar 2022 08:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 19DA1C340F3; Fri, 11 Mar 2022 08:17:26 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7CB46C340EC;
	Fri, 11 Mar 2022 08:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7CB46C340EC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MNss4-1nmTrG1v20-00OHH0; Fri, 11 Mar 2022 09:17:22 +0100
Received: by mail-wr1-f51.google.com with SMTP id r6so11300736wrr.2;
        Fri, 11 Mar 2022 00:17:22 -0800 (PST)
X-Gm-Message-State: AOAM530tCQSqALbKmQC7bFP542WUA77JXqCo7voSLjCRtCAOT42ZrgYD
	lZHxp7zQsHrF5fmkMm6Ez7o4o3w8Zt/D3s8w0GM=
X-Google-Smtp-Source: ABdhPJxW9i4kWyg9zMNuwRBJdGfRXF75+O2MaNREzCYFAU5RyTteMHh2HAc2KSsF8wE4U2Ykbk+U4J8RF+irfdK2wIA=
X-Received: by 2002:a5d:6d0f:0:b0:203:9157:1c48 with SMTP id
 e15-20020a5d6d0f000000b0020391571c48mr3565281wrq.192.1646986642028; Fri, 11
 Mar 2022 00:17:22 -0800 (PST)
MIME-Version: 1.0
References: <20220310195229.109477-1-nick.hawkins@hpe.com> <20220310195229.109477-9-nick.hawkins@hpe.com>
In-Reply-To: <20220310195229.109477-9-nick.hawkins@hpe.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 11 Mar 2022 09:17:06 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Wsd31DhPKZefm9742M-4B3ofg=CsS9+P4nXxM=4HsVg@mail.gmail.com>
Message-ID: <CAK8P3a0Wsd31DhPKZefm9742M-4B3ofg=CsS9+P4nXxM=4HsVg@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] arch: arm: boot: dts: Introduce HPE GXP Device tree
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
List-Id: <soc.lore.kernel.org>
Cc: "Verdun, Jean-Marie" <verdun@hpe.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:raJB9MXzy2k6K6NwG6QNA/mJO6lIoriCQWAGpiOaGfvrVVBjpQn
 PSf8sryvazMy8FpXPIUOoRqDxD8LjGq0qmmH5ZLpthpv8wzSFPCFtKlviwpYaj0lL6ahonf
 AiOSEVtDdip/F0/jK/UoeT90xgCzaxFq+RC9onCfDqRBOaTiA0m5Xu3VxqcCunoQfBFVVpz
 oDCUU+IjSMoSt2vGW9PtQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TUmuQlPnvfE=:8xzMWknHfqgeE9A3AH0lkq
 nbUqFn7/stbC63lQ1HaiRMePTMXYNiruyV70ywMtdhO9p4k94pqw3mBQGbAjDrYljcfHP2FTV
 G3rvrFCu3thUEphnfqGZ0J7iCm9oJIV69NSg0s6BiTVxZhC8PSAA8+wECP1dcb8VuUBKqKIVH
 hZ5ToAPc1/GUts+Zlykb7grgJXo8ywkNV6+rO0jKDtR0ihfNOmNZLwpzTb+1MA0hb8YV03o08
 gtTc2zne22uo3AyrMRqFdox6puolikpEl4BnHo4XgQuBDtFxobnrLenyHxo7QD6p/M2uP2Nwq
 HdmFdCveHEjDaT5qyafpNQG/2kyNyJ0+YG4GY80gkFVFW2PUYgvrjR4tvMm8yCKgtc87d5a/3
 8/Y3G7gRg+F+lVk6YAUodzOcBPnc+ubG73OqTXxQx2e69SrJKF6LlITt8bvDJvLlfJYY8EUNC
 WnXC03RuxohYxeMNdGZMuAHsh4RgVfINtd/5NgD06WPDY8v7lPdwIvdpS9k8Gn50U8hXKhqmY
 haPQW/gXL2N0RxSeUlQWMZi65uA/tnmtgnOWyKR9X5KKbefByByD07ahP0tq904ZE+3JC4WOw
 1E5JmDLHGDWyO6dM9uwdcmkj6HbTQ9QtomtGT/XptmQgiPJv08XjmGJJNuc7SdlkosP2Qhn0F
 XVvKU7fKCqzaA4dIbW78/NyWa+M46sku0iKwKiZVLxP7e5d2AjpBI7lF1dJ6GkZy7DVVtufgn
 bKNdKjDEoHPBDevn6UBQWbs6fo2SIQqT2cTlZCjJF+CirL1ST1IRG5zMVQVIBnn9gk7qrr6m+
 KaWLPXJu3oEMFDbnISVqJVFQmCJ9s5YK/znPLwv8z0YZfMGlO0=

On Thu, Mar 10, 2022 at 8:52 PM <nick.hawkins@hpe.com> wrote:
>
> From: Nick Hawkins <nick.hawkins@hpe.com>
>
> The HPE SoC is new to linux. This patch
> creates the basic device tree layout with minimum required
> for linux to boot. This includes timer and watchdog
> support.
>
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> +/ {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       compatible = "hpe,gxp";
> +       model = "Hewlett Packard Enterprise ProLiant dl360 Gen10";
> +
> +       chosen {
> +               bootargs = "earlyprintk console=ttyS2,115200";
> +       };

Please drop the bootargs here, you definitely should not have 'earlyprintk'
in the bootargs because that is incompatible with cross-platform kernels.

Instead of passing the console in the bootargs, use the "stdout-path"
property.

The "compatible" property should be a list that contains at least the specific
SoC variant and an identifier for the board. "hpe,gxp" is way too generic
to be the only property here.
> +       gxp-init@cefe0010 {
> +               compatible = "hpe,gxp-cpu-init";
> +               reg = <0xcefe0010 0x04>;
> +       };
> +
> +       memory@40000000 {
> +               device_type = "memory";
> +               reg = <0x40000000 0x20000000>;
> +       };
> +
> +       ahb {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               device_type = "soc";
> +               ranges;
> +
> +               vic0: interrupt-controller@ceff0000 {
> +                       compatible = "arm,pl192-vic";
> +                       interrupt-controller;
> +                       reg = <0xceff0000 0x1000>;
> +                       #interrupt-cells = <1>;
> +               };

I don't think this represents the actual hierarchy of the devices:
the register range of the "vic0" and the "gxp-init" is very close
together, which usually indicates that they are also on the same
bus.



> +               vic1: interrupt-controller@80f00000 {
> +                       compatible = "arm,pl192-vic";
> +                       interrupt-controller;
> +                       reg = <0x80f00000 0x1000>;
> +                       #interrupt-cells = <1>;
> +               };
> +
> +               timer0: timer@c0000080 {
> +                       compatible = "hpe,gxp-timer";
> +                       reg = <0xc0000080 0x1>, <0xc0000094 0x01>, <0xc0000088 0x08>;
> +                       interrupts = <0>;
> +                       interrupt-parent = <&vic0>;
> +                       clock-frequency = <400000000>;
> +               };
> +
> +               uarta: serial@c00000e0 {
> +                       compatible = "ns16550a";
> +                       reg = <0xc00000e0 0x8>;
> +                       interrupts = <17>;
> +                       interrupt-parent = <&vic0>;
> +                       clock-frequency = <1846153>;
> +                       reg-shift = <0>;
> +               };

In turn, you seem to have a lot of other devices on low addresses
of the 0xc0000000 range, which would be an indication that these
are on a different bus from the others.

Please see if you can find an internal datasheet that describes the
actual device hierarchy, and then try to model this in the device tree.

Use non-empty "ranges" properties to describe the address ranges
and how they get translated between these buses, and add
"dma-ranges" for any high-speed buses that have DMA master
capable devices like USB on them.

> +               i2cg: syscon@c00000f8 {
> +                       compatible = "simple-mfd", "syscon";
> +                       reg = <0xc00000f8 0x08>;
> +               };
> +       };

It's odd to have a "syscon" device that only has 8 bytes worth of registers.

What are the contents of this? Is it possible to have a proper abstraction
for it as something that has a specific purpose rather than being a
random collection of individual bits?

       Arnd
