Return-Path: <lee@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16871C54EAA
	for <soc@archiver.kernel.org>; Fri, 27 Jan 2023 11:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C367FC433EF; Fri, 27 Jan 2023 11:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FC5C433D2;
	Fri, 27 Jan 2023 11:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674818217;
	bh=UlB5pV3uru4032GM2JmN3OU981KxlDrhiWJwiJNni00=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=TAOrKaJy6KUwB+d2sSef8lrNcgmrke0nUloBTSzoEx9JbXMSI+H/LLt4dW2NHLt/I
	 F8v1QJ2QfgoXh96/D9ma062QjCiriHE67bPPT02dnFehFAn3HDi4p4F5QSt/rd1o2c
	 BW+wCnVuJIsc+sDZXMgdurhT+Zbv3CBO1sPfMdRZidb0VsCSA/pEtA3WyX5kUWJXGj
	 1iKdQwi4fIbiCJtnuzJZN9v6KK5DhEz3Yl5JuYfj2HfJ7ZwrAGutZ66SE7+5A3jJYI
	 nvlzLXavAB7vlUnikC0JDLWR3k+GdPd8riLMk2Y+wGlJRSeOjeDVCCSa8jtvYmL7x1
	 Z+KUOg5RW6kww==
Date: Fri, 27 Jan 2023 11:16:52 +0000
From: Lee Jones <lee@kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND 4/8] dt-bindings: leds: Add
 cznic,turris1x-leds.yaml binding
Message-ID: <Y9OypLjJb+O3yvhw@google.com>
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-5-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221226123630.6515-5-pali@kernel.org>

On Mon, 26 Dec 2022, Pali Rohár wrote:

> Add device-tree bindings documentation for Turris 1.x RGB LEDs.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> ---
>  .../bindings/leds/cznic,turris1x-leds.yaml    | 118 ++++++++++++++++++
>  1 file changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml

Needs a DT Ack (now Cc:ed)

> diff --git a/Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
> new file mode 100644
> index 000000000000..bcaab5b03128
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/cznic,turris1x-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CZ.NIC's Turris 1.x LEDs driver
> +
> +maintainers:
> +  - Pali Rohár <pali@kernel.org>
> +
> +description:
> +  This module adds support for the RGB LEDs found on the front panel of the
> +  Turris 1.x routers. There are 8 RGB LEDs that are controlled by CZ.NIC CPLD
> +  firmware running on Lattice FPGA. Firmware is open source and available at
> +  https://gitlab.nic.cz/turris/hw/turris_cpld/-/blob/master/CZ_NIC_Router_CPLD.v
> +
> +properties:
> +  compatible:
> +    const: cznic,turris1x-leds
> +
> +  reg:
> +    description: CPLD address range where LED registers are mapped
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^multi-led@[0-7]$":
> +    type: object
> +    $ref: leds-class-multicolor.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 7
> +
> +    required:
> +      - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    cpld@3,0 {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x0 0x3 0x0 0x00020000>;
> +
> +        led-controller@13 {
> +            compatible = "cznic,turris1x-leds";
> +            reg = <0x13 0x1d>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            multi-led@0 {
> +                    reg = <0x0>;
> +                    color = <LED_COLOR_ID_RGB>;
> +                    function = LED_FUNCTION_WAN;
> +            };
> +
> +            multi-led@1 {
> +                    reg = <0x1>;
> +                    color = <LED_COLOR_ID_RGB>;
> +                    function = LED_FUNCTION_LAN;
> +                    function-enumerator = <5>;
> +            };
> +
> +            multi-led@2 {
> +                    reg = <0x2>;
> +                    color = <LED_COLOR_ID_RGB>;
> +                    function = LED_FUNCTION_LAN;
> +                    function-enumerator = <4>;
> +            };
> +
> +            multi-led@3 {
> +                    reg = <0x3>;
> +                    color = <LED_COLOR_ID_RGB>;
> +                    function = LED_FUNCTION_LAN;
> +                    function-enumerator = <3>;
> +            };
> +
> +            multi-led@4 {
> +                    reg = <0x4>;
> +                    color = <LED_COLOR_ID_RGB>;
> +                    function = LED_FUNCTION_LAN;
> +                    function-enumerator = <2>;
> +            };
> +
> +            multi-led@5 {
> +                    reg = <0x5>;
> +                    color = <LED_COLOR_ID_RGB>;
> +                    function = LED_FUNCTION_LAN;
> +                    function-enumerator = <1>;
> +            };
> +
> +            multi-led@6 {
> +                    reg = <0x6>;
> +                    color = <LED_COLOR_ID_RGB>;
> +                    function = LED_FUNCTION_WLAN;
> +            };
> +
> +            multi-led@7 {
> +                    reg = <0x7>;
> +                    color = <LED_COLOR_ID_RGB>;
> +                    function = LED_FUNCTION_POWER;
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.20.1
> 

-- 
Lee Jones [李琼斯]
