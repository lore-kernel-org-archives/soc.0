Return-Path: <SRS0=rh0X=3G=bewilderbeest.net=zev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29ED4C4332F
	for <soc@archiver.kernel.org>; Sun,  6 Nov 2022 09:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8FFAC4314D; Sun,  6 Nov 2022 09:24:04 +0000 (UTC)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1B6AC433D6;
	Sun,  6 Nov 2022 09:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B1B6AC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bewilderbeest.net
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 0E3C3216;
	Sun,  6 Nov 2022 01:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1667726637;
	bh=Q6rA6QGxk4YR7vZUSMP3iZf8lpV6fi2XiRCc0+f8lyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q8sLcxslhia5fk7j7nWLtocYLbLxI7C+mepSmRLlSSBtFMII+h/gi7mrXc9E/2lYt
	 jkYkcyd3TNsi4kVGpRmgOz8HpsOrDlBmpaYrqrgYYKwrTgx4jf04u0w8a5GTJJrKDh
	 80JbCw2oCYBUp45IlW2aZxfLkQohm3M4V1WUJmds=
Date: Sun, 6 Nov 2022 01:23:55 -0800
From: Zev Weiss <zev@bewilderbeest.net>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	soc@kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Arnd Bergmann <arnd@arndb.de>,
	Joel Stanley <joel@jms.id.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add Delta AHE-50DC BMC
Message-ID: <Y2d9K1KGM8BcR6Rn@hatter.bewilderbeest.net>
References: <20221105013321.2719-1-zev@bewilderbeest.net>
 <20221105013321.2719-3-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221105013321.2719-3-zev@bewilderbeest.net>

On Fri, Nov 04, 2022 at 06:33:21PM PDT, Zev Weiss wrote:
>This is a 1U Open19 power shelf with six PSUs and 50 12VDC outputs via
>LM25066 efuses.  It's managed by a pair of AST1250 BMCs in a redundant
>active/active configuration using a PCA9541 on each I2C bus to
>arbitrate access between the two.
>
>Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>---
> arch/arm/boot/dts/Makefile                    |    1 +
> .../arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts | 1094 +++++++++++++++++
> 2 files changed, 1095 insertions(+)
> create mode 100644 arch/arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts
>

Hmm -- actually, after posting this I realized that the repetitive efuse 
nodes could be expressed in a much more concise and much less tedious, 
error-prone manner using a preprocessor macro or two; I'll send a v2 
with that approach instead.


Zev

