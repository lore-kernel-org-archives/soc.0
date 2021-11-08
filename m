Return-Path: <SRS0=ZxEA=P3=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEC1C4332F
	for <soc@archiver.kernel.org>; Mon,  8 Nov 2021 17:06:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 27BF26120A; Mon,  8 Nov 2021 17:06:05 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDCBF61406;
	Mon,  8 Nov 2021 17:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDCBF61406
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f54.google.com with SMTP id g25-20020a9d5f99000000b0055af3d227e8so22157060oti.11;
        Mon, 08 Nov 2021 09:06:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+wQZvNgyyjn3+v8l34ysdaksISh5LnqUaxH3QVKQ1xw=;
        b=pkgAM+rvk6UpYbKGICeYXvp6EXRiICxElSU5DlI7B81Rh+8UpVQiVpsimNvv62dXFV
         zxrjr6+UaaCqScKYm1GLb6KuK46Ff2Zi6Yhqp+0L01qoKTjPFS3mZyegUOtvDaiet3ly
         f6EIjnTzu43iqXBYAy3rd90CU3U4FxH1z+VSlBnFcrOQSfku/S9vVJ2NRkTuiKaN6fQX
         C2QswJrLJE5skw9D9wEioIu/kBto8ViPfDNTq6BQ20F5JFk4ENeF3GsIHoxzZ8BBUZqH
         RbOFL0zKIkfS1QpCn2GG5GYxM1bb8QW3CZbiSQ7uxxEgwinv8b0AqEFglPWVr/2DACQ9
         QNhw==
X-Gm-Message-State: AOAM533zRQsUNpz4cESD62JNjqeW7CG3mYwrB6gTqHggq3GLBexfQhPp
	ajow2vbNStxYReVHXBVo2A==
X-Google-Smtp-Source: ABdhPJyE2m9Bd0mTaoOq+L1k+wveMzvoclq85f8PRR1u9eZbzhJbadk37zweFJPvLaJOuibGv4aDZw==
X-Received: by 2002:a9d:5c2:: with SMTP id 60mr457729otd.104.1636391164189;
        Mon, 08 Nov 2021 09:06:04 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q29sm5703534oof.38.2021.11.08.09.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 09:06:03 -0800 (PST)
Received: (nullmailer pid 3517392 invoked by uid 1000);
	Mon, 08 Nov 2021 17:06:01 -0000
Date: Mon, 8 Nov 2021 11:06:01 -0600
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org, giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 05/13] dt-bindings: clock: imx: Add documentation for
 i.MXRT clock
Message-ID: <YYlY+S9iuTjRNFW+@robh.at.kernel.org>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225653.W9X4uTuBfjTBCe44PlQdYj5pRnczkEUmvmbnCVeKkeM@z>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102225653.W9X4uTuBfjTBCe44PlQdYj5pRnczkEUmvmbnCVeKkeM@z>

On Tue, Nov 02, 2021 at 06:56:53PM -0400, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add DT binding documentation for i.MXRT clock driver.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Replace macros with values
> ---
>  .../bindings/clock/imxrt-clock.yaml           | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/imxrt-clock.yaml b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
> new file mode 100644
> index 000000000000..4e92f79cf707
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
> @@ -0,0 +1,70 @@
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
> +  ID in its "clocks" phandle cell. See include/dt-bindings/clock/imxrt*-clock.h
> +  for the full list of i.MXRT clock IDs.

blank line

> +properties:
> +  compatible:
> +    oneOf:

Don't need oneOf for a single entry.

> +      - enum:
> +          - fsl,imxrt1050-ccm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +
> +  clock-names:
> +    minItems: 1

You have to define the name.

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
> +    anatop: anatop@400d8000 {
> +      compatible = "fsl,imxrt-anatop";
> +      reg = <0x400d8000 0x4000>;
> +    };

Not relevant to the example.

> +
> +    ccm@400fc000 {
> +      compatible = "fsl,imxrt1050-ccm";
> +      reg = <0x400fc000 0x4000>;
> +      interrupts = <95>,<96>;
> +      clocks = <&osc>;
> +      clock-names = "osc";
> +      #clock-cells = <1>;
> +    };
> +
> +    gpt: timer@401ec000 {

Drop unused labels.

> +      compatible = "fsl,imx53-gpt", "fsl,imx31-gpt";

Probably should be: "fsl,imxrt1050-gpt", "fsl,imx31-gpt"

Unless there's same features/quirks as the MX53 version?

> +      reg = <0x401ec000 0x4000>;
> +      interrupts = <100>;
> +      clocks = <&clks 3>;
> +      clock-names = "per";
> +    };
> -- 
> 2.33.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
