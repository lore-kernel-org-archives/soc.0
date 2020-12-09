Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F14C4361B
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 22:53:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F19E923B97; Wed,  9 Dec 2020 22:53:49 +0000 (UTC)
Subject: Re: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607554429;
	bh=v0W/536EuIwh5aALHFkG9IPXvhDkuTFU0QwHlbagWqE=;
	h=From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=StcjxCCb+HMfclTfuWrBEOxq0vk0XU+3trq453jLfzyozQNtqohZlQpLnRH4IXcjZ
	 NQrHiNRDcDqo+hGI2t4c4Bt12RWnukBBeZr30Ent4u4+qGuxM5kednskL3FsxhhqAC
	 gCUKfT0QPWy+QAh0QXJXmQIgBa1NOothE5jIEVIk4W5GgZXVxI8CDX6B5plYBfE0tY
	 uzJ1fUZdtUTB9+66/KmGRHq+dS3XvNLc0o46EtzUGih8HOoLWVwQQCwJD3RZXBUXwk
	 KK4Ig/yWx+ieRooaouTqB9FH6TQMDdAQEpcyUKUqKM6zElX6olhtoAJ/3zoxHWLNzc
	 K8qnC9wcpH+qw==
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2piZwSjDudPu8mOEBnRHFAXRBMcRZsqS8b6YD3Kjwsow@mail.gmail.com>
References: <CAK8P3a04h2KA6s-m_O2MJ098frTSmxvAg-ngrdP4d9=9YLXmyw@mail.gmail.com> <CAK8P3a2piZwSjDudPu8mOEBnRHFAXRBMcRZsqS8b6YD3Kjwsow@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a2piZwSjDudPu8mOEBnRHFAXRBMcRZsqS8b6YD3Kjwsow@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-v5.10-4b
X-PR-Tracked-Commit-Id: 69fe24d1d80feac4289778582cf0a15256d59baf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a2f5ea9e314ba6778f885c805c921e9362ec0420
Message-Id: <160755442971.8086.12518743666156254013.pr-tracker-bot@kernel.org>
Date: Wed, 09 Dec 2020 22:53:49 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Wed, 9 Dec 2020 23:07:10 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-v5.10-4b

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a2f5ea9e314ba6778f885c805c921e9362ec0420

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
