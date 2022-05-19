Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67ECAC433FE
	for <soc@archiver.kernel.org>; Thu, 19 May 2022 00:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31437C34113; Thu, 19 May 2022 00:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A4BCC385A9;
	Thu, 19 May 2022 00:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652920527;
	bh=858fXFgqX2YP3/fcfqt8/e3wggvM4acEGY4CE9Xm2R8=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=QIyUwJFbBU0GwMg/CiQcC/6CUrWBt65K8r5fWEF5052F77SkorGZBA3aUSIeIG4O0
	 9YEkqa6pAA680LxspAnhMWqNX/dpLvajYCtSLN4wffqnQR0UvXoETTeir36XJ1yDN7
	 ebF/ijNiYCdsft9B2wRxlnD2BY81egTUmciVbezjWvJfvCKLu6tTfoLLIJBZel2PSP
	 v1fFdnCWITXNdDPBAwEDBJG/+Q6hQxYEq9IL/CvQQOuRON40/P6yrkt6jvZRYE5BGw
	 G7PpcygO+tHyUf7x6+LowgvYZQFerDKrRSAzgPRE0oazZ0uBEm+4fguBJgY6HauolJ
	 vq/AwCVNdFNpQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F0106F0383D;
	Thu, 19 May 2022 00:35:26 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.18, part 4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a3V3voFgDz+yQji9PpVNs=QOj8MEtdaFf1U3JrLSG6SmQ@mail.gmail.com>
References: <CAK8P3a3V3voFgDz+yQji9PpVNs=QOj8MEtdaFf1U3JrLSG6SmQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a3V3voFgDz+yQji9PpVNs=QOj8MEtdaFf1U3JrLSG6SmQ@mail.gmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/fixes
X-PR-Tracked-Commit-Id: 609a097f5f0687539490625523ec3075b7d404b8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5494d0eb438a656c89792ac8cd0cdb963576bdda
Message-Id: <165292052697.29647.15544476514581636018.pr-tracker-bot@kernel.org>
Date: Thu, 19 May 2022 00:35:26 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Wed, 18 May 2022 18:19:33 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5494d0eb438a656c89792ac8cd0cdb963576bdda

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
