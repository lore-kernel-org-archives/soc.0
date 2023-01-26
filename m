Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D222EC61DA3
	for <soc@archiver.kernel.org>; Thu, 26 Jan 2023 10:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96444C433EF; Thu, 26 Jan 2023 10:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81652C4339B
	for <soc@kernel.org>; Thu, 26 Jan 2023 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674727217;
	bh=I5ZRwA60pCwDO1wW7hx1H1oP2Om4rr01DOTwv42u7ro=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=qXriMpttVvx523AFNx62HhOwIREmn5mkDgCpQcMN9VxwW87ZedVWK547O/SNrr/ma
	 ixYYJ8W1Ol527gsnDDps9T9Pn/f3ngIi6sYxrZeDklg+D8kvYVhkbkpBinOLzg6Rd8
	 tgiYa+e7d+oIiw+2I0dwyuvPrEWp62xPZXeYPny8ra+nUBCFJLfDp3ZW1YCKfhEuVb
	 eIXD//Ap6OdTDBnf0jbA9Iqu32307ixf0Xv/hG8L4ieR7QlMdfuByIIGAV9Ut5L/cF
	 8GnM1iElaKcCysgAlpjfGrnzTYFHKTDuOXYVLO1Gr098HKz7xJ+6luRKYxSwhldsRq
	 0mzJHTYsk9WEQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6152EE52508;
	Thu, 26 Jan 2023 10:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167472721733.24700.12514130344781014080.git-patchwork-summary@kernel.org>
Date: Thu, 26 Jan 2023 10:00:17 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Ux500 DTS updates
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=715654
  Lore link: https://lore.kernel.org/r/CACRpkdY24Lv0F3ct2R6ALPpAdxWz_vEjrPAGNSF3pcoOj-Xqcg@mail.gmail.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


