Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7B7C433EF
	for <soc@archiver.kernel.org>; Thu, 10 Mar 2022 19:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3430AC340EC; Thu, 10 Mar 2022 19:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 191E1C340E9;
	Thu, 10 Mar 2022 19:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646942193;
	bh=vW5R15R9kFZSldrmLT+3F9VyrutW8BoDZxEwIXeXdro=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=Cc9xQh/mK6QmEFXYn6/tfZIIMDKzfBLzjV+onlXbOKXBs2xwL5WioZj64w3A7FmnE
	 RlA7dFuVNKMTT7gyumavwrR6RAlLnNK4aJFH4vqDTql8Yey8vVd7BcQAMqhGatsKak
	 Xe4/cwglk88iUnkDERrMQYXCEHzt47z+Pe8VVLFfNAsVx7EsZ8LPIvGf/GpmFUwjQw
	 mVgY6uxE1P+CWVqXbw4A4JvfcVDYW6j+ACnMzXhADuQIykunIHJZ+cGpqt80eAg00S
	 W+dELBPjgAh3OKaVkZiwFt86cM8Ro12Jn1KE/3SuZEivBbDsuo99TNlKhO2B+XFDwP
	 3urCHlHKU70nw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 066E7E8DD5B;
	Thu, 10 Mar 2022 19:56:33 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.17, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2pdq=68wt9ttMa67qU+YkBaUshdVSaNN8XJ3TPXJN7iQ@mail.gmail.com>
References: <CAK8P3a2pdq=68wt9ttMa67qU+YkBaUshdVSaNN8XJ3TPXJN7iQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2pdq=68wt9ttMa67qU+YkBaUshdVSaNN8XJ3TPXJN7iQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-5.17-3
X-PR-Tracked-Commit-Id: 7e606edaa0a2e443fba9ae324efc1ba7834a0e7d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 55b4083b44361d833c93216a619d3b4e6d03a0c9
Message-Id: <164694219301.7413.10043381408589933126.pr-tracker-bot@kernel.org>
Date: Thu, 10 Mar 2022 19:56:33 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Robert Foss <robert.foss@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>

The pull request you sent on Thu, 10 Mar 2022 15:53:49 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-5.17-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/55b4083b44361d833c93216a619d3b4e6d03a0c9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
