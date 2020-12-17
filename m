Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF346C4361B
	for <soc@archiver.kernel.org>; Thu, 17 Dec 2020 00:57:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B51362376F; Thu, 17 Dec 2020 00:57:16 +0000 (UTC)
Subject: Re: [GIT PULL 1/5] ARM: SoC updates for 5.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608166636;
	bh=yCjFiOouycpbFyB/zyc0w1uubea5LFk7ZQhDekiTZnY=;
	h=From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=kQYStM2CxF5Hx+6HWgHBGE/0GtGTEJM8jtI/YlsG83v1GKztwfIsNWJzMNFOMx22+
	 8XMBssyYN3BeK0t4MSm6rFYAe8A1ZwhbDgIhj+9Q6589zqfIFkrSfIwnbXD9Rpnpc7
	 6l/YWZw7oIUujKIEPCQYtpHFQcx2G4O7fEE2UEJJeIyNZMw+wMvGgLsjQJ1uz9B4e+
	 scdI/14RTG3/ONO8WSBqptg4g/KEcaAtDabfyrk6op9O14x/YHBoVrZViN4PkZTW6Z
	 Wn1l61oVxTDLpjtd60WNT2BdULekIdv/qva4GB+BtXc1i0eO6z8Alu2zsiqmzOE2W3
	 t1WsdlopOcuxw==
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
References: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.11
X-PR-Tracked-Commit-Id: dcb11100cd5d3f5a191b7fba75422e3df792f3ff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b06db0b3936956352a6ff693ea589bd4671c071d
Message-Id: <160816663648.8160.17970877466719452935.pr-tracker-bot@kernel.org>
Date: Thu, 17 Dec 2020 00:57:16 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Thu, 17 Dec 2020 00:22:29 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b06db0b3936956352a6ff693ea589bd4671c071d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
