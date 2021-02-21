Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E50C433DB
	for <soc@archiver.kernel.org>; Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 108B964EF2; Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E32AD64EF3;
	Sun, 21 Feb 2021 02:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613876250;
	bh=Hwcj8LZbyiz0grrU4mcpvl9yU3r3TOk6MqPlh6I3nSA=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=l/5wdsLjONT945eXi33ZH9P50DHPq+DnrJurybqW1xHRArqY4JT7tf9ifwQ26tRmC
	 pV1cdpaEwrmIhUNZjb+MbMQ9pF1JFmlbheVUrRah2+jFl235I3aBuXm9PgOjUzhQ07
	 jsnYLwx0Pu8JyhdpX8t89rYcteUO+WltObehjpYzfFASesIhVuvpiovI0B5s1aJJ6K
	 FQCe/d8O1OhvrokZl7LBLL8xWMqTjV6d4L6xkYSPMEDiOOijrEiFpfnvtZsBmiOb+2
	 uRRlqu4JG70iLNk9+9Y0UfHkprsXudifm6dniC+i/yJZ4+821HElUSjJKIZh6CWGsB
	 AzQLX3kWLXgcQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DBE2760A50;
	Sun, 21 Feb 2021 02:57:30 +0000 (UTC)
Subject: Re: [GIT PULL 1/6] ARM SoC bugfixes for v5.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a3sKFzGMZhX_PLSFTVDk9bXgvOhKb98cBAqC33+49n7TQ@mail.gmail.com>
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com> <CAK8P3a3sKFzGMZhX_PLSFTVDk9bXgvOhKb98cBAqC33+49n7TQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a3sKFzGMZhX_PLSFTVDk9bXgvOhKb98cBAqC33+49n7TQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-v5.12
X-PR-Tracked-Commit-Id: 090e502e4e63c608ef8497d295feeb9743ef67b7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7ddfe9a6a3b323c96ceddbdbb92debb9611e32c0
Message-Id: <161387625089.20427.14712302245933297030.pr-tracker-bot@kernel.org>
Date: Sun, 21 Feb 2021 02:57:30 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Sun, 14 Feb 2021 23:41:20 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7ddfe9a6a3b323c96ceddbdbb92debb9611e32c0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
