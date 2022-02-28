Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44280C433F5
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 15:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31EB3C340E7; Mon, 28 Feb 2022 15:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2333C340F0;
	Mon, 28 Feb 2022 15:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646061431;
	bh=B4pd1VduXeSk6aztjLT81jeS4N7l5uMdc+KQT6hPxfg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NXAiFA6rR9UTKrXsW4wxFz3reKmiNsj0HgZ8+43E6lGj1AEOLkze/8Is+ayzvmIYX
	 gse4MqhPmvUdTvLMpTLcY7d0mzDwQgBFbfG8WmQLubID2S0iL58DE0Vf8jAya4/Cl4
	 YFbUoZL1EFyCBDVuT4t4hfbHIK/jsZoFAQCxP3xtbn7z+E56CRp/NbHxjVulEgBigR
	 St7e8jmJwyEkCaQ4KF4veN1mNd0U/vhc5zIKojzqXlOQpLQsiAdQYbRr+MPYmddz9w
	 RPGcAf+80+eHHTHUjTfyNZZmaDzowtnP9Q89p7ute3+TRHD8EQHCBnigPP//j3biXT
	 VIKxncTzRuZCw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] ARM: dts/drivers: samsung pinctrl for v5.18
Date: Mon, 28 Feb 2022 16:16:37 +0100
Message-Id: <164606116774.3364867.11073498423592511206.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220129115352.13274-1-krzysztof.kozlowski@canonical.com>
References: <20220129115352.13274-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 29 Jan 2022 12:53:52 +0100, Krzysztof Kozlowski wrote:
> There is quite a lot of changes in Samsung these days, so I am sending this one
> very early. It's also a controversial one because it combines pinctrl
> driver+dts into one. I mentioned it before in [1].
> 
> The pinctrl driver changes have to go before DTS. The DTS has to go with
> dtschema, so the dtschema checks won't complain with warnings.
> 
> The pinctrl driver changes are coming from my Samsung pinctrl repository and I
> will send them later also to Linus Walleij.
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 4d9b86eb38af20747229b1247ff950572128f3d4

       Arnd
