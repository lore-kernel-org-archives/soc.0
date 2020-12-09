Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFCFC433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 20:32:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A508323B99; Wed,  9 Dec 2020 20:32:14 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 1/2] soc: samsung: Second pull for v5.11
Date: Wed,  9 Dec 2020 21:32:08 +0100
Message-Id: <160754591589.2474728.7440733402557449514.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207074528.4475-1-krzk@kernel.org>
References: <20201207074528.4475-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 7 Dec 2020 08:45:27 +0100, Krzysztof Kozlowski wrote:
> On top of previous pull request.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 124f035310adc781d91cdf0b7c6e4fb3c7e43e23:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 19cf6e6d402a7732d39570afcdd3b8a0a66df652

       Arnd
