Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E457C4338F
	for <soc@archiver.kernel.org>; Thu, 19 Aug 2021 22:45:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1028160C41; Thu, 19 Aug 2021 22:45:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id ED0CC610A5;
	Thu, 19 Aug 2021 22:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629413100;
	bh=sTP+3YYUW5Fq/Au+ajlFUA0Kn+cpkMAhnUJ9aRe354Y=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=AJAkZysgYdSc+6LeJiGf11xiGI+Oszhs7oE2Zt/xvoJypagigMvqz9pHXY3W2dq+2
	 6Q/QJpsqwJh2pM1NfTgHGtGTfrkL3+sAbsrQMYqHqsQ9WpYvaerEK3ycZCU5H3pZet
	 B9Pc9ldgDG7Pjka7tjlcdzDazIySWZCU/b59i71fkufdCF3vl0hFKyLNKFLutdCQjG
	 Y+m5MGBJjg6y1fumEhZZaKPx0aoInS9Jw7OJp5xNvu/++RBBZn+4xNWQ08dWVx6Icx
	 ittP7J+DTra1+bHzHYm5F0Vc9kFkyz5jYYobWbLYhiVmivb+z6/YN09tAKcZfVkwqm
	 98ToDGIiaXUNg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D79D660A2E;
	Thu, 19 Aug 2021 22:44:59 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.14, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a12+R4qpANkd4MWHa8YNNhXf0wNnN+GaWk4DqW3NJ+DQQ@mail.gmail.com>
References: <CAK8P3a12+R4qpANkd4MWHa8YNNhXf0wNnN+GaWk4DqW3NJ+DQQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a12+R4qpANkd4MWHa8YNNhXf0wNnN+GaWk4DqW3NJ+DQQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.14-3
X-PR-Tracked-Commit-Id: 1e16a40211208d2d6e217e5013607219f4272dff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d992fe5318d8d7af9510b879439a3c7f283da442
Message-Id: <162941309981.30040.17491472610869566678.pr-tracker-bot@kernel.org>
Date: Thu, 19 Aug 2021 22:44:59 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Thu, 19 Aug 2021 23:47:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.14-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d992fe5318d8d7af9510b879439a3c7f283da442

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
