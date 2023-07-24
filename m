Return-Path: <SRS0=wCLc=DK=robh_at_kernel.org=rob@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E11C0015E
	for <soc@archiver.kernel.org>; Mon, 24 Jul 2023 14:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D528C433CA; Mon, 24 Jul 2023 14:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D98C433C7;
	Mon, 24 Jul 2023 14:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690209713;
	bh=txBdFKbR3IV1PZ1tQF3/Ou9D7VYqMBmXYKsG1fJKTpw=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=VEFgBBTPg4kGQt8aXuskfaRNNAam4X2B7p1bFhi+mhQysF8fYyxxWHFeyDUclt+GV
	 kFBY0wS/XmwNoAnFQr8dJRriS5IeVHMQUE0bPLLF/fhcGf5kSLN0ep5Dmrzvygze+l
	 Px9aTAXfMxD96RwV3RWVzf+fYCCdL91hJiYWrVqNLUZl2eDRgcKyjq47umBu7+3C+3
	 eXbuOjaB60OQPKkk6oWD3vkx83P5pY3tUHXm7/uomNkPTdZMyusWxnT8CoRmHTzgP2
	 cUhjt7peSFOhJ4x9ezFxispJdvPZQlHLPlVvFSnaUa0v57U/VMh3veZzy/G/dBVmGV
	 w8JpUev8F0vVw==
Received: (nullmailer pid 3446916 invoked by uid 1000);
	Mon, 24 Jul 2023 14:41:50 -0000
Date: Mon, 24 Jul 2023 08:41:50 -0600
From: Rob Herring <robh@kernel.org>
To: Jacky Huang <ychuang570808@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@kernel.org, mjchen@nuvoton.com, schung@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Document nuvoton ma35d1 rtc driver
Message-ID: <20230724144150.GA3444052-robh@kernel.org>
References: <20230720012826.430026-1-ychuang570808@gmail.com>
 <20230720012826.430026-2-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720012826.430026-2-ychuang570808@gmail.com>

On Thu, Jul 20, 2023 at 01:28:24AM +0000, Jacky Huang wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> Add documentation to describe nuvoton ma35d1 rtc driver.

Bindings describe h/w, not drivers.

For the subject: dt-bindings: rtc: Add Nuvoton ma35d1 rtc

> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
>  .../bindings/rtc/nuvoton,ma35d1-rtc.yaml      | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml b/Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml
> new file mode 100644
> index 000000000000..08c30f3018fb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/nuvoton,ma35d1-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 Read Time Clock

s/Read/Real/

> +
> +maintainers:
> +  - Min-Jen Chen <mjchen@nuvoton.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,ma35d1-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +    rtc@40410000 {
> +        compatible = "nuvoton,ma35d1-rtc";
> +        reg = <0x40410000 0x200>;
> +        interrupts = <GIC_SPI 5 IRQ_TYPE_EDGE_RISING>;
> +        clocks = <&clk RTC_GATE>;
> +    };
> +
> +...
> -- 
> 2.34.1
> 
