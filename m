Return-Path: <robh+dt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58822C7618A
	for <soc@archiver.kernel.org>; Thu, 16 Mar 2023 19:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28F99C433AA; Thu, 16 Mar 2023 19:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B86C4339B;
	Thu, 16 Mar 2023 19:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678995911;
	bh=W9BvPruvLFXiqqU0Yp/MQLGjcxYt2OVc8cFT/mb/HpE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=DvbFvN8VJHe0+Sgl8PvjUNdWekKPi28IfwiONscqwasM1eu7fOOUuggwP/Slw5wma
	 tZKlupIyEyA8dhA3FtgBi6clTT+j14me9FduIE16pBsfSnxO638ToZ9gOlP1WO9Rqm
	 SD+z4g8JiuJ8PckFSrRpJ1lstdAVRndgaAlhFNiU9RYHEdZ8Iu4pLuU7scVi3ym5g1
	 Z7I4CtxCrrAMlfsjQkWDU/sv8zKcFmv77Ruw5p5bmKGfGa339pkfsGS0w3K81Opbbb
	 NoPnyHeoYjMXs3P8+iGF0UgZtys6Y+fUxRK2Pe1LwF6v9EuNxlxgcwoYXQAogJze5l
	 23JIegFYmFHYQ==
Received: by mail-ua1-f49.google.com with SMTP id h34so1924848uag.4;
        Thu, 16 Mar 2023 12:45:10 -0700 (PDT)
X-Gm-Message-State: AO0yUKU4MRAmcUPDmvJK8utMODaMIil4CxW5pPhOZuYtq7gzF2qX4+lE
	aTajK1eHTsT63FRv6/KvZQQno0J19A4Qzz19yg==
X-Google-Smtp-Source: AK7set9dqHb1c7ZEjYKIfhM4Q7IhcvnVkObFO8uUZiSTaVVVjeHe2s6UXtoMn8xx0TkL5CDNz6/2Jt0ED+Yxl+CVWnI=
X-Received: by 2002:ab0:5402:0:b0:68a:a9d:13f5 with SMTP id
 n2-20020ab05402000000b0068a0a9d13f5mr28678936uaa.1.1678995909810; Thu, 16 Mar
 2023 12:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230315010920.2473206-1-danielwa@cisco.com>
In-Reply-To: <20230315010920.2473206-1-danielwa@cisco.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 16 Mar 2023 14:44:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKC+ggxx21anS1aPJgR2NZ1jzdXxaC65bNnjKCXia1GMw@mail.gmail.com>
Message-ID: <CAL_JsqKC+ggxx21anS1aPJgR2NZ1jzdXxaC65bNnjKCXia1GMw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: cisco: add device tree for Cisco CrayAr Argos.
To: Daniel Walker <danielwa@cisco.com>
List-Id: <soc.lore.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, xe-linux-external@cisco.com, 
	Marcin Wierzbicki <mawierzb@cisco.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 8:12=E2=80=AFPM Daniel Walker <danielwa@cisco.com> =
wrote:
>
> From: Marcin Wierzbicki <mawierzb@cisco.com>
>
> This adds device tree include file for Cisco CrayAR SoC and
> device tree file for Cisco CrayAR Argos EVB board.

Run dtbs_check on your platform and fix all the errors. Some examples below=
...
>
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Marcin Wierzbicki <mawierzb@cisco.com>
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>  .../devicetree/bindings/arm/cisco/crayar.yaml |  27 ++
>  MAINTAINERS                                   |   5 +
>  arch/arm64/Kconfig.platforms                  |   5 +
>  arch/arm64/boot/dts/Makefile                  |   1 +
>  arch/arm64/boot/dts/cisco/Makefile            |   2 +
>  arch/arm64/boot/dts/cisco/crayar.dtsi         | 326 ++++++++++++++++++
>  arch/arm64/boot/dts/cisco/crayar_argos.dts    |  32 ++
>  7 files changed, 398 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/cisco/crayar.ya=
ml
>  create mode 100644 arch/arm64/boot/dts/cisco/Makefile
>  create mode 100644 arch/arm64/boot/dts/cisco/crayar.dtsi
>  create mode 100644 arch/arm64/boot/dts/cisco/crayar_argos.dts
>
> diff --git a/Documentation/devicetree/bindings/arm/cisco/crayar.yaml b/Do=
cumentation/devicetree/bindings/arm/cisco/crayar.yaml
> new file mode 100644
> index 000000000000..3975ca4fd07a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/cisco/crayar.yaml
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/cisco/crayar.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cisco CrayAR based Platforms Device Tree Bindings
> +
> +maintainers:
> +  - xe-linux-external@cisco.com
> +
> +description: |
> +  Cisco CrayAR boards with CrayAR SOC
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: Cisco CrayAR Argos evaluation board
> +        items:
> +          - const: cisco,crayar-argos
> +          - const: cisco,crayar
> +
> +additionalProperties: true
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ec57c42ed544..f94d769c6f88 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4793,6 +4793,11 @@ X:       drivers/char/ipmi/
>  X:     drivers/char/random.c
>  X:     drivers/char/tpm/
>
> +CISCO ARM64 DEVICE TREE SUPPORT
> +M:     xe-linux-external@cisco.com
> +S:     Supported
> +F:     arch/arm64/boot/dts/cisco/
> +
>  CHECKPATCH
>  M:     Andy Whitcroft <apw@canonical.com>
>  M:     Joe Perches <joe@perches.com>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 89a0b13b058d..740099c56382 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -94,6 +94,11 @@ config ARCH_BITMAIN
>         help
>           This enables support for the Bitmain SoC Family.
>
> +config ARCH_CISCO_CRAYAR_ARGOS
> +       bool "Cisco Argos Platform"
> +       help
> +         This enables support for the Cisco Argos Platform.
> +
>  config ARCH_EXYNOS
>         bool "Samsung Exynos SoC family"
>         select COMMON_CLK_SAMSUNG
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index 7b107fa7414b..3f83583f9996 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -11,6 +11,7 @@ subdir-y +=3D arm
>  subdir-y +=3D bitmain
>  subdir-y +=3D broadcom
>  subdir-y +=3D cavium
> +subdir-y +=3D cisco
>  subdir-y +=3D exynos
>  subdir-y +=3D freescale
>  subdir-y +=3D hisilicon
> diff --git a/arch/arm64/boot/dts/cisco/Makefile b/arch/arm64/boot/dts/cis=
co/Makefile
> new file mode 100644
> index 000000000000..b1d4220df2f4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/cisco/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_CISCO_CRAYAR_ARGOS) +=3D crayar_argos.dtb
> diff --git a/arch/arm64/boot/dts/cisco/crayar.dtsi b/arch/arm64/boot/dts/=
cisco/crayar.dtsi
> new file mode 100644
> index 000000000000..22579406e65c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/cisco/crayar.dtsi
> @@ -0,0 +1,326 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Include file for Cisco CrayAR family SoC.
> + *
> + * Copyright (C) 2022 Cisco
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +       compatible =3D "cisco,crayar";
> +       interrupt-parent =3D <&gic>;
> +       #address-cells =3D <0x2>;
> +       #size-cells =3D <0x2>;
> +
> +       base_clk: base-clk {
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               clock-frequency =3D <500000000>;
> +       };
> +
> +       cpus {
> +               #address-cells =3D <0x1>;

Should be 2.

> +               #size-cells =3D <0x0>;
> +
> +               cpu0: cpu@0 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a75", "arm,armv8";

"arm,armv8" is only for s/w emulators.

> +                       reg =3D <0x00000>;
> +                       enable-method =3D "spin-table";
> +                       cpu-release-addr =3D <0x0 0x7003FFF8>;
> +                       next-level-cache =3D <&l2_0>;
> +               };
> +
> +               cpu1: cpu@100 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a75", "arm,armv8";
> +                       reg =3D <0x00100>;
> +                       enable-method =3D "spin-table";
> +                       cpu-release-addr =3D <0x0 0x7003FFF8>;
> +                       next-level-cache =3D <&l2_1>;
> +               };
> +
> +               cpu2: cpu@200 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a75", "arm,armv8";
> +                       reg =3D <0x00200>;
> +                       enable-method =3D "spin-table";
> +                       cpu-release-addr =3D <0x0 0x7003FFF8>;
> +                       next-level-cache =3D <&l2_2>;
> +               };
> +
> +               cpu3: cpu@300 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a75", "arm,armv8";
> +                       reg =3D <0x00300>;
> +                       enable-method =3D "spin-table";
> +                       cpu-release-addr =3D <0x0 0x7003FFF8>;
> +                       next-level-cache =3D <&l2_3>;
> +               };
> +
> +               cpu4: cpu@10000 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a75", "arm,armv8";
> +                       reg =3D <0x10000>;
> +                       enable-method =3D "spin-table";
> +                       cpu-release-addr =3D <0x0 0x7003FFF8>;
> +                       next-level-cache =3D <&l2_4>;
> +               };
> +
> +               cpu5: cpu@10100 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a75", "arm,armv8";
> +                       reg =3D <0x10100>;
> +                       enable-method =3D "spin-table";
> +                       cpu-release-addr =3D <0x0 0x7003FFF8>;
> +                       next-level-cache =3D <&l2_5>;
> +               };
> +
> +               cpu6: cpu@10200 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a75", "arm,armv8";
> +                       reg =3D <0x10200>;
> +                       enable-method =3D "spin-table";
> +                       cpu-release-addr =3D <0x0 0x7003FFF8>;
> +                       next-level-cache =3D <&l2_6>;
> +               };
> +
> +               cpu7: cpu@10300 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a75", "arm,armv8";
> +                       reg =3D <0x10300>;
> +                       enable-method =3D "spin-table";
> +                       cpu-release-addr =3D <0x0 0x7003FFF8>;
> +                       next-level-cache =3D <&l2_7>;
> +               };
> +
> +               cpu-map {
> +                       cluster0 {
> +                               core0 {
> +                                       cpu =3D <&cpu0>;
> +                               };
> +                               core1 {
> +                                       cpu =3D <&cpu1>;
> +                               };
> +                               core2 {
> +                                       cpu =3D <&cpu2>;
> +                               };
> +                               core3 {
> +                                       cpu =3D <&cpu3>;
> +                               };
> +                       };
> +                       cluster1 {
> +                               core0 {
> +                                       cpu =3D <&cpu4>;
> +                               };
> +                               core1 {
> +                                       cpu =3D <&cpu5>;
> +                               };
> +                               core2 {
> +                                       cpu =3D <&cpu6>;
> +                               };
> +                               core3 {
> +                                       cpu =3D <&cpu7>;
> +                               };
> +                       };
> +               };
> +
> +               l2_0: l2-cache0 {
> +                       compatible =3D "cache";
> +                       next-level-cache =3D <&l3_0>;

Missing properties.

> +               };
> +
> +               l2_1: l2-cache1 {
> +                       compatible =3D "cache";
> +                       next-level-cache =3D <&l3_0>;
> +               };
> +
> +               l2_2: l2-cache2 {
> +                       compatible =3D "cache";
> +                       next-level-cache =3D <&l3_0>;
> +               };
> +
> +               l2_3: l2-cache3 {
> +                       compatible =3D "cache";
> +                       next-level-cache =3D <&l3_0>;
> +               };
> +
> +               l2_4: l2-cache4 {
> +                       compatible =3D "cache";
> +                       next-level-cache =3D <&l3_1>;
> +               };
> +
> +               l2_5: l2-cache5 {
> +                       compatible =3D "cache";
> +                       next-level-cache =3D <&l3_1>;
> +               };
> +
> +               l2_6: l2-cache6 {
> +                       compatible =3D "cache";
> +                       next-level-cache =3D <&l3_1>;
> +               };
> +
> +               l2_7: l2-cache7 {
> +                       compatible =3D "cache";
> +                       next-level-cache =3D <&l3_1>;
> +               };
> +
> +               l3_0: l3-cache0 {
> +                       compatible =3D "cache";
> +               };
> +
> +               l3_1: l3-cache1 {
> +                       compatible =3D "cache";
> +               };
> +       };
> +
> +       cci: cci@2E000000 {
> +               compatible =3D "arm,cci-550";
> +               #address-cells =3D <0x1>;
> +               #size-cells =3D <0x1>;
> +               reg =3D <0x0 0x2E000000 0x0 0x1000>;
> +               ranges =3D <0x0 0x0 0x2E000000 0x6000>;
> +
> +               secondary-if@1000 {
> +                       compatible =3D "arm,cci-550-ctrl-if";
> +                       interface-type =3D "ace-lite";
> +                       reg =3D <0x1000 0x1000>;
> +               };
> +
> +               secondary-if@2000 {
> +                       compatible =3D "arm,cci-550-ctrl-if";
> +                       interface-type =3D "ace-lite";
> +                       reg =3D <0x2000 0x1000>;
> +               };
> +
> +               secondary-if@3000 {
> +                       compatible =3D "arm,cci-550-ctrl-if";
> +                       interface-type =3D "ace-lite";
> +                       reg =3D <0x3000 0x1000>;
> +               };
> +
> +               secondary-if@4000 {
> +                       compatible =3D "arm,cci-550-ctrl-if";
> +                       interface-type =3D "ace";
> +                       reg =3D <0x4000 0x1000>;
> +               };
> +
> +               secondary-if@5000 {
> +                       compatible =3D "arm,cci-550-ctrl-if";
> +                       interface-type =3D "ace";
> +                       reg =3D <0x5000 0x1000>;
> +               };
> +
> +               secondary-if@6000 {
> +                       compatible =3D "arm,cci-550-ctrl-if";
> +                       interface-type =3D "ace";
> +                       reg =3D <0x6000 0x1000>;
> +               };
> +
> +               secondary-if@7000 {
> +                       compatible =3D "arm,cci-550-ctrl-if";
> +                       interface-type =3D "ace";
> +                       reg =3D <0x6000 0x1000>;
> +               };
> +
> +               pm-cntr@10000 {
> +                       compatible =3D "arm,cci-550-pmu";
> +                       reg =3D <0x10000 0x10000>;
> +               };
> +
> +               pm-cntr@20000 {
> +                       compatible =3D "arm,cci-550-pmu";
> +                       reg =3D <0x20000 0x10000>;
> +               };
> +
> +               pm-cntr@30000 {
> +                       compatible =3D "arm,cci-550-pmu";
> +                       reg =3D <0x30000 0x10000>;
> +               };
> +
> +               pm-cntr@40000 {
> +                       compatible =3D "arm,cci-550-pmu";
> +                       reg =3D <0x40000 0x10000>;
> +               };
> +
> +               pm-cntr@50000 {
> +                       compatible =3D "arm,cci-550-pmu";
> +                       reg =3D <0x50000 0x10000>;
> +               };
> +
> +               pm-cntr@60000 {
> +                       compatible =3D "arm,cci-550-pmu";
> +                       reg =3D <0x60000 0x10000>;
> +               };
> +
> +               pm-cntr@70000 {
> +                       compatible =3D "arm,cci-550-pmu";
> +                       reg =3D <0x70000 0x10000>;
> +               };
> +
> +               pm-cntr@80000 {
> +                       compatible =3D "arm,cci-550-pmu";
> +                       reg =3D <0x80000 0x10000>;
> +               };
> +       };
> +
> +       timer: timer {
> +               compatible =3D "arm,armv8-timer";
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D    <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +
> +       gic: interrupt-controller@20000000 {
> +               compatible =3D "arm,gic-v3";
> +               #interrupt-cells =3D <3>;
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges;
> +               interrupt-controller;
> +               reg =3D   <0x0 0x20000000 0x0 0x10000>,   /* GICD */
> +                       <0x0 0x20060000 0x0 0x100000>;  /* GICR */
> +
> +               interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +
> +               its: its@20040000 {

msi-controller@...

> +                       compatible =3D "arm,gic-v3-its";
> +                       msi-controller;
> +                       mbi-ranges =3D <256 224>;
> +                       reg =3D <0x0 0x20040000 0x0 0x10000>;
> +               };
> +       };
> +
> +       soc {
> +               compatible =3D "simple-bus";
> +               #address-cells =3D <0x2>;
> +               #size-cells =3D <0x2>;
> +               ranges =3D <0x0 0x0 0x0 0x0 0x100 0x0>;
> +
> +               uart0: serial@23f80000 {
> +                       compatible =3D "ns16550a";
> +                       reg =3D <0x0 0x23f80000 0x0 0x100>;
> +                       interrupts =3D <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
> +                       reg-shift =3D <0x2>;
> +                       reg-io-width =3D <0x4>;
> +                       clocks =3D <&base_clk>;
> +                       current-speed =3D <9600>;
> +                       status =3D "disabled";
> +               };
> +
> +               uart1: serial@23fc0000 {
> +                       compatible =3D "ns16550a";
> +                       reg =3D <0x0 0x23fc0000 0x0 0x100>;
> +                       interrupts =3D <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
> +                       reg-shift =3D <0x2>;
> +                       reg-io-width =3D <0x4>;
> +                       clocks =3D <&base_clk>;
> +                       current-speed =3D <9600>;
> +                       status =3D "disabled";
> +               };
> +       };
> +};
> diff --git a/arch/arm64/boot/dts/cisco/crayar_argos.dts b/arch/arm64/boot=
/dts/cisco/crayar_argos.dts
> new file mode 100644
> index 000000000000..d415427c145f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/cisco/crayar_argos.dts
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree file for Cisco CrayAR Argos EVB board.
> + *
> + * Copyright (C) 2022 Cisco
> + */
> +
> +/dts-v1/;
> +#include "crayar.dtsi"
> +
> +/ {
> +       compatible =3D "cisco,crayar-argos", "cisco,crayar";
> +       model =3D "Cisco CrayAr Argos EVB";
> +       version =3D <0x00000001>;
> +
> +       aliases {
> +               serial0 =3D &uart0;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial0:9600n8";
> +       };
> +
> +       memory {

Needs unit-address.

> +               device_type =3D "memory";
> +               reg =3D <0x0 0x80000000 0x0 0x80000000>;
> +       };
> +};
> +
> +&uart0 {
> +       status =3D "okay";
> +};
> --
> 2.25.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
