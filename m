Return-Path: <SRS0=8xwM=DG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EEBEB64DA
	for <soc@archiver.kernel.org>; Thu, 20 Jul 2023 06:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AB876C433C7; Thu, 20 Jul 2023 06:15:28 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A572C433C9
	for <soc@kernel.org>; Thu, 20 Jul 2023 06:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0A572C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4fdd14c1fbfso627371e87.1
        for <soc@kernel.org>; Wed, 19 Jul 2023 23:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689833725; x=1692425725;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9fxsL8k8YdgPOdv48SC9Nmsg2LypY+WGWHD2QI6dI4=;
        b=TjazXSZ/mUV4wGJU0KCYiC11Uw/a4eTT15H2sG8/TBGEoXDtPyYuQIBDnPPgq6DwXI
         pG08Ism0wSEIeLGzpw6NYA+h5DeX6dtiWzxYKq6NCzyrlUhK3yGgAgCUR1NDZd72a3KD
         1UEJh4zxLX6r6GjTCGaQpdJzeTQfBD3d4OcBawjWqzpL629NYzr7IEdR2ctPZm49rdCx
         07ZJ54G43LKPpyNYJDhOD04efYKq7KLNf+HDWUthoT8Zkwc785fFotPDfkI68eUj5WEN
         axYB77WBqSupOaAOcZLn+QMFl9l6niXIqyQbl1XX7xmH1E0CBVJecIhNene68UEaZDsB
         FuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689833725; x=1692425725;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9fxsL8k8YdgPOdv48SC9Nmsg2LypY+WGWHD2QI6dI4=;
        b=XLspBl2ZDmJm6GVPOa7l4BBFhIDKDAwE6IOglZ47I+CCIt/+uR7AmWPzDCfLhOwudE
         x7zZRox0DvUy463VmJPU7mZucln4nZ5EEo/1iFBiyQR1OH7217y2rZHuIinphV6gDYny
         2jk7nflXXDxAe5+5sOH/12LecPAyvhXrQ6o7LcR+uVthocpq7GkztoFPvmUcVO+ThInF
         wVbK32vy+IX8Od8FSuiHPi9ynOJVGYJMuYGyLs3X+n0HWdWfHBxBcgJB5aEjDI+TkXQ/
         bjrcElM8UuzE7gA/fg4znRj6WVpBDW7MdvH41G859lp1P0s7TYSWDyU+5TkcPVAk3th+
         QTlQ==
X-Gm-Message-State: ABy/qLZZjbyXWchzH0fmZNgM6X3IMmXD63TBzCstG42rwyfZpiU9K89L
	SFdSaB6Idxn2wxnIJ7jGXBvDAQ==
X-Google-Smtp-Source: APBJJlHszO1YbD5dV8Rn+jDt9WtRCRTXo3wgoJH/O5hHJHOegDkIT3+x0aDYMvZrOv2LNN8NtzpbAw==
X-Received: by 2002:a05:6512:3191:b0:4f8:6627:7983 with SMTP id i17-20020a056512319100b004f866277983mr1827667lfe.5.1689833724641;
        Wed, 19 Jul 2023 23:15:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id l14-20020a1c790e000000b003fbd04ecdc6sm3086939wme.5.2023.07.19.23.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 23:15:24 -0700 (PDT)
Message-ID: <0ad5a223-d70f-deaa-6261-a2bd2b2af40d@linaro.org>
Date: Thu, 20 Jul 2023 08:15:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] ARM: dts: imx6q: Add Variscite MX6 Custom board
 support
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, devicetree@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Marek Vasut <marex@denx.de>, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Stefan Wahren <stefan.wahren@chargebyte.com>,
 Andreas Kemnade <andreas@kemnade.info>, =?UTF-8?B?TWljaGFsIFZva8OhxI0=?=
 <michal.vokac@ysoft.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Jesse Taube <mr.bossman075@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230719224141.3716815-1-james.hilliard1@gmail.com>
 <20230719224141.3716815-2-james.hilliard1@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719224141.3716815-2-james.hilliard1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/07/2023 00:41, James Hilliard wrote:
> This patch adds support for the Variscite MX6 SoM Carrier Board.
> 
> This Carrier-Board has the following :
> - LVDS interface for the VLCD-CAP-GLD-LVDS 7" LCD 800 x 480 touch display
> - HDMI Connector
> - USB Host + USB OTG Connector
> - 10/100/1000 Mbps Ethernet
> - miniPCI-Express slot
> - SD Card connector
> - Audio Headphone/Line In jack connectors
> - S-ATA
> - On-board DMIC
> - RS485 Header
> - CAN bus header
> - SPI header
> - Camera Interfaces header
> - OnBoard RTC with Coin Backup battery socket
> - RS232 Debug Header (IDC10)
> - RS232 DTE
> 
> Product Page : https://www.variscite.com/product/single-board-computers/var-mx6customboard
> 
> The dts file based on the ones provided by Variscite on their own
> kernel, but adapted for mainline.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../devicetree/bindings/arm/fsl.yaml          |   1 +

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../arm/boot/dts/imx6q-var-mx6customboard.dts | 279 ++++++++++++++++++
>  3 files changed, 281 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6q-var-mx6customboard.dts
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 15d411084065..0f583852de8a 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -298,6 +298,7 @@ properties:
>                - udoo,imx6q-udoo           # Udoo i.MX6 Quad Board
>                - uniwest,imx6q-evi         # Uniwest Evi
>                - variscite,dt6customboard
> +              - variscite,mx6customboard
>                - wand,imx6q-wandboard      # Wandboard i.MX6 Quad Board
>                - ysoft,imx6q-yapp4-crux    # i.MX6 Quad Y Soft IOTA Crux board
>                - ysoft,imx6q-yapp4-pegasus # i.MX6 Quad Y Soft IOTA Pegasus board
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 59829fc90315..9cfc3d3e91ea 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -665,6 +665,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
>  	imx6q-udoo.dtb \
>  	imx6q-utilite-pro.dtb \
>  	imx6q-var-dt6customboard.dtb \
> +	imx6q-var-mx6customboard.dtb \
>  	imx6q-vicut1.dtb \
>  	imx6q-wandboard.dtb \
>  	imx6q-wandboard-revb1.dtb \
> diff --git a/arch/arm/boot/dts/imx6q-var-mx6customboard.dts b/arch/arm/boot/dts/imx6q-var-mx6customboard.dts
> new file mode 100644
> index 000000000000..66047dff11ec
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6q-var-mx6customboard.dts
> @@ -0,0 +1,279 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Support for Variscite MX6 Carrier-board
> + *
> + * Copyright 2016 Variscite, Ltd. All Rights Reserved
> + * Copyright 2022 Bootlin
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6qdl-var-som.dtsi"
> +#include <dt-bindings/pwm/pwm.h>
> +
> +/ {
> +	model = "Variscite i.MX6 QUAD/DUAL VAR-SOM-MX6 Custom Board";
> +	compatible = "variscite,mx6customboard", "fsl,imx6q";

Where is the SoM compatible?

Best regards,
Krzysztof

