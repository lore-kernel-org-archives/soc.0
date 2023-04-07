Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFDAC76196
	for <soc@archiver.kernel.org>; Fri,  7 Apr 2023 07:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD3D6C433A0; Fri,  7 Apr 2023 07:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DEF2C433D2;
	Fri,  7 Apr 2023 07:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680851109;
	bh=/0Mnv8Zr2RG+GmhJcKNf2ttcD62VASZNHlXatWgG+Gk=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=Pe9EVUA+q4RzFsmyqrwW0Dnhup0wKQl8ZGF3qDy/7lxAqMFAutO1MWuh7J7788mjN
	 +0GRglb+Tkj3vFeTfwJrs6+qqkCx1UF6zq2z2HEOneaBftA+cbXzSQjrbKAkotE3Yr
	 TrE9ex9H6MOkk2/xDhXq39v3ywD+Ga4fz1BhF3Rj+qTeJxzl9r9EHDVjhW++SFAXfK
	 LVozbmt2vqWwHp2T948wA3y+dea4530aLrR/xkDYs0BOm2w1+X8j6wJpsOX4YEudfh
	 CO4ieMLrtHZW/ste8Kb46wHvpYifORZoqiF+FUan9VtYM7EuvMbNHukmBrSgSTtSyJ
	 r1nvLiEY5hyhA==
Message-ID: <f975f644-a917-6a36-3d1e-3c230a1c6e3d@kernel.org>
Date: Fri, 7 Apr 2023 09:05:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/3] ARM: dts: omap2: add stlc4560 spi-wireless node
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
 linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org
References: <20230404082401.1087835-1-arnd@kernel.org>
 <20230404082401.1087835-3-arnd@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230404082401.1087835-3-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/04/2023 10:24, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Converted from the platform_device creation in board-n8x0.c.
> 
> Link: https://lore.kernel.org/all/20230314163201.955689-1-arnd@kernel.org/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>



Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

