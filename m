Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14AAC433EF
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9022C6128B; Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7A71F61260
	for <soc@kernel.org>; Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634737813;
	bh=ddpKl8/OTIu0Js7wPwC4E52gcSt2+QzFFaBXLeDAiVE=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=kCCBGYB83TZ8nIU6PinojZaAv8sfZT8hjxXgl1ADeQYF2+9d9T94Z3tBCG8fsds8A
	 Hl2XGm02dqUCqyotncwlA719A/nuPlLLQIqB7j1XIr8jBxoTeXNLbTkijUMIiTeNaT
	 oFQloaXkv7ZHUN0tmkjbU9Cp2EW5Mvz+/EHEbRVQsvWEnOAMSjOUBdztRnAmKj8iIM
	 0PqZopvZKarTdsshY+Io5Skz5fFeRwfptiDoz/BcF/hdu0pkS8GkEKVZzVEQwjycqs
	 62be+LUpeYRSOx9IvaWOHXdRLDzAGS4c5Rq/OkzUHVT14e8JvYgvdK1QD5cUifRg/L
	 5v21M+p+9rniA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 67DAD609F7;
	Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163473781336.13902.17102938063732498406.git-patchwork-summary@kernel.org>
Date: Wed, 20 Oct 2021 13:50:13 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: mvebu: dt for v5.16 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=564415
  Lore link: https://lore.kernel.org/r/874k9imeel.fsf@BL-laptop

Patch: [GIT,PULL] Rockchip dts32 changes for 5.16 #2
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=566889
  Lore link: https://lore.kernel.org/r/3630369.N7QejLDta5@phil

Patch: [GIT,PULL] IXP4xx changes for v5.16
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=566681
  Lore link: https://lore.kernel.org/r/CACRpkdbSJ662h_B9mAGdXWBeq8ZwKTQvSJ7cZ2x2d8UgELP5QA@mail.gmail.com

Patch: [GIT,PULL] Gemini DTS changes for v5.16
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=566683
  Lore link: https://lore.kernel.org/r/CACRpkdac5Sbt42CtuLMgCazfHdhcP98mEKGjeZ-DVcb=_N90Bg@mail.gmail.com

Patch: [GIT,PULL] Rockchip dts64 changes for 5.16 #2
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=566887
  Lore link: https://lore.kernel.org/r/4536780.s7XYDJ6uuW@phil

Patch: [GIT,PULL] ARM: mvebu: dt64 for v5.16 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=564413
  Lore link: https://lore.kernel.org/r/877deemefy.fsf@BL-laptop


Total patches: 6

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


