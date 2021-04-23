Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FFCC433ED
	for <soc@archiver.kernel.org>; Fri, 23 Apr 2021 20:02:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9211A61450; Fri, 23 Apr 2021 20:02:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7719C6144A;
	Fri, 23 Apr 2021 20:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619208175;
	bh=UDBT2Ynm3NyAVA8IxFGJy4Vy8RfkMzkwinF69rijv/Q=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=NWfQW0BqqJuv7AD5OT6PQQePULQNIaFNloBmZBzuYo1JvuZUV/T1LN6wqZXdV1/WN
	 bBx5eBQjNrfaeHaVUq6eaChobfmFnV8ZbJaK6Hm/IpDjF/oS6NjEuYVq86KZoyagla
	 Xx9DRwX0CHam2undKSHcMfpa5kWh7QBurQl66UFy+TKYtOid+8oHrAgyLTUu1LTiUM
	 UuTsoHm38cHQQuCAfNX1SrUinOgmXQFw1g6KaTPV/mE2fgG6FnQdeVX6b5Dtrl0Lo5
	 zxjLzV3gFlxbBHY4w04u+hqyv5FdaUmn8CDOxkc7jeCKb9T0cwrQQ1gxt/v1FifeWb
	 +Zf4U2YwsS8Lg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6C78260A52;
	Fri, 23 Apr 2021 20:02:55 +0000 (UTC)
Subject: Re: [GIT PULL] ARM SoC fixes for v5.12, part 4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a20H54BCzzEtZEq2CXx57e1xeyzxf_uHq+OEMgKQvaC7g@mail.gmail.com>
References: <CAK8P3a20H54BCzzEtZEq2CXx57e1xeyzxf_uHq+OEMgKQvaC7g@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a20H54BCzzEtZEq2CXx57e1xeyzxf_uHq+OEMgKQvaC7g@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
X-PR-Tracked-Commit-Id: a1768dad775b5ceb25d17bc7a13318f43adf3069
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6d1d45cb98347dbd101b378d11b5f0deb87b345d
Message-Id: <161920817538.27381.9976776143787988171.pr-tracker-bot@kernel.org>
Date: Fri, 23 Apr 2021 20:02:55 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <mripard@kernel.org>

The pull request you sent on Fri, 23 Apr 2021 21:55:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6d1d45cb98347dbd101b378d11b5f0deb87b345d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
