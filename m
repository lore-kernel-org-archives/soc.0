Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9E9C25B07
	for <soc@archiver.kernel.org>; Fri,  5 Aug 2022 17:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7A10C433C1; Fri,  5 Aug 2022 17:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1722C433D6;
	Fri,  5 Aug 2022 17:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659721347;
	bh=rZBuFreNSi+OKBkRhDRP3Kqqu6bvNuy7r3HfkHdS+hg=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=JqV3kqRvtgor4d3i7615kCcU7m3GQrZ1erMdgbCAvpK19EHT7fX2YIc6OTGdYztsk
	 xfC1/D+cwbkJ+XFgNHBWFfM3/8fEtL85yPweFkTa+OfnFp6EGTyJNLxWvwjw3DExpW
	 3n+Rbi7Jy7by6VnO4WCiH6WQsWXOwT4aVx02t4pxksk375gWjmfChp31mJfhP1urxk
	 5GBpdpz5RokR+zOtaFeDsRS5fSb876v7X4vJwElH7EAqaEtNeWkyiY9F1wpEhXwGrd
	 1GKiGpbrnfioWnhmvSgJ10djCaIy7gerLgghQBFsbRw04Is8uER/DSrwVguk6ngDnd
	 E/unPA/ZFxh6w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AA066C43140;
	Fri,  5 Aug 2022 17:42:27 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC: late updates for 6.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a012ZLQZ4MKkheitdoV9k_eKkp3BZGxFV1COWwZr1-T9g@mail.gmail.com>
References: <CAK8P3a012ZLQZ4MKkheitdoV9k_eKkp3BZGxFV1COWwZr1-T9g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a012ZLQZ4MKkheitdoV9k_eKkp3BZGxFV1COWwZr1-T9g@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-late-6.0
X-PR-Tracked-Commit-Id: 1630eee2d4e77d8c121ab955d31befacb720bb99
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fad235ed4338749a66ddf32971d4042b9ef47f44
Message-Id: <165972134769.14838.4074823776901609747.pr-tracker-bot@kernel.org>
Date: Fri, 05 Aug 2022 17:42:27 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Fri, 5 Aug 2022 12:21:32 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-late-6.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fad235ed4338749a66ddf32971d4042b9ef47f44

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
