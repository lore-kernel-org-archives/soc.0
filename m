Return-Path: <SRS0=TwPN=IX=gmail.com=bruno.thomsen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AC3C4706C
	for <soc@archiver.kernel.org>; Sat, 13 Jan 2024 17:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93C35C433F1; Sat, 13 Jan 2024 17:39:32 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56CA6C433C7;
	Sat, 13 Jan 2024 17:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 56CA6C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5f00bef973aso78963517b3.0;
        Sat, 13 Jan 2024 09:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705167569; x=1705772369; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqQ/ardrSPtiAEurpJ6hvz43acFrRMYxJ6zuOLP6ov8=;
        b=ZFRWI8HAWS1yD5RBz0hwJBSwitcpQBVuWLGHULZarm+GETPJWe7LL115RCIkr4NaXt
         PkkK/ZgdB2JKKLHpQsndCfv886XCysp9GN0RuP7YUOdyB9fsIvoEshTRLRf6pz14TbsH
         35s3CaIN86nBmOrzdP04ISggQHoP0Rd+6Bo5nJblxaBONdOSP8cqCOr8oXH8jRKdMAQe
         R52k9htcH01unb7Pj5qnpqWnNU8XJaX12rKDXmiFD9yehlCimSFObN0buEQZaQtgyIdJ
         WZVbCoGTzuqjqIpqoVs9NmorFK/FlOr/d7Ix+9FFa34jQI70QeuziskKuQRjRu/h9hLN
         KVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705167569; x=1705772369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqQ/ardrSPtiAEurpJ6hvz43acFrRMYxJ6zuOLP6ov8=;
        b=CBernLcW4mhcd2JLpKM00DyouiPw0DwGb6x5XVzUYKJlAsvmARNr+Gd33KkrgXAUkp
         0tByHB9fgeBBDvlgihTknWb17J1Ih7/afj8MfghkQm+ubi85Q94jTBogv6wl69kGR1BS
         R9zIEaq4uIjwZh5COuMmwz3gdVHHOVZt9ddtFwUwymeXqQuisZw5ybVGnlO3UiNySdGD
         95YFAEDi0mUF8vsNDgLso8wfX9Bfl6EL/m0rXZUOhJef9lVIOQC31JApXUEHafj1m07x
         NnyCa0lrt1PVIdXEbNLNNvXAtqbAtpOSCubT92jQAtNsbqs3ya9yl0rQyoCYXa1DAcHB
         kMqg==
X-Gm-Message-State: AOJu0YxjWU5Addto01BBmPj70OD8EgK9P8vJrktRyIBiGFLWyO8LFebb
	5MFdbbUQGK8u4gaz/fnQKmFiW21396P9gpiETbc=
X-Google-Smtp-Source: AGHT+IG5R2SfW/IkTX2fJdaSYfCdOD7fKDYk+CKs1tj5ZGjxR3tbdh3Im04blDvG5D/Cryo9bsEfl4NQ+S0kVLJEXDo=
X-Received: by 2002:a0d:ea05:0:b0:5d7:1940:b398 with SMTP id
 t5-20020a0dea05000000b005d71940b398mr2956495ywe.100.1705167569648; Sat, 13
 Jan 2024 09:39:29 -0800 (PST)
MIME-Version: 1.0
References: <8b49a64d5946792f01e75fab74076557ef4f7d60.1705135956.git.lukas@wunner.de>
In-Reply-To: <8b49a64d5946792f01e75fab74076557ef4f7d60.1705135956.git.lukas@wunner.de>
From: Bruno Thomsen <bruno.thomsen@gmail.com>
Date: Sat, 13 Jan 2024 18:39:13 +0100
Message-ID: <CAH+2xPCfJPdmttuLckRRZr20c9CpVHJmkpOymHvLOQyBMH86yQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: Fix TPM schema violations
To: Lukas Wunner <lukas@wunner.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-integrity@vger.kernel.org, 
	Patrick Williams <patrick@stwcx.xyz>, Tao Ren <rentao.bupt@gmail.com>, 
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, 
	Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com, Wes Huang <wes.huang@moxa.com>, 
	Fero JD Zhou <FeroJD.Zhou@moxa.com>, SZ Lin <sz.lin@moxa.com>, 
	Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Yannic Moog <Y.Moog@phytec.de>, 
	Alexander Bauer <a.bauer@phytec.de>, upstream@lists.phytec.de, 
	Teresa Remmet <T.Remmet@phytec.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den l=C3=B8r. 13. jan. 2024 kl. 10.03 skrev Lukas Wunner <lukas@wunner.de>:
>
> Since commit 26c9d152ebf3 ("dt-bindings: tpm: Consolidate TCG TIS
> bindings"), several issues are reported by "make dtbs_check" for ARM
> devicetrees:
>
> The nodename needs to be "tpm@0" rather than "tpmdev@0" and the
> compatible property needs to contain the chip's name in addition to the
> generic "tcg,tpm_tis-spi" or "tcg,tpm-tis-i2c":
>
>   tpmdev@0: $nodename:0: 'tpmdev@0' does not match '^tpm(@[0-9a-f]+)?$'
>         from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm_tis-sp=
i.yaml#
>
>   tpm@2e: compatible: 'oneOf' conditional failed, one must be fixed:
>         ['tcg,tpm-tis-i2c'] is too short
>         from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm-tis-i2=
c.yaml#
>
> Fix these schema violations.
>
> Aspeed Facebook BMCs use an Infineon SLB9670:
> https://lore.kernel.org/all/ZZSmMJ%2F%2Fl972Qbxu@fedora/
> https://lore.kernel.org/all/ZZT4%2Fw2eVzMhtsPx@fedora/
> https://lore.kernel.org/all/ZZTS0p1hdAchIbKp@heinlein.vulture-banana.ts.n=
et/
>
> Aspeed Tacoma uses a Nuvoton NPCT75X per commit 39d8a73c53a2 ("ARM: dts:
> aspeed: tacoma: Add TPM").
>
> phyGATE-Tauri uses an Infineon SLB9670:
> https://lore.kernel.org/all/ab45c82485fa272f74adf560cbb58ee60cc42689.came=
l@phytec.de/
>
> A single schema violation remains in am335x-moxa-uc-2100-common.dtsi
> because it is unknown which chip is used on the board.  The devicetree's
> author has been asked for clarification but has not responded so far:
> https://lore.kernel.org/all/20231220090910.GA32182@wunner.de/
>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Reviewed-by: Patrick Williams <patrick@stwcx.xyz>
> Reviewed-by: Tao Ren <rentao.bupt@gmail.com>

Change in imx7d-flex-concentrator.dts looks good to me.

Reviewed-by: Bruno Thomsen <bruno.thomsen@gmail.com>

> ---
> The commit mentioned above, 26c9d152ebf3 ("dt-bindings: tpm: Consolidate
> TCG TIS bindings") landed in Linus' tree 8 hours ago.
>
> Because this consists only of fixes, I think it could be picked up and
> forwarded to Linus at any time, even outside the merge window.
>
> The Reviewed-by tags from Patrick and Tao were offered here:
> https://lore.kernel.org/all/ZZWB4wRiAyDtlLJM@heinlein.vulture-banana.ts.n=
et/
> https://lore.kernel.org/all/ZZWkhaiDFOGvcPQy@fedora/
>
>  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts   | 4 ++--
>  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts    | 4 ++--
>  arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts           | 2 +-
>  arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi | 4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi          | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx7d-flex-concentrator.dts        | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2100-common.dtsi    | 2 +-
>  7 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> index e899de6..5be0e8f 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> @@ -45,8 +45,8 @@
>                 num-chipselects =3D <1>;
>                 cs-gpios =3D <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
>
> -               tpmdev@0 {
> -                       compatible =3D "tcg,tpm_tis-spi";
> +               tpm@0 {
> +                       compatible =3D "infineon,slb9670", "tcg,tpm_tis-s=
pi";
>                         spi-max-frequency =3D <33000000>;
>                         reg =3D <0>;
>                 };
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts b/=
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
> index a677c82..5a8169b 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
> @@ -80,8 +80,8 @@
>                 gpio-miso =3D <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_HIGH>;
>                 num-chipselects =3D <1>;
>
> -               tpmdev@0 {
> -                       compatible =3D "tcg,tpm_tis-spi";
> +               tpm@0 {
> +                       compatible =3D "infineon,slb9670", "tcg,tpm_tis-s=
pi";
>                         spi-max-frequency =3D <33000000>;
>                         reg =3D <0>;
>                 };
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts b/arch/ar=
m/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts
> index 3f6010e..213023b 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts
> @@ -456,7 +456,7 @@
>         status =3D "okay";
>
>         tpm: tpm@2e {
> -               compatible =3D "tcg,tpm-tis-i2c";
> +               compatible =3D "nuvoton,npct75x", "tcg,tpm-tis-i2c";
>                 reg =3D <0x2e>;
>         };
>  };
> diff --git a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi=
 b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
> index 31590d3..00e5887 100644
> --- a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
> +++ b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
> @@ -35,8 +35,8 @@
>                 gpio-mosi =3D <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>=
;
>                 gpio-miso =3D <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>=
;
>
> -               tpmdev@0 {
> -                       compatible =3D "tcg,tpm_tis-spi";
> +               tpm@0 {
> +                       compatible =3D "infineon,slb9670", "tcg,tpm_tis-s=
pi";
>                         spi-max-frequency =3D <33000000>;
>                         reg =3D <0>;
>                 };
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi b/arch/a=
rm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi
> index 44cc4ff..d12fb44 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi
> @@ -116,7 +116,7 @@
>         tpm_tis: tpm@1 {
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&pinctrl_tpm>;
> -               compatible =3D "tcg,tpm_tis-spi";
> +               compatible =3D "infineon,slb9670", "tcg,tpm_tis-spi";
>                 reg =3D <1>;
>                 spi-max-frequency =3D <20000000>;
>                 interrupt-parent =3D <&gpio5>;
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-flex-concentrator.dts b/arch=
/arm/boot/dts/nxp/imx/imx7d-flex-concentrator.dts
> index 3a72384..9984b34 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7d-flex-concentrator.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-flex-concentrator.dts
> @@ -130,7 +130,7 @@
>          * TCG specification - Section 6.4.1 Clocking:
>          * TPM shall support a SPI clock frequency range of 10-24 MHz.
>          */
> -       st33htph: tpm-tis@0 {
> +       st33htph: tpm@0 {
>                 compatible =3D "st,st33htpm-spi", "tcg,tpm_tis-spi";
>                 reg =3D <0>;
>                 spi-max-frequency =3D <24000000>;
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2100-common.dtsi b/=
arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2100-common.dtsi
> index b8730aa..a59331a 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2100-common.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2100-common.dtsi
> @@ -217,7 +217,7 @@
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&spi1_pins>;
>
> -       tpm_spi_tis@0 {
> +       tpm@0 {
>                 compatible =3D "tcg,tpm_tis-spi";
>                 reg =3D <0>;
>                 spi-max-frequency =3D <500000>;
> --
> 2.40.1
>
