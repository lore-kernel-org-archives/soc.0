Return-Path: <SRS0=0G2W=RB=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6242C43219
	for <soc@archiver.kernel.org>; Thu, 16 Dec 2021 15:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 867DFC36AE5; Thu, 16 Dec 2021 15:58:09 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 814D7C36AE4;
	Thu, 16 Dec 2021 15:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 814D7C36AE4
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id q25so37173264oiw.0;
        Thu, 16 Dec 2021 07:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+fzbfD0CHCHcZI8DY35QBo25aGSKtXHSKqSLSMk0x8w=;
        b=SoXazNI2+DxvCzJxSiWdBBvJsojjz/RbM9D4XSb2DeyhCPhEhb2Hd+fF1TXLVXfmYE
         z7EkDgVGSPx3SNA3qxeO6G3nlmbnVUfy3wCbOFBodtdhojKEa6uHZN8GK5XCWmjfsy2D
         hZna6LrUsAIqlMKMWyMYJJeJ1cn7StBiE2bDEc4N4Mtp1b9nBxyUEggrZmyBuQxJOZnC
         nWJq7yGYztCgLXO8Cu02I3nV+qyGUkMselrtrBEwvcfe4LIXaf0eWjcX9k9O/EOdzIfw
         XxJU456Snju8A4Q/M/zo5nIfQYxql8ANRnJTE3vxJjpwCemy+k0IaZwAXq05jxFsix1E
         LexQ==
X-Gm-Message-State: AOAM532oHF9TP7LTE97RCIP2a3lInoLO0HmGqveqH9iYa8Vk7DrDJUhs
	3LJ/QslJMOJGzRklGBYsCA==
X-Google-Smtp-Source: ABdhPJwR/W9c0idlUUFwTUnVK1aHR+vR6mP87PEAo+XWvtX5jqFfuKZ69KQePrNkBHEO052l92GdjA==
X-Received: by 2002:a05:6808:15a:: with SMTP id h26mr4515968oie.123.1639670287583;
        Thu, 16 Dec 2021 07:58:07 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e14sm1027527oie.7.2021.12.16.07.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:58:06 -0800 (PST)
Received: (nullmailer pid 293314 invoked by uid 1000);
	Thu, 16 Dec 2021 15:58:05 -0000
Date: Thu, 16 Dec 2021 09:58:05 -0600
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org, giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 4/9] dt-bindings: clock: imx: Add documentation for
 i.MXRT1050 clock
Message-ID: <YbtiDa3CpVmiCkto@robh.at.kernel.org>
References: <20211215220538.4180616-1-Mr.Bossman075@gmail.com>
 <20211215220538.4180616-5-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215220538.4180616-5-Mr.Bossman075@gmail.com>

On Wed, Dec 15, 2021 at 05:05:33PM -0500, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add DT binding documentation for i.MXRT1050 clock driver.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Replace macros with values
> V2->V3:
> * Remove anatop
> * Use lpuart not gpt
> * include imxrt1050-clock.h
> * 2 space tabs to 4
> * Remove oneOf enum
> * Change maxItems to 2
> V3->V4:
> * Nothing done
> V4->V5:
> * Remove extra newline
> * Rename ccm to clock-controller
> * Change minItems to const
> * Change minItems to description
> * Rename file to add 1050
> * Change commit description to just 1050
> ---
>  .../bindings/clock/imxrt1050-clock.yaml       | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml b/Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml
> new file mode 100644
> index 000000000000..8caf0572733b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/imxrt1050-clock.yaml#
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
> +  ID in its "clocks" phandle cell. See include/dt-bindings/clock/imxrt*-clock.h
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
> +    description: 24m osc

maxItems: 1

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +  clock-names:
> +    const: osc
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
> +    clks: clock-controller@400fc000 {
> +        compatible = "fsl,imxrt1050-ccm";
> +        reg = <0x400fc000 0x4000>;
> +        interrupts = <95>, <96>;
> +        clocks = <&osc>;
> +        clock-names = "osc";
> +        #clock-cells = <1>;
> +    };
> +
> +    lpuart1: serial@40184000 {
> +        compatible = "fsl,imxrt1050-lpuart";
> +        reg = <0x40184000 0x4000>;
> +        interrupts = <20>;
> +        clocks = <&clks IMXRT1050_CLK_LPUART1>;
> +        clock-names = "ipg";
> +    };
> -- 
> 2.34.1
> 
> 
