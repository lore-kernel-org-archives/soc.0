Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73139C3F6B0
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54BCCC43141; Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3EBC4C4347C;
	Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659458347;
	bh=+CIKycYyYQlLTTE0uykaWFIys2tKPApxFWM/0d771CI=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=WmhJ7+GoFOTK0QMuu5fM8/gaJjJRVzMQejCPzfLShP5+QHS/OADBmL7pUOx+yzUb2
	 F0ZAFgUuaY7T2lsYndVBQoL7MByhUoqBmZZTGinXGwkYzi4J6eKgXT5+kMd3TnHNyh
	 JAxkv/tPaKicLyrHMgso8ZmpDeYYXRj8pfb8m1rM59sVgnQrJNKNN2fFyt/QHs6l1H
	 Hq9AdMRw/W5aADVkP+gfv5fgNWoTaJp3ssr6Ip0X0ZwyHrVtNQPVPuH5QlF2uD+OnO
	 B0l8JBfHm/t4Mve5B4DqFUUyEM9eqRIBAwSoC5h4sgN9yPr7kA8vRlQkE9HhVo9W3a
	 modniVFPeeCEw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2B928C43140;
	Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
Subject: Re: [GIT PULL 5/6] ARM: new SoC support for 5.20
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0qtt4t4rm7nQ51Z=gQVPyZ+MWV_Zi2Rai3xCLjBFspyQ@mail.gmail.com>
References: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com> <CAK8P3a0qtt4t4rm7nQ51Z=gQVPyZ+MWV_Zi2Rai3xCLjBFspyQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a0qtt4t4rm7nQ51Z=gQVPyZ+MWV_Zi2Rai3xCLjBFspyQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-newsoc-5.20
X-PR-Tracked-Commit-Id: bccd70a73db2061fc849928ad20a424afbaf3a45
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dd65b964922ed618a50866bd3895cf3ff646a5b9
Message-Id: <165945834717.26510.13753412054927912726.pr-tracker-bot@kernel.org>
Date: Tue, 02 Aug 2022 16:39:07 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Fri, 29 Jul 2022 00:35:00 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-newsoc-5.20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dd65b964922ed618a50866bd3895cf3ff646a5b9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
