Return-Path: <lee@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A98C54EAA
	for <soc@archiver.kernel.org>; Fri, 27 Jan 2023 11:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68DCBC433A1; Fri, 27 Jan 2023 11:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB47C433EF;
	Fri, 27 Jan 2023 11:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674818166;
	bh=6G4z90pDittE12G2lhfqtwLwHrtu8K3YgHT/6CLTo7g=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=tujw4nVatUuFeTFBjmrtqiIp44ojgplDCdFRq0D4VuBa4P3pAgMY9xnPkoUldKPD/
	 L4zu7+dzUOPbXol/j0RuRC70Ub++csEFIHQf9AsVIK+9L2WL9IHlr9Tj8RAP2vmKjM
	 Srk+dz0Lf/SenXL2kBMMBP9umbhKE3G3Pd2vG/6x604oBMBKxz6PzSnjkXQ9hkAuPm
	 RDTEH2gIu9byaJy9wwKRnHrhsJ/eTUukmHHpJlmmsVQ97LEmsvdw9235cQ9n6wv9Yu
	 rvN32oCByC0GrsNlWZnylqn7lB1sKe0UOfCN3vc+5IXf5ZuXvWK8qfOM2QlirHPZrr
	 xHLGhgkqys7nA==
Date: Fri, 27 Jan 2023 11:16:01 +0000
From: Lee Jones <lee@kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND 1/8] dt-bindings: leds: register-bit-led: Add
 active-low property
Message-ID: <Y9OycfvJEZ3tX/xm@google.com>
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-2-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221226123630.6515-2-pali@kernel.org>

On Mon, 26 Dec 2022, Pali Rohár wrote:

> Allow to define inverted logic (0 - enable LED, 1 - disable LED) via
> active-low property.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/leds/register-bit-led.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Needs a DT Ack (now Cc:ed)
 
> diff --git a/Documentation/devicetree/bindings/leds/register-bit-led.yaml b/Documentation/devicetree/bindings/leds/register-bit-led.yaml
> index ed26ec19ecbd..418130b29caa 100644
> --- a/Documentation/devicetree/bindings/leds/register-bit-led.yaml
> +++ b/Documentation/devicetree/bindings/leds/register-bit-led.yaml
> @@ -43,6 +43,11 @@ properties:
>          0x100000, 0x200000, 0x400000, 0x800000, 0x1000000, 0x2000000, 0x4000000,
>          0x8000000, 0x10000000, 0x20000000, 0x40000000, 0x80000000 ]
>  
> +  active-low:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      LED is ON when bit in register is not set
> +
>    offset:
>      description:
>        register offset to the register controlling this LED
> -- 
> 2.20.1
> 

-- 
Lee Jones [李琼斯]
