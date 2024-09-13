Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB70FC6172
	for <soc@archiver.kernel.org>; Fri, 13 Sep 2024 22:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6F812C4CED1; Fri, 13 Sep 2024 22:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14778C4CEC0;
	Fri, 13 Sep 2024 22:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726265103;
	bh=uoYklACQWaRme2AnW5TDFXJiDAs01jBwIKeDSddSLj4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=arvHRFmCRLGyj1dGWTUCFM9uS3AnwIr80VML4QpDGtqBBHNS/ZAkCyzeItBt5aAEE
	 WFOiv+zGPfaOHC7/S7rTNy3kRytJwwgnXGw+Yy4PTfjyOka6//Z9ILZuUNsGFEsaxP
	 0+n4nEBTbpP+1ZoZBDjGESYHc5h8bMpsCjfDM23RffnrYvoG7vWx3JFFVbl5GAhr5K
	 lUkWUJdFzB0/2vR7oVGmrsn/P3QhVOntiPEtObEXZ7D8qNu2lflEMg8e5M7WsMa6dW
	 t9+X2GfFe8L6sJ4hoCZRov+9UN/I6/fPMu5IJwYZU5VaulQCu2g7xGzsx78vW48vu9
	 EMdif27JPZtDA==
Date: Fri, 13 Sep 2024 17:05:02 -0500
From: Rob Herring <robh@kernel.org>
To: Arturs Artamonovs <arturs.artamonovs@analog.com>
List-Id: <soc.lore.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Malysa <greg.malysa@timesys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Utsav Agarwal <Utsav.Agarwal@analog.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org, adsp-linux@analog.com,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Subject: Re: [PATCH 03/21] dt-bindigs: arm64: adi,sc598 bindings
Message-ID: <20240913220502.GA878799-robh@kernel.org>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-3-458fa57c8ccf@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912-test-v1-3-458fa57c8ccf@analog.com>

On Thu, Sep 12, 2024 at 07:24:48PM +0100, Arturs Artamonovs wrote:
> Bindigs for ADI ADSP-SC5xx reset controller

Typo. Here and the subject. Please write complete sentences.

> 
> Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
> Co-developed-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
> Signed-off-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
> Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
> Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
> ---
>  .../bindings/soc/adi/adi,reset-controller.yaml     | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/adi/adi,reset-controller.yaml b/Documentation/devicetree/bindings/soc/adi/adi,reset-controller.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..7a6df1cfb709d818d5e3dbcd202938d6aaaaaa9b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/adi/adi,reset-controller.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/adi/adi,reset-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices Reset Controller for SC5XX processor family
> +
> +maintainers:
> +  - Arturs Artamonovs <arturs.artamonovs@analog.com>
> +  - Utsav Agarwal <Utsav.Agarwal@analog.com>
> +
> +description: |

Don't need '|'

> +  SHARC and ARM core reset control unit for starting/stopping/resetting
> +  processors

Complete sentences for top-level description.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,reset-controller

Too generic.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    rcu: rcu@3108c000 {
> +      compatible = "adi,reset-controller";
> +      reg = <0x3108c000 0x1000>;
> +      status = "okay";

Don't need status in examples.

Shouldn't a reset controller use the reset binding (i.e. #reset-cells)?

All you patches seem to have similar issues, so I'm not going to comment 
on all of them. Please read the documentation in 
Documentation/devicetree/bindings/. It doesn't seem like you have.

Rob
