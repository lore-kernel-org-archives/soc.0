Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCBFC433F5
	for <soc@archiver.kernel.org>; Mon,  6 Dec 2021 22:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7CB1DC341C1; Mon,  6 Dec 2021 22:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554F6C341C6;
	Mon,  6 Dec 2021 22:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638830329;
	bh=7SMczd1Ms9KPq4pJzopcSwHuEKGdzVZQ+Na/nRyxS7Y=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=b8berxhO3KkZKnh5IexHD2okQoHhzwaKr9iMhSGZDwmgJmfZiJDjCW90RWZoy9hL1
	 nC7mLgwgbxuGXFhXUajKr0vbQJ0WkdRdMy7G3z5sjJqiRyBQ1vy80v0UXJ56AtiVLU
	 UQU3CN66VgPuDkiRbsYStFbKpLi7LYbUeyyTg/Dac3ai72wIf7Rh/qvifl+QuPebE5
	 yeiDn0A1kRaqdSmzCL1npP8kYQjrgL+7UgAIb6L1P6gLdes7ywWoaOv5JaRO1h3VXc
	 J6JINQHlMbqFQ/+G5ojCywdKCROpyAKr6FmPmnFl3PSHL8BlEyY2APuPSP8Cl0tWuD
	 FFvqLi7PvcX4Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211204061042.1248028-7-Mr.Bossman075@gmail.com>
References: <20211204061042.1248028-1-Mr.Bossman075@gmail.com> <20211204061042.1248028-7-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH v4 06/13] dt-bindings: clock: imx: Add documentation for i.MXRT clock
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org, giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp, Mr.Bossman075@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com
Date: Mon, 06 Dec 2021 14:38:48 -0800
User-Agent: alot/0.9.1
Message-Id: <20211206223849.554F6C341C6@smtp.kernel.org>

Quoting Jesse Taube (2021-12-03 22:10:35)
> diff --git a/Documentation/devicetree/bindings/clock/imxrt-clock.yaml b/D=
ocumentation/devicetree/bindings/clock/imxrt-clock.yaml
> new file mode 100644
> index 000000000000..8af48c59ff99
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/imxrt-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Clock bindings for Freescale i.MXRT
> +
> +maintainers:
> +  - Giulio Benetti <giulio.benetti@benettiengineering.com>
> +  - Jesse Taube <Mr.Bossman075@gmail.com>
> +
> +description: |
> +  The clock consumer should specify the desired clock by having the clock
> +  ID in its "clocks" phandle cell. See include/dt-bindings/clock/imxrt*-=
clock.h
> +  for the full list of i.MXRT clock IDs.
> +
> +properties:
> +  compatible:
> +    const: fsl,imxrt1050-ccm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 2
> +
> +  clocks:
> +    minItems: 1
> +
> +  clock-names:
> +    minItems: 1

Why minitems vs. exactly 1 for osc?

> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imxrt1050-clock.h>
> +
> +    ccm@400fc000 {

s/ccm/clock-controller/

> +        compatible =3D "fsl,imxrt1050-ccm";
> +        reg =3D <0x400fc000 0x4000>;
> +        interrupts =3D <95>, <96>;
> +        clocks =3D <&osc>;
> +        clock-names =3D "osc";
> +        #clock-cells =3D <1>;
> +    };
> +
> +

Nitpick: Drop extra newline

> +    lpuart1: serial@40184000 {
> +        compatible =3D "fsl,imxrt1050-lpuart";
> +        reg =3D <0x40184000 0x4000>;
> +        interrupts =3D <20>;
> +        clocks =3D <&clks IMXRT1050_CLK_LPUART1>;
> +        clock-names =3D "ipg";
> +    };
> --=20
> 2.34.0
>
