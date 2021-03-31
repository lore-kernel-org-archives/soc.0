Return-Path: <SRS0=X/nU=I5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA94CC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 07:06:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BEA9619BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 07:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BEA9619BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yeyVGvNwpMiSqbgrlFIu4TweF9RgwsDmV66X7q5mYLM=; b=KCwcL3hMtLyGbDP/NFjVg4NdQ
	RNnFYYAhJD0yulkW+ADpWAQs1G5DCLq+fNSBQxVxvjQ0Pt4idqeUgJGzTdrqztAhuEtD5x9nulo/M
	j8d0Vhgs6Ezt3ipZ69EvoLsygBcGr5NwWJ+S/9ckF1RzlOrnPJmQ4zQBN3bnm7b5cQuwwDGaSL6T+
	odgz00sNn1nZAkBrnjdOMR3xntpRXAB1wGNuJUm0CH9Fl6GSc4imgij+azew5v0QTgEkS3UnMmIeN
	/WHncO8Uti3CfY+md8rK46RvVem2S4KTekDjanOrNaU3/hcQgq4JfwenmtZuinlvuq06J2wPbswua
	AzjpiD1IQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRUuB-005jpN-PX; Wed, 31 Mar 2021 07:04:44 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRUu3-005joH-3Q
 for linux-arm-kernel@lists.infradead.org; Wed, 31 Mar 2021 07:04:38 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MoNyA-1lydmR1ByC-00oocy for <linux-arm-kernel@lists.infradead.org>; Wed,
 31 Mar 2021 09:04:31 +0200
Received: by mail-oi1-f178.google.com with SMTP id n140so19078311oig.9
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 31 Mar 2021 00:04:30 -0700 (PDT)
X-Gm-Message-State: AOAM532Y6jzZt8mPrkpzcUVRU/fvxkuyUU3Kky14VD3AT+6unCgQRhGo
 NTw9DlenGEqprZKbRPCaa77gqH4ETbVWPsI5Ug0=
X-Google-Smtp-Source: ABdhPJyIeGbUukD8qVI5qDo309eo5AeCgLJups4xAzlxGTq91SBqwp+eFLRjPFEBheBw/OjFF0/PbS6AJI3aY8vgrtc=
X-Received: by 2002:aca:5945:: with SMTP id n66mr1326284oib.11.1617174269552; 
 Wed, 31 Mar 2021 00:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210331014603.2496983-1-danielwa@cisco.com>
In-Reply-To: <20210331014603.2496983-1-danielwa@cisco.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 31 Mar 2021 09:04:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1rbGPxjRiUTy3AKh4S9jqxk=SHoa9s0Z-3nhgQb3xJUw@mail.gmail.com>
Message-ID: <CAK8P3a1rbGPxjRiUTy3AKh4S9jqxk=SHoa9s0Z-3nhgQb3xJUw@mail.gmail.com>
Subject: Re: [PATCH] arm64: Add support for cisco craw64 ARMv8 SoCs
To: Daniel Walker <danielwa@cisco.com>
List-Id: <soc.lore.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Ofer Licht <olicht@cisco.com>, xe-linux-external@cisco.com, 
 DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-Provags-ID: V03:K1:gDr0bRLo3WnT7VfYxZ6w2JEFwo9jqaADsc15vWt029fNouwYKI2
 R12rKyOy8zjYYqxz8chSsT8DwIbf9MbKPbD0cJNiXKYQPRdNkf1Cs+j7T4Ym0DINUJckVnr
 iy1r+BTbXG05TFtm3Mm0V0kl/+hr7laFO5VXQPuIO9GR8qy5owVz7HqftfWRa7gJeCr6z4L
 B796wOtgr2EbSrTOGZTxA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y0kmh9ES9lg=:9n+iXdytSx+EYnQB9hVRDH
 qB4kQTNb3rpEgz59SUBCe4Dgc0N1R5j8E5ScDK83L1LuS9hByUUhM8PU7afmP9542HpdqHi/F
 XOodBVGF7uoV3y/QF9iyH1OZrdw0R/lYb8++pkxwp/baS+Nz8uQm8gR+/mn/QHBMBM8Q/uTva
 x327wvT/aMqg5Calne8eL7Oz/IRllQC9wXd1ObrUM6XqAjfLqy/74Vll+qOrLY6msJ/v2dhU3
 XXWAaN6t2xazjQydUX7dkJhOPqMv8/O82mDzoZUc5v82YHfN6m0uVXoCfe0f17gvORcOkdqoW
 qeA1ZqgZYhoHO80e/yf1u10QqOJz8QrYj3DdRI6f5vCcuWTYEnk5k6mk3zpciKWe3z0tQiQJN
 pcGGTwLx3Y31e2ikbcwHazGrnnr4ag39JT4GwIEzshz8Uhvw51qeCOpsQxslJXWv+w1dUMYQZ
 XU0aILXUAUzF4n/GSK9O82az342In5s=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_080435_667794_DCE47C77 
X-CRM114-Status: GOOD (  45.94  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210331070415.4rK0iPuZz1UPKOtRmoNxqBPNvwyEU0gVCgSJpu9kHvc@z>

On Wed, Mar 31, 2021 at 3:46 AM Daniel Walker <danielwa@cisco.com> wrote:
> From: Ofer Licht <olicht@cisco.com>

Thanks for the submission, it's always nice to see a new platform

> Define craw64 config, dts and Makefile for Cisco
> SoCs known as Craw.

I'd like some more information about the platform, e.g. the target
market and maybe a link to the product information.

> Cc: xe-linux-external@cisco.com
> Signed-off-by: Ofer Licht <olicht@cisco.com>
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/Kconfig.platforms                  |   5 +
>  arch/arm64/boot/dts/Makefile                  |   1 +
>  arch/arm64/boot/dts/cisco/Makefile            |   5 +
>  .../arm64/boot/dts/cisco/craw64-dopplerg2.dts | 239 +++++++++++
>  arch/arm64/boot/dts/cisco/craw64.dtsi         | 392 ++++++++++++++++++
>  arch/arm64/configs/defconfig                  |   1 +

We have separate branches for dt, defconfig, and the rest, so it would be
good to split this patch up a little more.

There should also be an entry in the top-level MAINTAINERS file.

> diff --git a/arch/arm64/boot/dts/cisco/craw64-dopplerg2.dts b/arch/arm64/boot/dts/cisco/craw64-dopplerg2.dts
> new file mode 100644
> index 000000000000..20ecc57b4e5c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/cisco/craw64-dopplerg2.dts
> @@ -0,0 +1,239 @@
> +/dts-v1/;
> +
> +#include "craw64.dtsi"
> +
> +/ {
> +       model = "Cisco Craw64 on DopplerG 2.0";
> +       compatible = "cisco,craw64-dopplerg2", "cisco,craw64";
> +
> +       memory {
> +               device_type = "memory";
> +               reg = <0x0 0x80000000 0x0 0x80000000>;
> +       };

The memory size is usually filled by the boot loader, just put an
empty node into the .dtsi file

> +
> +       soc: soc {
> +               uart0: serial@23f80000 {
> +                       clock-frequency = <250000000>;
> +                       status = "ok";
> +               };
> +
> +               uart1: serial@23fc0000 {
> +                       clock-frequency = <250000000>;
> +                       status = "ok";
> +               };
> +
> +               spiclk: spiclk {
> +                       clock-frequency = <250000000>;
> +               };

The clock frequencies can also normally go into the .dtsi, as those
tend to be SoC specific rather than board specific.

> +               spi: spi@24000000 {
> +                       status="ok";
> +                       flash: flash@0 {
> +                               compatible = "micron,n25q128a13", "jedec,spi-nor";
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               spi-max-frequency = <8000000>;
> +                               reg = <0>;
> +                               partition@0 {
> +                                       label = "unused0";
> +                                       reg = <0x0 0x10000>;
> +                                       read-only;
> +                               };
> +                               partition@1 {
> +                                       label = "brom";
> +                                       reg = <0x10000 0x10000>;
> +                               };

The partitions in turn normally go into the bootloader, which
needs to know about them anyway, but might pick different
settings.

> +
> +               stmmaceth: stmmaceth {
> +                       clock-frequency = <250000000>;
> +               };
> +
> +               eth0: dwmac@282c0000 {
> +                       status = "ok";
> +                       mdio-channel = <0>;
> +               };

There is no point in defining labels in the board specific file, as
nothing will reference them. If you define labels in the .dtsi file,
you might find it easier to refer to the nodes by those labels
rather than by the full path.

Both of the node names look wrong here. The name for an ethernet
device should be 'ethernet@282c000'.

> +               wd@28500200 {
> +                       compatible = "cisco,craw-smgmt-wdt";
> +                       reg = <0x28500200 0x140>;
> +               };

Similarly, the watchdog should be watchdog@28500200. I don't
see a binding document for a cisco,craw-smgmt-wdt, so please
drop this node until the binding has been accepted. You can
submit the binding together with the driver or the dts file (as
a separate patch), but I don't want to merge dt nodes without a
reviewed binding, as that has the risk of requiring incompatible
changes later.

> +
> +               doppler_i2c: bsp_i2c {
> +                       compatible = "cisco,dplr-i2c";
> +                       reg = <0x23f71000 0x10>;
> +               };
> +       };
> +       doppler {
> +               intrpt {
> +                       compatible = "cisco,dplr_intrpt";

Same for both of these.

> +                       reg = <0x0 0x20000000 0x0 0x0FFFFFFF>;
> +                       interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "dpu", "oob", "packet", "offload",
> +                               "tla0", "tla1", "misc";
> +               };

The interrupt lines and register numbers are most likely hardwired, so this
again can go into the .dtsi file. It's impossible to know without the binding
document of course.

> diff --git a/arch/arm64/boot/dts/cisco/craw64.dtsi b/arch/arm64/boot/dts/cisco/craw64.dtsi
> new file mode 100644
> index 000000000000..9c3c5c8c252e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/cisco/craw64.dtsi
> @@ -0,0 +1,392 @@
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/* the mbox for spin-table; not sure if this is needed given that it's outside our defined memory zone */
> +/memreserve/ 0x285001F8 0x00000008;

Please don't use spin-table for new machines.

> +
> +/ {
> +       compatible = "cisco,craw64";
> +       interrupt-parent = <&gic>;
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       aliases {
> +               serial0 = &uart0;
> +               spi0 = &spi; /* spi driver uses this to set bus number 0, which is tacked onto the reported device name
> +                               so that we get device spi0 instead of spiN where N is some arbitrary large integer. */
> +       };

The aliases go into the .dts file. In particular when there are two uarts, it is
not obvious that both of them are always connected on all boards, or which
should be the first on a given machine.

> +/* Macro definitions for reference
> + *
> + * define GIC_SPI 0
> + * define GIC_PPI 1
> + *
> + * define GIC_CPU_MASK_RAW(x) ((x) << 8)
> + *
> + * define IRQ_TYPE_EDGE_RISING    1
> + * define IRQ_TYPE_LEVEL_HIGH     4
> + */

If you prefer the numbers, it's generally fine to just open-code
these. No need for
the comment here either way.

> +
> +               reset: reset@20001004 {
> +                       compatible = "syscon";
> +                       reg = <0x20001004 0x4>;
> +               };
...
> +               reboot: reboot@20001004 {
> +                       compatible = "syscon-reboot";
> +                       regmap = <&reset>;
> +                       offset = <0x0>;
> +                       mask = <0xE0002001>;
> +               };

This doesn't look right, you have two nodes with the same unit address here,
and the syscon seems to only have a single register?

> +               spiclk: spiclk {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <1>;
> +                       clock-output-names = "spiclk";
> +               };
> +
> +               spi:    spi@24000000 {
> +                       compatible      = "snps,dw-spi-nor";
> +                       reg = <0x24000000 0x1000>;
> +                       interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       num-cs = <4>;
> +                       clocks = <&spiclk 0>;
> +                       status="disabled";
> +               };

Which device is this? I see a binding for a designware SPI controller,
but it does not list that compatible string.

> +
> +               ciu: ciu {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <1>;
> +                       clock-output-names = "ciu";
> +               };
> +
> +               biu: biu {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <1>;
> +                       clock-output-names = "biu";
> +               };

If you have a fixed-clock, there should be a clock-frequency in the node.
If it's not actually fixed, you probably want a clock controller driver.

If these are actually fixed clocks, they should be defined outside of the
/soc node, to indicate that they are signals coming into the soc. Normally
you'd group them under some other node then for readability.

> +               i2c@23f70400 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       compatible = "snps,designware-i2c";
> +                       reg = <0x23f70400 0x100>;
> +                       interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&biu 0 &ciu 0>;
> +                       clock-names = "biu", "ciu";
> +                       interrupt-names = "dwi2c-0";
> +                       status="disabled";
> +                       controller-id = <0>;
> +               };

This is incompatible with the binding: the clock-names are wrong, and
there are extraneous interrupt-names and controller-id properties.

> +               eth0: dwmac@282c0000 {
> +                       compatible = "snps,craw-dwmac";
> +                       reg = <0x282c0000 0x8000>;
> +                       interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "macirq";
> +                       clock-names = "stmmaceth";
> +                       clocks = <&stmmaceth 0>;
> +                       phy-mode = "sgmii";
> +                       status = "disabled";
> +               };

There is no binding for this device. It would be good to add a specific
version of the dwmac controller as a second compatible string.

The phy-mode usually goes into the .dts file and defines how it is wired up.

> +               ehci: ehci@281c0000 {
> +                       compatible = "generic-ehci";
> +                       interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> +                       reg = <0x281c0000 0x90 0x281c0000 0x24>;
> +                       clocks = <&biu 0 &ciu 0>;
> +                       clock-names = "biu", "ciu";
> +               };
> +
> +               ohci: ohci@0x28200000 {
> +                       compatible = "generic-ohci";
> +                       interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> +                       reg = <0x28200000 0x90>;
> +                       clocks = <&biu 0 &ciu 0>;
> +                       clock-names = "biu", "ciu";
> +               };

These bindings do not define clock-names.

> +
> +               mc: memory-controller@20140000 {
> +                       compatible = "cisco,craw-dmc-400";
> +                       reg = <0x20140000 0x40000
> +                               0x20200000 0x1000>;
> +                       reg-names = "dmc", "config";
> +                       interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +       };

Missing binding.

> +       pcie0: pcie@0 {
> +               status = "disabled";
> +               compatible = "cisco,craw-pcie", "snps,dw-pcie";

Missing binding.

> +               interrupts = <GIC_SPI 184 IRQ_TYPE_EDGE_RISING>;
> +               reg = <0x0 0x28370004 0x0 0x00000008    /* controller registers */
> +                       0x0 0x73ffe000 0x0 0x00004000>;  /* configuration space */
> +               reg-names = "regs", "config";
> +               #address-cells = <3>;
> +               #size-cells = <2>;
> +               device_type = "pci";
> +               num-lanes = <1>;
> +               bus-range = <0x0 0xff>;
> +               ranges = <0x43000000 0x20 0x00000000 0x20 0x00000000 0x0 0x80000000>; /* prefetchable memory */
> +       };

You need at least one non-prefetchable memory area for PCI compliance.
There should normally also be an I/O range, but that is optional.

> +       doppler {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               compatible = "simple-bus";
> +               ranges;
> +       };

What is this?

          Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
