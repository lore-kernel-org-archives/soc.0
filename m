Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B87C433DB
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 15:01:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DF3D164D74; Thu, 11 Feb 2021 15:01:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3989D64E7E;
	Thu, 11 Feb 2021 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613055665;
	bh=X9UqADU4J8H3kIOyPuFf7eWbCck6q4pQRHXpDS4jmlA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oyn4pPI2M1y4Ah2UElZjGLQtDOuiLHAPYfv9JypgZG0JRxFxN8jCR5hik0JFGITc8
	 CdcOkG/bui6Hc5ovBaVXs/v4Q49RedFmEgOEKHio0G+ySix8AyveCbOG5ynN7eZmA2
	 nsWBTCnyJ2xAMcF8fkn3/+xMDkPuxLS9yTpkcACTJ3B86BV9apRCeHVzH/QlU2cTjD
	 HZcaZ4c75Jv7cU1cD9CB0Je5Gbwi9AMXZb+qOcxiKXNJR8wVb4heROqbM5lnBhJfzz
	 cQm9SjjUJQijtXvCXblwihONFBYYOzHpI6275WKi98e3o2+yXn3R1qPBzjU3clqlKu
	 OfT40EBy5DF4w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [GIT PULL] ARM: mach/soc: samsung: late pull for v5.12
Date: Thu, 11 Feb 2021 16:01:00 +0100
Message-Id: <161305564880.259023.8415922783471505237.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210211082254.7934-1-krzk@kernel.org>
References: <20210211082254.7934-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 11 Feb 2021 09:22:54 +0100, Krzysztof Kozlowski wrote:
> Late pull with minor mach/soc fixes for v5.12.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/soc, thanks!

merge commit: c2bd78de41fc3bdeb183bc24bbb2c4c0f3cfdb9a

       Arnd
