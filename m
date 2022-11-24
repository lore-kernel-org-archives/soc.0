Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E60C43219
	for <soc@archiver.kernel.org>; Thu, 24 Nov 2022 19:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8CDADC433C1; Thu, 24 Nov 2022 19:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FD07C433D6;
	Thu, 24 Nov 2022 19:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669317397;
	bh=oR1QCrY9ZNvGHR3oaPp04dPur9ttcwO+C342p9ct/ww=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=Wh5kQT7rkWwWRx9xxU35j0sVDteL+gNH+rJINF20YAltLJ26sIxMoYZmn33UqahIP
	 Un+9JP7GVffToz70+sBHy1twCXUK6OxxYMDUqjWfosaI1K20D3oPaO0EE6VDoQ5lod
	 e47UurCvKLmK5LPQuwG1iyYiN2QQGYH2ifNjU9+jiu+/kg3Hh94xWUChdbnR58jSwC
	 jjHwPsyETtX0xVMgdDKFV6i92g+iMYI4qE1wBIcW/CmiLSlNTF1cPBr/iX4IdcFUxs
	 dH0gDTkY9PAD1kCc8ISHmrQYSoNdM0kaAndy0fNqdeQZLkJHm1HkwSIlbY9m9oHf1P
	 krMmLYgTKpQ1Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5D145E21EFD;
	Thu, 24 Nov 2022 19:16:37 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.1, part 4
From: pr-tracker-bot@kernel.org
In-Reply-To: <27634f1b-1092-4d83-b0f1-af19e41c7027@app.fastmail.com>
References: <27634f1b-1092-4d83-b0f1-af19e41c7027@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <27634f1b-1092-4d83-b0f1-af19e41c7027@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.1-4
X-PR-Tracked-Commit-Id: b10dbd6fbd7d097afa1ffa5f94a74b355a4e4743
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cd89db60e22824b82f9458753fa6cb770cca8bde
Message-Id: <166931739737.15670.12344684477759366557.pr-tracker-bot@kernel.org>
Date: Thu, 24 Nov 2022 19:16:37 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@kernel.org, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>

The pull request you sent on Thu, 24 Nov 2022 16:21:43 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.1-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cd89db60e22824b82f9458753fa6cb770cca8bde

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
