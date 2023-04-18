Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DDCC77B75
	for <soc@archiver.kernel.org>; Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84EA2C433A0; Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64832C4339B
	for <soc@kernel.org>; Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681831220;
	bh=vH2WZFRi8hA7jjMoKCAxEJlvwRQEW/eTF6ozuFkeSug=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=MZsyFmYBHK9iL1l3nXQxn97Gn/5k9Naw2xTKS7sbi7KCWoHlUgMvc1UYN52FVP84w
	 2apheScmsGrMPaZxDpsHhoE6aMf34U+bfVMXWAT+RlBtErWoVFiWXnbbfT6pdtGHGu
	 DNdaVplKqIjYRF7rlVhynPVndtSfbz7c+crDqjrivi1f/6NIDvZNqgefo7hTvlkWdu
	 rAfryLnVDXpPyod/pbGegZ2RTIJDJwovoZ8khxRnKGj9erojPX4x9W3KR5wjKaZnjF
	 EmUuXYWgWbPzmTMBnhPpqdzdC/JP0JipWagYz918UfpTQCeofMUxWSqTrid+36lNUD
	 pT3/3vZV42VKg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 397B4E330A0;
	Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168183122015.6966.2228771377620076778.git-patchwork-summary@kernel.org>
Date: Tue, 18 Apr 2023 15:20:20 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: mvebu: arm64 for v6.4 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=740853
  Lore link: https://lore.kernel.org/r/878repzfbp.fsf@BL-laptop

Patch: [GIT,PULL] ARM: mvebu: dt for v6.4 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=740851
  Lore link: https://lore.kernel.org/r/87edohzfeg.fsf@BL-laptop

Patch: ARM: config: Update Vexpress defconfig
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=740806
  Lore link: https://lore.kernel.org/r/20230418082427.186677-1-linus.walleij@linaro.org

Patch: [GIT,PULL] Rockchip dts64 changes for 6.4 #2
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=740720
  Lore link: https://lore.kernel.org/r/5144826.MHq7AAxBmi@phil

Patch: [GIT,PULL] ARM: mvebu: dt64 for v6.4 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=740852
  Lore link: https://lore.kernel.org/r/87bkjlzfcw.fsf@BL-laptop


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


