Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87386C4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 20:44:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 67B71610CF; Thu, 12 Aug 2021 20:44:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D82A9610A3;
	Thu, 12 Aug 2021 20:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628801052;
	bh=jUYf9jPImCM6i193AyZ0olJFMMldGX6bYRnC5GXijE4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Olv3KCfQJF6o6qXswTZqFCEgMkSFluGEKmm6+lpUDpAWnWUKg0yM+qxmoywUKNOrq
	 0T+gY+8wTBfUoZ5GQ8NzKZbWPdxaovwaKLl5DmK2hQqHE3mWK8YMu2L4FEIIpGgiI7
	 rNp9yKzRZSrci/dQ7qkQgajH8EDsD/ln73uRQ6MtRQblE4KsxfHxjbzwJVaXbxlsGm
	 p7MldWFeo1RauICxm25eoGIfxBP2X8PfXpnBRwCnnB5iCbCNokYf+Et5kdQalRhDvc
	 hXMSS3ehChkzSzQW4YuHKXwNmmuYSpn3onl/K/QAG9FS9eIEc6QBjuQ0ZdWTZfU9hH
	 JIHoebjEMfBcw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL] memory: changes for v5.14
Date: Thu, 12 Aug 2021 22:44:00 +0200
Message-Id: <162880092628.1372486.5099431301905888708.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210809152639.110576-1-krzysztof.kozlowski@canonical.com>
References: <20210809152639.110576-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 Aug 2021 17:26:39 +0200, Krzysztof Kozlowski wrote:
> I organized changes on separate topic branches just in case I need to share
> them with SoC maintainers.  They are all merged back to main branch.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 0dc76ecbbf15c43197f204c6631c6ef12f00d6ba

       Arnd
