Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0257C07E9E
	for <soc@archiver.kernel.org>; Sat, 10 Jul 2021 17:35:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AF54061375; Sat, 10 Jul 2021 17:35:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 978D661283;
	Sat, 10 Jul 2021 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625938540;
	bh=HvOYTSWxLcF9VlsCX/AqAdVAD3GBQoHcRQFRUbkwZPo=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=AfE/3F/JasM4SsxcQYh1cxHJibZcWmWpX/8bZW1Y71QOmAWqPObdh+RCTSodAu5G+
	 DmBTApiArDO3PiXHBgVAfN444/Ik1oBT5YbavLuEUUnsWSeq3UgZTxMrzeomuVOR4N
	 vMow073qepCar0+AbRMRHmQy6pn7p/krbvyN0le958D2EaiVA3jni6H2SnZ28+hL8P
	 KTCfJgcKc3xOcD27MHHlDIi54apZLjB3Qq4fe7KlF6VAnWY7ICXMZD4lHTISID+vfd
	 uqZ9IYCUvtXQlchyg8qA+zMoqKcngwWQ1ti2YD7PkVxmHMKbXdYAqk7JX84bV06J2n
	 Qflpr67ssEwkQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 90A8E609F6;
	Sat, 10 Jul 2021 17:35:40 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] ARM: Defconfig changes for 5.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210709234054.10288-4-olof@lixom.net>
References: <20210709234054.10288-1-olof@lixom.net> <20210709234054.10288-4-olof@lixom.net>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <20210709234054.10288-4-olof@lixom.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-5.14
X-PR-Tracked-Commit-Id: e6adbcb7e2d71b0e0e0deb6f904783aeb79728be
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: af4cf6a5689a9ecc21722cb2bb6220dcaee89c6e
Message-Id: <162593854058.16773.7687792762561923860.pr-tracker-bot@kernel.org>
Date: Sat, 10 Jul 2021 17:35:40 +0000
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: torvalds@linux-foundation.org, arm@kernel.org, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>

The pull request you sent on Fri,  9 Jul 2021 16:40:54 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/af4cf6a5689a9ecc21722cb2bb6220dcaee89c6e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
