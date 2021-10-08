Return-Path: <SRS0=PTeu=O4=chromium.org=amstan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B25C433EF
	for <soc@archiver.kernel.org>; Fri,  8 Oct 2021 18:59:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2B31360F38; Fri,  8 Oct 2021 18:59:17 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F026860F93
	for <soc@kernel.org>; Fri,  8 Oct 2021 18:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F026860F93
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f170.google.com with SMTP id c20so10498486qtb.2
        for <soc@kernel.org>; Fri, 08 Oct 2021 11:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+PFG95vsWGuyHt4PcF9O/qQQtXb2/roNae5ZiPerc+I=;
        b=Vg84jUhZ066KbwPCq09KSWKk5BMC/nESlSL+LvmOsd9WOTqV4fVqB6I1sVrBLn+BEY
         Lr4BmXiMbxhqGcrcd6KQBJY9t78dmrCJ4nL4AtiEg6etmi8+yWMScE37Qar+/wVHsDAP
         yB04phzc7eYq7KCmvPVMKkcgnl9G99lu63U74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+PFG95vsWGuyHt4PcF9O/qQQtXb2/roNae5ZiPerc+I=;
        b=3jWLpv9nHSnI2hTh5sfGHg9zPa7iZjxZSVFwv/FD+7WYtnvL80u26OXhsOfwEjrl2t
         V7oDYPjHp0+BqyfELpXPsky7xfwfeA+0FrTpP8J95DBMvyrYwWFUnqbRhhCF9WBIPfA4
         vGBhghITrOSLHJ92ZrOdZIku6mTKOM/9/ztNHwKSbGyvE/TcgoYZoesagsu7H3v1Pr4r
         9GM+w8eLZKQ2ouxNyUYe8ZUU473wnaI73e66n4ii1zYat1v+Zrec8T00thO1I4E2L2Ad
         TteaW5eEgTKEHIEuOhpXQTAG1woEkDY2qcsiODwoLcQLqIcZiZSOjNxoL9UEL43wFBaH
         jnlA==
X-Gm-Message-State: AOAM531epPrO7+IGcFouGXUVAq8S9U0722yysAB7MxwvXeXQsoaN8ZJz
	Lg5/WfBECV7IgwUVinWe0r9TeNfEOkaQfQ==
X-Google-Smtp-Source: ABdhPJwSd8YKFg7a3j7mGPcHR+NR/5djKKJEYn2Zu+mk8sm2M6hBMJ34c2rMWJI2a911K4t7pa3kFw==
X-Received: by 2002:ac8:1006:: with SMTP id z6mr75032qti.36.1633719555300;
        Fri, 08 Oct 2021 11:59:15 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id a22sm129241qtx.7.2021.10.08.11.59.13
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 11:59:14 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id i84so23113925ybc.12
        for <soc@kernel.org>; Fri, 08 Oct 2021 11:59:13 -0700 (PDT)
X-Received: by 2002:a25:db91:: with SMTP id g139mr5128084ybf.391.1633719553275;
 Fri, 08 Oct 2021 11:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211008140735.3290892-1-pan@semihalf.com> <20211008140735.3290892-2-pan@semihalf.com>
In-Reply-To: <20211008140735.3290892-2-pan@semihalf.com>
From: Alexandru M Stan <amstan@chromium.org>
Date: Fri, 8 Oct 2021 11:58:37 -0700
X-Gmail-Original-Message-ID: <CAHNYxRxuj_p-+zHCO9iEK3H7QrBAPy1Cx0tCh3ufRqYnK124qQ@mail.gmail.com>
Message-ID: <CAHNYxRxuj_p-+zHCO9iEK3H7QrBAPy1Cx0tCh3ufRqYnK124qQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] dts: socfpga: Add Mercury+ AA1 devicetree
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: arnd@arndb.de, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, dinguyen@kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel <linux-kernel@vger.kernel.org>, upstream@semihalf.com, 
	Marcin Wojtas <mw@semihalf.com>, Konrad Adamczyk <ka@semihalf.com>, Tomasz Nowicki <tn@semihalf.com>, 
	Jacek Majkowski <jam@semihalf.com>, Joanna Brozek <jbrozek@antmicro.com>, 
	Mariusz Glebocki <mglebocki@antmicro.com>, Tomasz Gorochowik <tgorochowik@antmicro.com>, 
	Maciej Mikunda <mmikunda@antmicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 8, 2021 at 7:08 AM Pawe=C5=82 Anikiel <pan@semihalf.com> wrote:
>
> Add support for the Mercury+ AA1 module for Arria 10 SoC FPGA.
>
> Signed-off-by: Pawe=C5=82 Anikiel <pan@semihalf.com>
> Signed-off-by: Joanna Brozek <jbrozek@antmicro.com>
> Signed-off-by: Mariusz Glebocki <mglebocki@antmicro.com>
> Signed-off-by: Tomasz Gorochowik <tgorochowik@antmicro.com>
> Signed-off-by: Maciej Mikunda <mmikunda@antmicro.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/socfpga_arria10_mercury_aa1.dts  | 112 ++++++++++++++++++
>  2 files changed, 113 insertions(+)
>  create mode 100644 arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7e0934180724..0a7809eb3795 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1078,6 +1078,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) +=3D \
>         socfpga_arria10_socdk_nand.dtb \
>         socfpga_arria10_socdk_qspi.dtb \
>         socfpga_arria10_socdk_sdmmc.dtb \
> +       socfpga_arria10_mercury_aa1.dtb \
>         socfpga_cyclone5_chameleon96.dtb \
>         socfpga_cyclone5_mcvevk.dtb \
>         socfpga_cyclone5_socdk.dtb \
> diff --git a/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts b/arch/arm=
/boot/dts/socfpga_arria10_mercury_aa1.dts
> new file mode 100644
> index 000000000000..2a3364b26361
> --- /dev/null
> +++ b/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "socfpga_arria10.dtsi"
> +
> +/ {
> +
> +       model =3D "Enclustra Mercury AA1";
> +       compatible =3D "altr,socfpga-arria10", "altr,socfpga";
> +
> +       aliases {
> +               ethernet0 =3D &gmac0;
> +               serial1 =3D &uart1;
> +               i2c0 =3D &i2c0;
> +               i2c1 =3D &i2c1;

Yeah, this is fine now. I still would have added this in
"socfpga_arria10.dtsi" instead. I don't think there's ever a case
where these aliases wouldn't be wanted for any user of this chip.

> +       };
> +
> +       memory@0 {
> +               name =3D "memory";
> +               device_type =3D "memory";
> +               reg =3D <0x0 0x80000000>; /* 2GB */
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial1:115200n8";
> +       };
> +};
> +
> +&eccmgr {
> +       sdmmca-ecc@ff8c2c00 {
> +               compatible =3D "altr,socfpga-sdmmc-ecc";
> +               reg =3D <0xff8c2c00 0x400>;
> +               altr,ecc-parent =3D <&mmc>;
> +               interrupts =3D <15 IRQ_TYPE_LEVEL_HIGH>,
> +                            <47 IRQ_TYPE_LEVEL_HIGH>,
> +                            <16 IRQ_TYPE_LEVEL_HIGH>,
> +                            <48 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +};
> +
> +&gmac0 {
> +       phy-mode =3D "rgmii";
> +       phy-addr =3D <0xffffffff>; /* probe for phy addr */
> +
> +       max-frame-size =3D <3800>;
> +       status =3D "okay";
> +
> +       phy-handle =3D <&phy3>;
> +
> +       mdio {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               compatible =3D "snps,dwmac-mdio";
> +               phy3: ethernet-phy@3 {
> +                       txd0-skew-ps =3D <0>; /* -420ps */
> +                       txd1-skew-ps =3D <0>; /* -420ps */
> +                       txd2-skew-ps =3D <0>; /* -420ps */
> +                       txd3-skew-ps =3D <0>; /* -420ps */
> +                       rxd0-skew-ps =3D <420>; /* 0ps */
> +                       rxd1-skew-ps =3D <420>; /* 0ps */
> +                       rxd2-skew-ps =3D <420>; /* 0ps */
> +                       rxd3-skew-ps =3D <420>; /* 0ps */
> +                       txen-skew-ps =3D <0>; /* -420ps */
> +                       txc-skew-ps =3D <1860>; /* 960ps */
> +                       rxdv-skew-ps =3D <420>; /* 0ps */
> +                       rxc-skew-ps =3D <1680>; /* 780ps */
> +                       reg =3D <3>;
> +               };
> +       };
> +};
> +
> +&gpio0 {
> +       status =3D "okay";
> +};
> +
> +&gpio1 {
> +       status =3D "okay";
> +};
> +
> +&gpio2 {
> +       status =3D "okay";
> +};
> +
> +&i2c1 {
> +       status =3D "okay";
> +       isl12022: isl12022@6f {
> +               status =3D "okay";
> +               compatible =3D "isil,isl12022";
> +               reg =3D <0x6f>;
> +       };
> +};
> +
> +/* Following mappings are taken from arria10 socdk dts */
> +&mmc {
> +       status =3D "okay";
> +       cap-sd-highspeed;
> +       broken-cd;
> +       bus-width =3D <4>;
> +};
> +
> +&osc1 {
> +       clock-frequency =3D <33330000>;
> +};
> +
> +&uart1 {
> +       status =3D "okay";
> +};
> +
> +&usb0 {
> +       status =3D "okay";
> +       dr_mode =3D "host";
> +};
> --
> 2.25.1
>

Hello Pawe=C5=82,
Thank you for respinning.

This looks good as a base to make the boards be able to boot. I'd be
happy if it lands (even the v3 patch).
Just a small nit about the location of the aliases.

Reviewed-by: Alexandru M Stan <amstan@chromium.org>

Thanks,
Alexandru Stan
