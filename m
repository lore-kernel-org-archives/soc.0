Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5CAC433E0
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 15:01:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 70D5464E9C; Thu, 11 Feb 2021 15:01:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C24D664E8B;
	Thu, 11 Feb 2021 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613055668;
	bh=rqDDjK79OBgoldPyoYveemxer73pj+/BzsHfHnq+B+k=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pQ/+BRdpKgxwexLP3BGQbeHw9yLGaWQAi7fYG5MgCwPBMf13lfglgCNTuI6VZ+Dm0
	 CHTBexu91SMibX4R0bJeGKCHNJuJqqh0ojHE/buz1jMySAdzw7YQ0DuW99JjTWF621
	 /QvwyBbg3BUpgmJs7rdQ/AwyQFy2/9lnpJNXuUJZudXwIm5sAgy3JUhkiYP3dLILcr
	 w3LRyzooHRQxgSh6whG3SWjnVfzBQwIsVcJs8Y2tNvbVXKQQWe8F3VP5/hdpOpDHZi
	 9ApPH7+V2hl59HeDeNUIIV4o218iNTqSYlhG7fY3XRHlFtwodEiBIgiNrwGWjt5Fkb
	 WrHOkq9Csps8g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	arm@kernel.org,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] MAINTAINERS: arm: samsung: include S3C headers in platform entry
Date: Thu, 11 Feb 2021 16:01:01 +0100
Message-Id: <161305564871.259023.6054347017604811927.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210172303.335268-1-krzk@kernel.org>
References: <20210210172303.335268-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 10 Feb 2021 18:23:03 +0100, Krzysztof Kozlowski wrote:
> Several S3C24xx/S3C64xx headers in include/linux are not caught by
> Samsung S3C/S5P/Exynos maintainer entry and might look like abandoned.
> Include them in "ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
> entry.

Applied to arm/soc, thanks!

[1/1] MAINTAINERS: arm: samsung: include S3C headers in platform entry
      commit: 36de760a5a90450bc1bd92b6938ce46f502da54d

       Arnd
