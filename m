Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0329C001DD
	for <soc@archiver.kernel.org>; Thu, 29 Jun 2023 22:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4C38C433CD; Thu, 29 Jun 2023 22:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EC7DC433CA;
	Thu, 29 Jun 2023 22:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688078361;
	bh=gg4mdZsr1uF5gtI2MRDQGbmXaB5MrpF73JPY3dOgSKE=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=Tf8k4fEfAH0BN7TXRU+V/sEd/A75jNKKfQRzgsyyG/bUVDdjQV0ddMd586j3IaRJj
	 OJzGN+aNO56BVAMBdZPHh7HMIE/4iX54bGE1AJuZEjq37SKjLEc4jzYEiNsyxXTAtP
	 tDgPoPvtcE1NfVi//wMU2x56qt4badPoq0X7pvUvsH2ItMMY5WJWnt78FOJvW2zhKm
	 sSiO8tgHvoMV2KGVISGPWTxDYDZqkTanGHE55uy1rNCCJOFRK1kUcNG4FtuQU9KmHM
	 6WgZl8bp+ZDJF6YuVaG+WKLKTE6QbXYpsvPGG3RrmpB/HwjvPW9sl0qV+W3zor70G3
	 zm6UqXF7bzGmg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7BD93E5381B;
	Thu, 29 Jun 2023 22:39:21 +0000 (UTC)
Subject: Re: [GIT PULL 5/5] ARM: SoC changes for 6.5
From: pr-tracker-bot@kernel.org
In-Reply-To: <7393ae1d-66a3-40a3-adcb-347c0fafa6a6@app.fastmail.com>
References: <80fba92e-3836-4d27-8be6-1e5f7b5b2f53@app.fastmail.com> <7393ae1d-66a3-40a3-adcb-347c0fafa6a6@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <7393ae1d-66a3-40a3-adcb-347c0fafa6a6@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.5
X-PR-Tracked-Commit-Id: c1d57ee6eb99699f5ccd92fc6e8c5a79103dcaae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bf1fa6f15553df04f2bdd06190ccd5f388ab0777
Message-Id: <168807836150.26000.7414939213734844467.pr-tracker-bot@kernel.org>
Date: Thu, 29 Jun 2023 22:39:21 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Thu, 29 Jun 2023 17:23:28 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bf1fa6f15553df04f2bdd06190ccd5f388ab0777

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
