Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EC7C76196
	for <soc@archiver.kernel.org>; Fri,  7 Apr 2023 07:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35A9FC433A0; Fri,  7 Apr 2023 07:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13109C433D2;
	Fri,  7 Apr 2023 07:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680851456;
	bh=JiKnYStPCoA/gxYpxixifA3dAuGapNL1xtDMX6gb/+g=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=Y7lvrOA2/p2SDAFisczow6+CNwA/H+KFk99BPrkbTbsxaDuiSJIfi4gcIKOkb50DU
	 A8ahi3mE58n8jQo8F1J37PLjXnGRxoPGNhA/FF9nazcJBrS8Gfsi0l4lMB/nHseLHQ
	 TZvm2OOEu2Of8AQTV/g8lyo0YwOKHxnRr2ipTlnb0VwjX0u6h2JW8M3qnRCNnMuHqr
	 KzZLML2fCZL4I6m1OqfrfD/NklehiV2V8oycan+vCOhzlq9G3vV+JmzkEREKh39kyA
	 oK+XaZFXfZv1TqpzGBr3cyTRT2OH21WQZ5E6lZhNfu8S7WW21nuJRBkLagULgZ6XLR
	 p68hg8UhbgXvA==
Message-ID: <028c7d3a-7013-84ad-d667-0b252a5db076@kernel.org>
Date: Fri, 7 Apr 2023 09:10:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/3] p54spi: convert to devicetree
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
 <20230404082401.1087835-4-arnd@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230404082401.1087835-4-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/04/2023 10:24, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The Prism54 SPI driver hardcodes GPIO numbers and expects users to
> pass them as module parameters, apparently a relic from its life as a
> staging driver. This works because there is only one user, the Nokia
> N8x0 tablet.
> 
> Convert this to the gpio descriptor interface and DT based probing
> to improve this and simplify the code at the same time.
> 
> Acked-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  MAINTAINERS                                |  1 +
>  arch/arm/mach-omap2/board-n8x0.c           | 18 ------
>  drivers/net/wireless/intersil/p54/p54spi.c | 71 ++++++++--------------
>  drivers/net/wireless/intersil/p54/p54spi.h |  3 +
>  4 files changed, 30 insertions(+), 63 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4f57deee1a08..9b08dcea913a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15793,6 +15793,7 @@ M:	Christian Lamparter <chunkeey@googlemail.com>
>  L:	linux-wireless@vger.kernel.org
>  S:	Maintained
>  W:	https://wireless.wiki.kernel.org/en/users/Drivers/p54
> +F:	Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml
>  F:	drivers/net/wireless/intersil/p54/

This hunk should be rather part of your patch #1.



Best regards,
Krzysztof

