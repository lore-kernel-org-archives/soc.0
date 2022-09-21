Return-Path: <SRS0=vXQJ=ZY=gmail.com=aladyshev22@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BA1ECAAD8
	for <soc@archiver.kernel.org>; Wed, 21 Sep 2022 21:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9742BC433D6; Wed, 21 Sep 2022 21:15:23 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C154C433C1
	for <soc@kernel.org>; Wed, 21 Sep 2022 21:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C154C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 198so9981739ybc.1
        for <soc@kernel.org>; Wed, 21 Sep 2022 14:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=IDmmjofgtZwqrRAfparEl4jMRagfGOdQ9LQWBlcx9iI=;
        b=hKu+Z4hfa2Rp2/e+0PXGx1pZbULensvcxRnvPo9AODdsId5gj/1ZibAHoprGHGZatC
         0dSCXaU3U1DTpW8Kx75WMeX6w5GtrOQe9oo+6iIiOa7befQdJiQ6V5kdmR5Zi/yjYRVx
         NPmaLYqeT/67pPctcFhLIzuhKfLegJiBRzMka2G8iGh26B/30wWyiAitargMNn9yTgzm
         rSlJcT7nkStxJZgvXVES6SANCljqDNHuPdU2h3sgatGoY3MDYYfFYo/ytU76GGrV+ihx
         zPHYigEm6IjUXjr7StR4nHwBDAEsE4Vzb/K//NcFKAwUOBEAIL/Ii1w0/pCnTpHHuJhD
         WdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=IDmmjofgtZwqrRAfparEl4jMRagfGOdQ9LQWBlcx9iI=;
        b=DLTSx3a+lW1EiHBh8Dz4f6yWLvRIDF25hVpB2zFIOvGxFIZsWrFhDI2Wmj1RqAncsb
         ZcGs3ItE3rlZ1OGaaBNGivsUFmhQ+NmFmT92uW1ENr9B6v/kIhMuUoxgzQK4Msdqif/G
         CVL4o1DNvPANe1i5irPyipenQ+ekjC0EaIXMkZXCXkEiVQUKbRt8G/Jdy5gPnQSR/Q2S
         99pwMwI29L7QgkZ5vnMigja1VMwOQYTDHEc0kl/+PnatfDoKC+bfw9LKf9J1aaAFAh+a
         WvV2CTaPGQz9tngSkdkjtMeEBE8GrBREROTHXNElHvuUI0cvNjXvyhptdG0LLBrjCIH9
         ZIQw==
X-Gm-Message-State: ACrzQf0dfYzwPR7DV5xkGjn4PloHWOT/cL0d1WUKgHekGMNHy0EQd5dv
	6eZjcCDD/J4Oi8fobycPzCl064oiU+iUsR3RLyw=
X-Received: by 2002:a25:ab85:0:b0:6af:faae:55a2 with SMTP id
 v5-20020a25ab85000000b006affaae55a2mt239953ybi.43.1663794919933; Wed, 21 Sep
 2022 14:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220920165404.14099-1-aladyshev22@gmail.com> <20220921210950.10568-1-aladyshev22@gmail.com>
 <20220921210950.10568-3-aladyshev22@gmail.com>
In-Reply-To: <20220921210950.10568-3-aladyshev22@gmail.com>
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Thu, 22 Sep 2022 00:15:07 +0300
Message-ID: <CACSj6VWg+QfSYqeeUR5vtgJFLJg5us5-=D_Esj5NK-uvtH2B3g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add AMD DaytonaX BMC
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@aj.id.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

Sorry, I still have some questions, can you please help me?

I work with kernel in the context of the OpenBMC project, and it is
not possible to run 'make dtbs_check' in the linux kernel devshell
(Yocto). So I've tried to download upstream kernel and have performed
the following commands to make the dtbs_check:
```
$ make ARCH=arm aspeed_g5_defconfig && make ARCH=arm dtbs_check
```
This gave me a ton of output regarding all the problems in all of the
aspeed boards. 'wc -l' says that the log file is about 7080 lines
long. Is it possible to get the output only for my target DTS? The
article that you've referred to
(https://www.kernel.org/doc/Documentation/devicetree/writing-schema.rst)
only have the information about how to run checks against one schema
(DT_SCHEMA_FILES), but it is not the same thing.

I've manually tried to split the output regarding my DTS file, but
even so the output is overwhelming - https://pastebin.com/b92rnBt0. I
just don't understand if the mentioned things are about the common
"aspeed-g5.dtsi" file that I should ignore or the things regarding
errors in my submitted DTS file. Can you give me some advice on that?

Anyway I think I've updated my patchset regarding all the things that
you've mentioned explicitly. I've split the patchset to two as you've
requested and have added a cover letter. I hope I did everything
correctly.
But I'm still not sure about this 'make dtbs_check'. If I did
something wrong, please correct me.

Best regards,
Konstantin Aladyshev

On Thu, Sep 22, 2022 at 12:10 AM Konstantin Aladyshev
<aladyshev22@gmail.com> wrote:
>
> Add initial version of device tree for the BMC in the AMD DaytonaX
> platform.
>
> AMD DaytonaX platform is a customer reference board (CRB) with an
> Aspeed ast2500 BMC manufactured by AMD.
>
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts | 319 ++++++++++++++++++
>  2 files changed, 320 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 05d8aef6e5d2..d81fe7ef5475 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1574,6 +1574,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-ast2500-evb.dtb \
>         aspeed-ast2600-evb-a1.dtb \
>         aspeed-ast2600-evb.dtb \
> +       aspeed-bmc-amd-daytonax.dtb \
>         aspeed-bmc-amd-ethanolx.dtb \
>         aspeed-bmc-ampere-mtjade.dtb \
>         aspeed-bmc-arm-stardragon4800-rep2.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts b/arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts
> new file mode 100644
> index 000000000000..64bb9bf92de2
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts
> @@ -0,0 +1,319 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +       model = "AMD DaytonaX BMC";
> +       compatible = "amd,daytonax-bmc", "aspeed,ast2500";
> +
> +       memory@80000000 {
> +               reg = <0x80000000 0x20000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               video_engine_memory: jpegbuffer {
> +                       size = <0x02000000>;    /* 32M */
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
> +       };
> +
> +       aliases {
> +               serial0 = &uart1;
> +               serial4 = &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200";
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               led-fault {
> +                       gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               led-identify {
> +                       gpios = <&gpio ASPEED_GPIO(A, 3) GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
> +                       <&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>,
> +                       <&adc 10>, <&adc 11>, <&adc 12>, <&adc 13>, <&adc 14>,
> +                       <&adc 15>;
> +       };
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "bmc";
> +               #include "openbmc-flash-layout.dtsi"
> +       };
> +};
> +
> +&mac0 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
> +};
> +
> +&uart1 {
> +       //Host Console
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd1_default
> +               &pinctrl_rxd1_default
> +               &pinctrl_nrts1_default
> +               &pinctrl_ndtr1_default
> +               &pinctrl_ndsr1_default
> +               &pinctrl_ncts1_default
> +               &pinctrl_ndcd1_default
> +               &pinctrl_nri1_default>;
> +};
> +
> +&uart5 {
> +       //BMC Console
> +       status = "okay";
> +};
> +
> +&vuart {
> +       status = "okay";
> +       aspeed,lpc-io-reg = <0x3f8>;
> +       aspeed,lpc-interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&adc {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc0_default
> +               &pinctrl_adc1_default
> +               &pinctrl_adc2_default
> +               &pinctrl_adc3_default
> +               &pinctrl_adc4_default
> +               &pinctrl_adc5_default
> +               &pinctrl_adc6_default
> +               &pinctrl_adc7_default
> +               &pinctrl_adc8_default
> +               &pinctrl_adc9_default
> +               &pinctrl_adc10_default
> +               &pinctrl_adc11_default
> +               &pinctrl_adc12_default
> +               &pinctrl_adc13_default
> +               &pinctrl_adc14_default
> +               &pinctrl_adc15_default>;
> +};
> +
> +&gpio {
> +       status = "okay";
> +       gpio-line-names =
> +       /*A0-A7*/       "","","led-fault","led-identify","","","","",
> +       /*B0-B7*/       "","","","","","","","",
> +       /*C0-C7*/       "id-button","","","","","","","",
> +       /*D0-D7*/       "","","ASSERT_BMC_READY","","","","","",
> +       /*E0-E7*/       "reset-button","reset-control","power-button","power-control","",
> +                       "power-good","power-ok","",
> +       /*F0-F7*/       "","","","","","","BATTERY_DETECT","",
> +       /*G0-G7*/       "","","","","","","","",
> +       /*H0-H7*/       "","","","","","","","",
> +       /*I0-I7*/       "","","","","","","","",
> +       /*J0-J7*/       "","","","","","","","",
> +       /*K0-K7*/       "","","","","","","","",
> +       /*L0-L7*/       "","","","","","","","",
> +       /*M0-M7*/       "","","","","","","","",
> +       /*N0-N7*/       "","","","","","","","",
> +       /*O0-O7*/       "","","","","","","","",
> +       /*P0-P7*/       "","","","","","","","",
> +       /*Q0-Q7*/       "","","","","","","","",
> +       /*R0-R7*/       "","","","","","","","",
> +       /*S0-S7*/       "","","","","","","","",
> +       /*T0-T7*/       "","","","","","","","",
> +       /*U0-U7*/       "","","","","","","","",
> +       /*V0-V7*/       "","","","","","","","",
> +       /*W0-W7*/       "","","","","","","","",
> +       /*X0-X7*/       "","","","","","","","",
> +       /*Y0-Y7*/       "","","","","","","","",
> +       /*Z0-Z7*/       "","","","","","","","",
> +       /*AA0-AA7*/     "","","","","","","","",
> +       /*AB0-AB7*/     "FM_BMC_READ_SPD_TEMP","","","","","","","",
> +       /*AC0-AC7*/     "","","","","","","","";
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +};
> +
> +&i2c10 {
> +       status = "okay";
> +};
> +
> +&i2c11 {
> +       status = "okay";
> +};
> +
> +&i2c12 {
> +       status = "okay";
> +};
> +
> +&kcs3 {
> +       status = "okay";
> +       aspeed,lpc-io-reg = <0xca2>;
> +};
> +
> +&lpc_snoop {
> +       status = "okay";
> +       snoop-ports = <0x80>, <0x81>;
> +};
> +
> +&lpc_ctrl {
> +       status = "okay";
> +};
> +
> +&pwm_tacho {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm0_default
> +               &pinctrl_pwm1_default
> +               &pinctrl_pwm2_default
> +               &pinctrl_pwm3_default
> +               &pinctrl_pwm4_default
> +               &pinctrl_pwm5_default
> +               &pinctrl_pwm6_default
> +               &pinctrl_pwm7_default>;
> +
> +       fan@0 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +       };
> +
> +       fan@1 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> +       };
> +
> +       fan@2 {
> +               reg = <0x01>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x02>;
> +       };
> +
> +       fan@3 {
> +               reg = <0x01>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x03>;
> +       };
> +
> +       fan@4 {
> +               reg = <0x02>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x04>;
> +       };
> +
> +       fan@5 {
> +               reg = <0x02>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x05>;
> +       };
> +
> +       fan@6 {
> +               reg = <0x03>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x06>;
> +       };
> +
> +       fan@7 {
> +               reg = <0x03>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x07>;
> +       };
> +
> +       fan@8 {
> +               reg = <0x04>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x08>;
> +       };
> +
> +       fan@9 {
> +               reg = <0x04>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x09>;
> +       };
> +
> +       fan@10 {
> +               reg = <0x05>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0a>;
> +       };
> +
> +       fan@11 {
> +               reg = <0x05>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0b>;
> +       };
> +
> +       fan@12 {
> +               reg = <0x06>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0c>;
> +       };
> +
> +       fan@13 {
> +               reg = <0x06>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0d>;
> +       };
> +
> +       fan@14 {
> +               reg = <0x07>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0e>;
> +       };
> +
> +       fan@15 {
> +               reg = <0x07>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0f>;
> +       };
> +};
> +
> +&video {
> +       status = "okay";
> +       memory-region = <&video_engine_memory>;
> +};
> +
> +&vhub {
> +       status = "okay";
> +};
> --
> 2.25.1
>
