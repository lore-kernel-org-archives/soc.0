Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD196C433FE
	for <soc@archiver.kernel.org>; Mon, 10 Jan 2022 18:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1059C36AEF; Mon, 10 Jan 2022 18:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA3BEC36AE9;
	Mon, 10 Jan 2022 18:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641839282;
	bh=nRfW1oo6OJ6FNqiRiUOdlBGT0axRuW5JZwZFDEjB8Bw=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=HI1xwGpVqJocICrGh/9q5CSp+ci678/rbSQgO2huzjUT7/hxay5jRMwe3Kwwct6Hf
	 0HsxHGiQabjwH/ofgcwN78VKVb9/zmdY4uoMv7UGnCGGWPDwAEyZ5Pv5jc/SUZN1Vr
	 ksrh5mEM4bNgwb8YkHzVe387GxH1v9iJymaimq5VG3k/sdO/XiD3yM0HkeuEzzA0mb
	 +j8wu5UB7Lcc8Yv1Fo7yrs2iKgsS4u17BLm9Dqvz7NqAXG8TYeir0wOOYlFPscFL6V
	 ST733c/0NkQJkvEflzYruYpRvQ9GvLOVtuEPEEhYrocu4yBgJT6rsMA5akQw1hyKsz
	 oYmO49GUSjZ3Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 98DD5F6078B;
	Mon, 10 Jan 2022 18:28:02 +0000 (UTC)
Subject: Re: [GIT PULL 1/5] ARM: SoC updates for v5.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2u88x0USAVHe6YeNCbLV6pvOPytHs4Bo4ma1avsq+ojA@mail.gmail.com>
References: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com> <CAK8P3a2u88x0USAVHe6YeNCbLV6pvOPytHs4Bo4ma1avsq+ojA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a2u88x0USAVHe6YeNCbLV6pvOPytHs4Bo4ma1avsq+ojA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-5.17
X-PR-Tracked-Commit-Id: fe47ec5fa8ec223691f280bb8395fdc79548ecd4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1135ec008ef3745cd1cee5bc543cfe48427c22a9
Message-Id: <164183928261.9673.8780484435703411702.pr-tracker-bot@kernel.org>
Date: Mon, 10 Jan 2022 18:28:02 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Thu, 23 Dec 2021 22:32:44 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-5.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1135ec008ef3745cd1cee5bc543cfe48427c22a9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
