Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70824C19F29
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E2D0C43470; Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18137C433D7;
	Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659458347;
	bh=TIbagAgKEK+NCh/PJczxWR+yskWC7PMOhN5LlJIgxWY=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=cZ5Y17Dz2Bd8DFkcLUdMpq+0LBfmkYfPlChuiBHyoWbRR47l4LuAxJI+VthkPnb/n
	 kx7z8HLdrEuQVYArrrray+PEVy/NZT5JgqNdfIXkrgLn4wmKFXRMfoNBSdnZBDbWLi
	 pOLFDShOh9t6lHEUI7X/J2ZJyBco+yg5pqGpwUUaQar4jxHPZT3N39+rtXq9Qm6g2D
	 m0jt/GquOwdFscdAmkX/JMI1OH1iiVb+75qgRVRAWpAkKUz0ilZfSg8mpR99klvXHp
	 0seWA2K3lPMtRY0XTg+8TdsPF2/ULRbP38g+eIsg5D9C85J8TBiLOG6CoBVPWCJlk2
	 3P6z8PIDt6SmQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ECB33C43143;
	Tue,  2 Aug 2022 16:39:06 +0000 (UTC)
Subject: Re: [GIT PULL 4/6] ARM: SoC defconfig updates for 5.20
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2VY8n16XU6+dxxGPSO0gkCwd8JiMj-g_8g-cG4ayWcyA@mail.gmail.com>
References: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com> <CAK8P3a2VY8n16XU6+dxxGPSO0gkCwd8JiMj-g_8g-cG4ayWcyA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a2VY8n16XU6+dxxGPSO0gkCwd8JiMj-g_8g-cG4ayWcyA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-5.20
X-PR-Tracked-Commit-Id: c95a5712beee635c4626f78218e52b978f075a17
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3a829d267e10812e3b2c2d656ba9fdc117ea6579
Message-Id: <165945834696.26510.4813587390738921717.pr-tracker-bot@kernel.org>
Date: Tue, 02 Aug 2022 16:39:06 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Fri, 29 Jul 2022 00:32:42 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-5.20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3a829d267e10812e3b2c2d656ba9fdc117ea6579

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
