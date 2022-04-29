Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399ACC433F5
	for <soc@archiver.kernel.org>; Fri, 29 Apr 2022 23:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CCEA2C385B3; Fri, 29 Apr 2022 23:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F6C4C385B0;
	Fri, 29 Apr 2022 23:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651274978;
	bh=vzGQRgANKXAWtGxFH+NeyBFs6v4a7WgOPCewlzH7n1I=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=pZtk7QCtmFdDROtVtc+XAGuPKfJRqUEQQUDmxf4dRZ47k2EbNdrxlIYqnCtSLzZFu
	 cYTWTBr+WqR+EKn5u3vgTgk+0gQhie7KWV8WpsiPHPxce+zrKqBtQu4hUGRsOoI6+8
	 TCC6eO1Kg7t/lU46d5YWfSjnpnwKjUlGd6oiWOy3IYqh81pFJd63K9p1aQTRC+IKbc
	 OZWCZspQLRODafYMSJt9ix07F450le2wcQ0NdkWcQCatqznrJynNjsJmQmMY9x057a
	 He0zWSpUCkePJME+t2gwC2k/37hH9s4i1XlRKSk50YMfhW/Ey9lqB7RmqOjR24L1GQ
	 Zn1Zm0L59HOZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8BFFEE8DBDA;
	Fri, 29 Apr 2022 23:29:38 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.18, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2fFzrMJJZqiN7B1HnwKcCgPzbobvBZzs2_L19pkM+tYw@mail.gmail.com>
References: <CAK8P3a2fFzrMJJZqiN7B1HnwKcCgPzbobvBZzs2_L19pkM+tYw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a2fFzrMJJZqiN7B1HnwKcCgPzbobvBZzs2_L19pkM+tYw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.18-3
X-PR-Tracked-Commit-Id: adee8aa22a9298148b3f86a83a7940e7a3329ad9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8013d1d3d2e33236dee13a133fba49ad55045e79
Message-Id: <165127497856.20495.11850467375293551282.pr-tracker-bot@kernel.org>
Date: Fri, 29 Apr 2022 23:29:38 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>

The pull request you sent on Fri, 29 Apr 2022 23:19:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.18-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8013d1d3d2e33236dee13a133fba49ad55045e79

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
