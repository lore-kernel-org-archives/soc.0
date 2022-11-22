Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0CCC43217
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 22:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 564F2C433D6; Tue, 22 Nov 2022 22:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 403BBC433D7
	for <soc@kernel.org>; Tue, 22 Nov 2022 22:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669155618;
	bh=zPvaVKu3hBeK3hmqdrPK7UT0dpIcr6P5FcAxLwx73xY=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=VyCW8gu94ObdKDDdfLTtTRxNxuVqUDijQsdjCxW7gPdh2NaH6R2hjN92kGoE44gg7
	 InJGeI4yfaMlzcG4FByBHKtRflN0eT/QagTq9u/f4wlDXDLNJBVvk9Y6mpgt23x0hj
	 jPRjJLcndVqvyW0YabD4qQxgHlvkGlT2HH8GQIHUNDUmNxegu2fGDYK7wW0Zg5MoQ3
	 J33hb/E84nSgAqXcFdemAQo4ldrKHG2NO1UARkz8ehkOknq5C+KsAde0D+YXPJsmp5
	 5SDl5wekCj/tIXTha1pO2Bs2jNny3DuVumADylY89wvCw2FNbDMICMHJO9Ar7d0J2n
	 +60E5XBpe8Hhg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1AB48E270CF;
	Tue, 22 Nov 2022 22:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166915561802.11152.16526966603879718151.git-patchwork-summary@kernel.org>
Date: Tue, 22 Nov 2022 22:20:18 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: bus: ixp4xx: Don't touch bit 7 on IXP42x
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=698104
  Lore link: https://lore.kernel.org/r/20221122134411.2030372-1-linus.walleij@linaro.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


