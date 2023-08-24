Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DA5C3DA6F
	for <soc@archiver.kernel.org>; Thu, 24 Aug 2023 07:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1952CC433CA; Thu, 24 Aug 2023 07:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A81C433C8;
	Thu, 24 Aug 2023 07:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692862648;
	bh=uXfJs8fNdLRO8D3RiWH0qzEO3rhXZ1J5dH+3rBtPqkw=;
	h=Date:Subject:List-Id:To:References:From:In-Reply-To:From;
	b=MFcN0WjUw/HN+MZp5H7K1KZAf9481+16hUvl7S9+TNG0ny1TnJNQkAWbu7aMW1rvh
	 /bA74fd3eGTTneRmWd/iY6T0H0H/QCyeO4bRvJnyJaJKoYMDJYM9/eM0RbVVALWioF
	 Eh2Kx20N2906OgUOks6m05vw72ewsW1oAO+B8slEdV6UOhk0i9h/4kBgrykWlBDqZN
	 yyOo13JR7F0p2T43dSvQLA9I9161cein9VvMXfynvBRUdWYlaROdukxphPIwTxf4BK
	 26Kuw6yPEgSZ8UFhYy65SU4jvzSQFBLOE2uCS0o2JrI9rpAAPDPPg5mlZFjXLQXD0L
	 Mxp2gJa/fSbFQ==
Message-ID: <7213dd0d-5783-cda7-6d49-8bf442e81921@kernel.org>
Date: Thu, 24 Aug 2023 09:37:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/4] dt-bindings: arm: add cznic,turris-omnia-mcu binding
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20230823161012.6986-1-kabel@kernel.org>
 <20230823161012.6986-2-kabel@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230823161012.6986-2-kabel@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/08/2023 18:10, Marek Behún wrote:
> Add binding for cznic,turris-omnia-mcu, the device-tree node
> representing the system-controller features provided by the MCU on the
> Turris Omnia router.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

> ---
>  .../bindings/arm/cznic,turris-omnia-mcu.yaml  | 72 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml b/Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml
> new file mode 100644
> index 000000000000..055485847e71
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/cznic,turris-omnia-mcu.yaml

ARM directory is only for top-level bindings, so this should go to soc.

> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/cznic,turris-omnia-mcu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CZ.NIC's Turris Omnia MCU
> +
> +maintainers:
> +  - Marek Behún <kabel@kernel.org>
> +
> +description:
> +  The MCU on Turris Omnia acts as a system controller providing additional
> +  GPIOs, interrupts, watchdog, system power off and wakeup configuration.
> +
> +properties:
> +  compatible:
> +    const: cznic,turris-omnia-mcu
> +
> +  reg:
> +    description: MCU I2C slave address
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    ic: interrupt-controller {
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +    };

Drop this node, not relevant.

> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        system-controller@2a {
> +            compatible = "cznic,turris-omnia-mcu";
> +            reg = <0x2a>;
> +
> +            interrupt-parent = <&ic>;
> +            interrupts = <11 IRQ_TYPE_NONE>;

Are you sure interrupt is type none?

> +
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +        };


Best regards,
Krzysztof

