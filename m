Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3038C76196
	for <soc@archiver.kernel.org>; Fri,  7 Apr 2023 07:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0E5EC4339E; Fri,  7 Apr 2023 07:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1FAC433EF;
	Fri,  7 Apr 2023 07:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680851076;
	bh=GXoodZjO3sAMtqS/iuUzKSC3cWc7OEq2kQ6s5gYK+dE=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=fxQmhEbleQQ5RIgnLXY6bEi+0tW/rkg5dnBl+4IvT6IBRhxDoZP/45C8dQm8wrPrL
	 H95fK7U1Lvlt5lh/pVqlgauo8SpLKYRoT5FQUr4RuMBucdUfeBKBpCv/KjudVul8hf
	 7XwxfLhtr1XR5N6fbviMmrfhWPJGbdfqt2SoeaLOPV4lCQxFUB9wGLGMCv4QBskroP
	 6OdF+QzDcaJmK+ZDgYCGF7+RANcIw0pjs4WvR5Fo+Zr1Xdr1ZfBLv6nixCKT4+xqVD
	 MPIqinpq/G+3FBNWeOlTFEzUj6/gy8JlIh27laJRiYuudgGuI8WZSa9Yz5/4e10UWI
	 s0oJwTyoGm1Uw==
Message-ID: <2f2ef649-d534-41ac-afb6-1db4e1874174@kernel.org>
Date: Fri, 7 Apr 2023 09:04:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/3] dt-bindings: net: add st,stlc45xx
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Bartosz Golaszewski <brgl@bgdev.pl>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Christian Lamparter <chunkeey@googlemail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Felipe Balbi <balbi@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
 Christian Lamparter <chunkeey@gmail.com>
References: <20230404082401.1087835-1-arnd@kernel.org>
 <20230404082401.1087835-2-arnd@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230404082401.1087835-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/04/2023 10:23, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Link: https://lore.kernel.org/all/e8dc9acb-6f85-e0a9-a145-d101ca6da201@gmail.com/
> Acked-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---


> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +	#address-cells = <1>;
> +	#size-cells = <0>;

You have here inconsistent indentation - tabs/spaces. Use 4-spaces for
DTS example.

> +
> +	wifi@0 {
> +	    compatible = "st,stlc4560";
> +	    reg = <0>;
> +	    spi-max-frequency = <48000000>;
> +	    interrupts-extended = <&gpio 23>;
> +	    powerdown-gpios = <&gpio 1>;
> +	};
> +    };

Best regards,
Krzysztof

