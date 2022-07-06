Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A2FC43334
	for <soc@archiver.kernel.org>; Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D585C341CA; Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5563EC341C0
	for <soc@kernel.org>; Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657108818;
	bh=n8D1BypatD1L+IDHrGyZdLCTgK9WwyHQ8yFUEWVZIIA=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=gMqQFzrSoGlQG8X4pzzz76Dewp4Dp8Fpqd60lwSrFzo6NAWca/JbMN8WzFl00pr38
	 I0LU16EwxaFmrSwrwhOBncfIA8qP5iGBTrhf09QDE1+1jUtQ6JcwwD6Gi9EFTx66Wu
	 UEP2WPNDCr5pzSlXv94kcKMWxORgou8JK3E+CHh918QikqLtOlCm1Slr6Bph8DJ75V
	 EyNweHbBpN0iaMkN7hUjgris57jGu64d9V8kWrsFQ2pNZHSJyKoVSTUTY0JmN0i7MV
	 OmP9/5TUGSYGQJUaaTplnHxBzZoV+Lf114c4aieNGQ2Bzt0wXaCl2889nrGXboIBkS
	 MiM1ohOwTvSpQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 404B9E45BD8;
	Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165710881825.23384.14187665241280092737.git-patchwork-summary@kernel.org>
Date: Wed, 06 Jul 2022 12:00:18 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Rockchip soc fixes for 5.19
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=656623
  Lore link: https://lore.kernel.org/r/7527945.6fTUFtlzNn@phil

Patch: [GIT,PULL] STM32 DT changes for v5.20 #1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=656599
  Lore link: https://lore.kernel.org/r/a250f32b-f67c-2922-0748-e39dc791e95c@foss.st.com

Patch: [GIT,PULL] Rockchip dts32 changes for 5.20 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=656625
  Lore link: https://lore.kernel.org/r/14795241.VsHLxoZxqI@phil

Patch: [GIT,PULL] Ux500 DTS updates for v5.20
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=656828
  Lore link: https://lore.kernel.org/r/CACRpkdY1MG=HG+tOCmD1_LEAStV1-ycCLkwShMRD4R=4jGDYHQ@mail.gmail.com

Patch: [v2] ARM: dts: lan966x: Cleanup flexcom3 usart pinctrl settings.
  Submitter: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
  Committer: Claudiu Beznea <claudiu.beznea@microchip.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=656372
  Lore link: https://lore.kernel.org/r/20220704135809.6952-1-kavyasree.kotagiri@microchip.com

Patch: [GIT,PULL] Rockchip dts fixes for 5.19
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=656622
  Lore link: https://lore.kernel.org/r/7723415.29KlJPOoH8@phil

Patch: [GIT,PULL] Rockchip dts64 changes for 5.20 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=656624
  Lore link: https://lore.kernel.org/r/40088956.J2Yia2DhmK@phil


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


