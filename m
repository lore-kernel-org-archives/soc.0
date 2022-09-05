Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E79ECAAA1
	for <soc@archiver.kernel.org>; Mon,  5 Sep 2022 21:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF6E3C433D6; Mon,  5 Sep 2022 21:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0558C433D7;
	Mon,  5 Sep 2022 21:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662414808;
	bh=qJmgdfGi2pfXZ/CjkRB9Tuxoz1RB8blCzzzB/0L9MQI=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=kfw56JXsG9Hj5opIZbWv6jDTZ2rNdq89BN+7q3+p0JnxMly7X96LLm6azesERCpfi
	 FaWHlqenQw0RmHwaOTrJFeSmP3uHafpj+z/HGDcmtywFa1r0Q3EwRLzre9cl2kJCoD
	 EmBz+fFw/PqbGM4B462pRwIMOdIxaXGltg41VBI5G1/0nfFrAF4ZJNIkdJkOt2oJSV
	 VN0zJ5nZ01ycW+jmRqhZ9V7EM5FceJSkixFeXJUTNT+IKheKxuBSjFatO2SCa4exfK
	 0cjDizbKeFWhZbeXaRtM9qQpgPJ/F3LXRUIAhLW/8h0i21KgYEO/9nuFJvVqX6yIvY
	 NipNjSF+bD0Ng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C31EC73FE0;
	Mon,  5 Sep 2022 21:53:28 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <d518e7f7-ea7a-4bff-aa8c-7786bed62d69@www.fastmail.com>
References: <d518e7f7-ea7a-4bff-aa8c-7786bed62d69@www.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <d518e7f7-ea7a-4bff-aa8c-7786bed62d69@www.fastmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.0-rc4
X-PR-Tracked-Commit-Id: 12f09234bde51810b3f7412b2b5c84af4c07cfb1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 53e99dcff61e1523ec1c3628b2d564ba15d32eb7
Message-Id: <166241480856.25048.8253334627519028502.pr-tracker-bot@kernel.org>
Date: Mon, 05 Sep 2022 21:53:28 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Mon, 05 Sep 2022 18:21:03 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.0-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/53e99dcff61e1523ec1c3628b2d564ba15d32eb7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
