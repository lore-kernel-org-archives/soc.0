Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA4AC433E0
	for <soc@archiver.kernel.org>; Thu, 28 Jan 2021 18:16:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E585464E21; Thu, 28 Jan 2021 18:16:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CD44964E0E;
	Thu, 28 Jan 2021 18:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611857813;
	bh=aSAdEmxoax5vPvdLbJz+b+C7Xg7zNbyTjWEf3znnDAE=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=M+EW73sCgf/aSCm4bnyn2v5Uuq49pX4WhR1yj8W1h1QgUsY5u8tjImo0ksjGSdYLT
	 r/fZTFXbunpn315hPheGqdJszOl/OzxjemJ95GX7lIhifhuiMZA9c/8jEFAXvHWXwF
	 HAss6l5e4TGbnday0EVnwWzMdd9H4gKFVxlQmV7/+V5K6JotFULpehfI+AL8wCeCAw
	 pwQWGwHuUTWZ4U+amT9961wEj2QrCwbb1lFk0YTFalANZHrnHg0u8+6aAKXeqjvqZb
	 46DZ5uZgSBD7BijpFo75disrwPaET+agB0TL4k9g0xTm9iZ+Xt8UwNtVQ0gfoBq3l6
	 SX8WektR3W9NQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C5F5160077;
	Thu, 28 Jan 2021 18:16:53 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.11, #2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2Ku8ummmKWSZZ+kUHxVxvqGnoB4YSTLj9zo4ntkDO3UQ@mail.gmail.com>
References: <CAK8P3a2Ku8ummmKWSZZ+kUHxVxvqGnoB4YSTLj9zo4ntkDO3UQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2Ku8ummmKWSZZ+kUHxVxvqGnoB4YSTLj9zo4ntkDO3UQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-v5.11-2
X-PR-Tracked-Commit-Id: e49c24c8cd00ea9d7471520fff562fb4e7e9f61a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7485e08eec4c84b2e140aed5fccc36b6846789ec
Message-Id: <161185781380.19532.3901554449864546513.pr-tracker-bot@kernel.org>
Date: Thu, 28 Jan 2021 18:16:53 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>

The pull request you sent on Thu, 28 Jan 2021 16:32:08 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-v5.11-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7485e08eec4c84b2e140aed5fccc36b6846789ec

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
