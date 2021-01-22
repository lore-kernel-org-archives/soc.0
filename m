Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8217FC433E9
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 22:43:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 607CA23B06; Fri, 22 Jan 2021 22:43:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86FA123AC0;
	Fri, 22 Jan 2021 22:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611355424;
	bh=lIUCnRg6dYAJCci9bt5hPR4IqWkf7HhR8SiytZTy/lI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rNVQlw2MsGLvK6SCIOVp76zzOzpE86VLKn8730JMCARGuTg6xDAyTospAxj69qZdj
	 8XXzR0YcXZSYCRv+VzC070A/a2hof4jqkob3pe3Z7O7uh5aAEYhkSiuOATpszJEe3F
	 zOk3Rd0Qp7NBiU4a841QaMTD/76vdXBL+JJIOwvSrWX/iUWXy6QJgYunTW/6IRPxEY
	 LHDirmAGXgFfJ/UeHbXJyUPqkWBIFaxEigMkt/PVVeAedzKrw08wBoURhD+X6AqsqB
	 IKEwEzrS+fT4sgiKPWw2bO871Vpnx9zzoKySnMfCosanNiMi5duca3Tii7k2oPapFQ
	 gro802w/n+WPg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
	soc@kernel.org,
	arm@kernel.org,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linux Kernel list <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] ARM: at91: dt for 5.12
Date: Fri, 22 Jan 2021 23:43:32 +0100
Message-Id: <161135518031.1310202.4648608354529852901.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122145056.171283-1-nicolas.ferre@microchip.com>
References: <20210122145056.171283-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 22 Jan 2021 15:50:56 +0100, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> Here is the first batch of dt changes for 5.12. As for the SoC PR, I plan to do
> another one by mid-next-week. Tell me if it's fine with you.
> 
> Thanks, best regards,
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 8a4e89a16aa4b11711ba01de180c4e29cb5d21f7

       Arnd
