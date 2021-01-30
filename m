Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DB9C433DB
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:31:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8D1DD64DDB; Sat, 30 Jan 2021 11:31:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38FB164DDD;
	Sat, 30 Jan 2021 11:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006264;
	bh=wR0IqTfIS+bxQ8ZZ4693iDOruzaEnXNEWqTlrwUflcU=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=qmKlOsw1gbLVr5WTpkJXC98biGX8Xqd84SQV18kozJ5OA1kcujk9i7lj7nUBc6ds8
	 cv5p6HPpxS0pisZD/wd96ECBF9eldIqCCQePNJG+4PTqoQbTmpQjcVa+zm3Wwl2ygc
	 5XWYa2HaVzgl5bnB6MH4znEQfg5K4fEEoMl7wnX3vxqgnYtqE27uXKMsLobMLXxRPS
	 dvGt0767SNvpykGcUIZIC69+t9GnlPuvTtySl1mnCDD9GtwZ+LmbB2xvwT4DJLMZoB
	 onnKWE3HP8cQhzpLMlAnWwugdM4BFKVUHrX4Q89KFrlcrIQhi2q2+SQJM0lWX60vOb
	 5WOUkHIkq8ECg==
From: Arnd Bergmann <arnd@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>,
	arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	soc@kernel.org
Subject: Re: [GIT PULL] Rockchip dts fixes for 5.11
Date: Sat, 30 Jan 2021 12:30:49 +0100
Message-Id: <161200623014.2192465.10050654314419322038.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5429065.DvuYhMxLoT@phil>
References: <5429065.DvuYhMxLoT@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 28 Jan 2021 09:32:05 +0100, Heiko Stuebner wrote:
> please find below some Rockchip devicetree fixes for the 5.11 cycle.
> Please pull!
> 
> Thanks
> Heiko
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: f2d514b4f428265e418e8fb46adebeb6c0717131

       Arnd
