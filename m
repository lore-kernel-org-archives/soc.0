Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA8CC433FE
	for <soc@archiver.kernel.org>; Thu,  6 Oct 2022 19:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 889C7C433C1; Thu,  6 Oct 2022 19:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72859C43142;
	Thu,  6 Oct 2022 19:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665082822;
	bh=Prd3lLkdntCAesy3U5xzAzsDnVplTyJnnTGEizv428k=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=leH+UR7szMVcbpHc74K/QslKVYuozoFzaBglTHl5v3IV/Q18Ft2spstbaBx1vmZ6R
	 6X+pZXAvx9ATxazMiPL4VqJgDAJRUeb+glLTVab1FeCBMOoDSYNnfA2KDXlH+Jw6+9
	 j2bhGVJEnXmLj0GkU1yqu+N7p8L2AZWjmBmazqo8Vv2GDsrPLaMtk5KzcTFpOJOpcF
	 +qotlXZSSEKJNOn+z2NBqwDEUaQH2c7ScGQbSx+a5KXG0Lp7R10vnQ1xmdwGCSBmCX
	 oIJJFvuZjLfqtLx3MsfXFGrnXp++A0ui06uq+pk1n4ZIA5jK+onPwI+cOrFWcXmfu0
	 UJZnldNQVwDVw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5A5D4E43EFC;
	Thu,  6 Oct 2022 19:00:22 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] ARM: defconfig updates for 6.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <eb58dfb5-294a-4e78-922a-412e388ef813@app.fastmail.com>
References: <70d8e5d8-6fa4-496d-88d6-2604d0c3e982@app.fastmail.com> <eb58dfb5-294a-4e78-922a-412e388ef813@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <eb58dfb5-294a-4e78-922a-412e388ef813@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-6.1
X-PR-Tracked-Commit-Id: 25631f1fec2a1e1aa93811fe7af2b29d49d79874
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 40285e64c5654c956505dad34ed2ee4be163b1f0
Message-Id: <166508282235.16472.16391526793852764345.pr-tracker-bot@kernel.org>
Date: Thu, 06 Oct 2022 19:00:22 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Thu, 06 Oct 2022 11:23:09 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-6.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/40285e64c5654c956505dad34ed2ee4be163b1f0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
