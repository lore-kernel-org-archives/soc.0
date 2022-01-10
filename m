Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1685BC433F5
	for <soc@archiver.kernel.org>; Mon, 10 Jan 2022 18:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 00FFFC36AFA; Mon, 10 Jan 2022 18:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF3C1C36AF7;
	Mon, 10 Jan 2022 18:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641839282;
	bh=VCMswOHln0RsvXDijPneODwGrnXN2UMpizmaOT4AYCw=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=qRdPGnmJla4/OqBFROQyUrzUEnrpyciVgc8OocMT7rjvhPbBZIlD75Z+etrEu2Mch
	 regYWpIPQQ3NttNrrz/v1TgzVQos8O980DwIUy9CfxRm3WHSkIv/YpDYjE0/lTdsJa
	 53I1iKbTdMuba4uOYf6zwLDbEACyk5/hpeiNTapOh2hlhq1OtrfZ43/XF87Y97zwAV
	 IWxuEuYtvGWHIaCPAdyaQdiG0hue/YfaU8ijShjP15I5FVIt6xKQvDanxMaUGVPhVW
	 JaL7+5kjK7LzYWXkpPhyrWkEJvCR9Vb7ZJJHcdT0d+WOaGyjdPOJvarr7r5XMqi9lv
	 C0E7a2UQLb4uA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CE538F6078B;
	Mon, 10 Jan 2022 18:28:02 +0000 (UTC)
Subject: Re: [GIT PULL 3/5] ARM: SoC driver updates for v5.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2WjTojdOwr-k6HHQuBXMHU-2wRC3rQacQx8SL6W2cK-g@mail.gmail.com>
References: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com> <CAK8P3a2WjTojdOwr-k6HHQuBXMHU-2wRC3rQacQx8SL6W2cK-g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a2WjTojdOwr-k6HHQuBXMHU-2wRC3rQacQx8SL6W2cK-g@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/drivers-5.17
X-PR-Tracked-Commit-Id: 13ee75c7b57c546f7973984d9a87cfa7d73cbf5c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e85195d5bf8979f6db3f12cf8f1294887bf6b037
Message-Id: <164183928284.9673.17371954660531165425.pr-tracker-bot@kernel.org>
Date: Mon, 10 Jan 2022 18:28:02 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Thu, 23 Dec 2021 22:34:17 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/drivers-5.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e85195d5bf8979f6db3f12cf8f1294887bf6b037

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
