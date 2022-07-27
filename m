Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2637CC19F2B
	for <soc@archiver.kernel.org>; Wed, 27 Jul 2022 17:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0AEF7C43143; Wed, 27 Jul 2022 17:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E92F3C43141;
	Wed, 27 Jul 2022 17:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658941225;
	bh=sfBgyVHZLW8y9aTxKgdpcUIkxChoFCjLxO3JefukrTo=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=QJmDGnRM8DUMLrFrncIGwfliM7sPlOjMMYAAB5X5kiBsdlmY94zAKaZQJ9LD40wZK
	 jkCwVgt5/qr+EBriqvHAz49TJdqX5hFdZazYmSWlUPtlR/+wuE9XtaCnC6FJchJMgF
	 JkvUN3w/rVW8Bx/8T2Or+cB6pAJO9BpwwC2/Ub4ufXvRYg2p+av4GC9/CrhA3o7HVJ
	 uzkPqCKzos8x2cSstAk7XgTehq5lzmb8fjc9qAaf3LnDZvjx5YadTx+vsaCpFffqA+
	 TFmrqROAx28sMBnJ3dGZ1UlO/Ty4BybNfvTnAYov9sME8f/vlLi3c5ySdONCXZnvVI
	 ce0Nr+wrP8UWQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D142AC43142;
	Wed, 27 Jul 2022 17:00:25 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.19, part 4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a3PK8+V7N2rNiD2VvygUwtJmY1rs1JCAGiUeDsQB6=f1A@mail.gmail.com>
References: <CAK8P3a3PK8+V7N2rNiD2VvygUwtJmY1rs1JCAGiUeDsQB6=f1A@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a3PK8+V7N2rNiD2VvygUwtJmY1rs1JCAGiUeDsQB6=f1A@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.19-4
X-PR-Tracked-Commit-Id: c5cdb9286913aa5a5ebb81bcca0c17df3b0e2c79
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9d8a8616ee47f478a9f78ab97f55c3fbf71bb5f0
Message-Id: <165894122583.29306.13120194394644612066.pr-tracker-bot@kernel.org>
Date: Wed, 27 Jul 2022 17:00:25 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Wed, 27 Jul 2022 17:21:00 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.19-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9d8a8616ee47f478a9f78ab97f55c3fbf71bb5f0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
