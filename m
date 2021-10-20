Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE9BC433EF
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 14:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 12B5161374; Wed, 20 Oct 2021 14:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id F107E61359
	for <soc@kernel.org>; Wed, 20 Oct 2021 14:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634741407;
	bh=CjAEEuVKli7tI/vjqwHOTEZ/50uHuVqQ0ecCbQpOMYs=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=rDVHeB7j/thKZBzOPeX2sEfDlOakacwq+rhfUXSCftlOrodJdY+tn+XEWJORcPbSi
	 heNoS8NQr9WKJl5I/+BnzsK+kSEhpI9yJllXsXvGd0P0q0aswxvjhU9qgLCIKoZaj7
	 ajJIxqYI+AOJX75JTJh+I76PfVOCES+xrvcnPrzF11yv6bSglt+SKY6jIL0x6lNFeg
	 Q2zzZ+NU3v3OKwieYfKjaLegD5/4ulyuwP7Nk+cQTcllnelHNKNK3cPKfnR+L+HJ2W
	 zbR6b2eUu2IbSNh4OLdlw5qU8jleXOpcxjC6J04sOBoHevw0+FoVWi7q4MARR3jefd
	 oCgoA/8wuqkCA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E6E9D609D1;
	Wed, 20 Oct 2021 14:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163474140688.10750.3183665225234496197.git-patchwork-summary@kernel.org>
Date: Wed, 20 Oct 2021 14:50:06 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] i.MX fixes for 5.15, round 4
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=565039
  Lore link: https://lore.kernel.org/r/20211018000958.GC25810@dragon

Patch: [GIT,PULL] Reset controller fixes for v5.15
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=566427
  Lore link: https://lore.kernel.org/r/b378f2aae54538db6a13c98561b4cbcacbef937c.camel@pengutronix.de


Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


