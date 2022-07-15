Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4357BC43334
	for <soc@archiver.kernel.org>; Fri, 15 Jul 2022 17:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0621CC341C0; Fri, 15 Jul 2022 17:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3F5AC34115;
	Fri, 15 Jul 2022 17:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657907127;
	bh=EcnY49XBSQe4RSeS7Q+T2gkwKVZ+a+ECFq/Rk4OsCog=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=heT8tYwUFYbiqTwBOlWAbXvXMQ5OmV52MpflfWwpybKiMND96oeGuEM9Ao5jG5NvT
	 XlbJkIxWX7AhGipPYsYAbMro0mBEDfFEey0xeEBTVa0OAPR3sBjfWUUXcyPFZnFgtP
	 OXU1ATdQ7dmWhOkfMJlLsCp7nEMGIg5+bWXvZYEOF/GxP6/TTo2rbCk3/psJ65gjRI
	 gfml5Bzdle2kGV3u2KZZfDO5qJpnhQzQeE9uLHxmeD6CQSt075hRv1teIodL6kh+dH
	 criJs6iyosvbTnBx/9nlxoXWqUe6mduaONCBUU9ejJ4oCDpK9sngKCBn3W7kff+5Fo
	 YxBT3BS5Qo2Ew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C348AE4521F;
	Fri, 15 Jul 2022 17:45:27 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.19, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a3jSNJfJxkbqJ4Bfa0bkhNsF0CY+bGJMGKJOaFPm_Me5A@mail.gmail.com>
References: <CAK8P3a3jSNJfJxkbqJ4Bfa0bkhNsF0CY+bGJMGKJOaFPm_Me5A@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a3jSNJfJxkbqJ4Bfa0bkhNsF0CY+bGJMGKJOaFPm_Me5A@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.19-3
X-PR-Tracked-Commit-Id: d332a1f6b4c4b07bf984f04df897818c7c7fce8f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1c49f281c9b78da9c0f0d7a8965c26fb46e71a53
Message-Id: <165790712779.27298.16760479369057167245.pr-tracker-bot@kernel.org>
Date: Fri, 15 Jul 2022 17:45:27 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>

The pull request you sent on Fri, 15 Jul 2022 14:28:51 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.19-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1c49f281c9b78da9c0f0d7a8965c26fb46e71a53

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
