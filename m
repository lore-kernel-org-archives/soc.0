Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DB5CD3422
	for <soc@archiver.kernel.org>; Sat, 31 Aug 2024 19:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 527F2C4CEC0; Sat, 31 Aug 2024 19:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B33C4CEC8;
	Sat, 31 Aug 2024 19:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725131638;
	bh=U6T7mw1d4OGGfnaoEfzpw2v28SOTPVl5mQaHULrTzPA=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=r1r3Rv0R8G003aS9kDdGn28HV0AqNG28f4jAM+xxAf+caHkeWcs/j28FCa8j5KWMp
	 aIji8PITGZEozd6UR0ss4PpUOHvaZrF6LAFggU7K0uKAW0Pz9LNltzrwq7CFHM+RmO
	 rZYTXM1Rxw2WQKGMdXEM12ckcjz9616MKAfNjWXnRfA85YV5G1xZXaKhTUQr41KH0l
	 NtnqLqNKRx15LiJVHKRAJ01oCrl4+FgjGERawsJLAWsJOzKbrvTEu6NiQFTdWmm4Sq
	 qT9/enn4COu9SfRZPSBeD+RG21Jq5jkIUXKfED3R4c1t9FmnymQXQHhPZO339NI71N
	 5I5Nf1pZiLirA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEC53809A80;
	Sat, 31 Aug 2024 19:13:59 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.11, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <a0cf5f32-3250-48de-bc04-445ae1459b0c@app.fastmail.com>
References: <a0cf5f32-3250-48de-bc04-445ae1459b0c@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <a0cf5f32-3250-48de-bc04-445ae1459b0c@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.11-2
X-PR-Tracked-Commit-Id: 9cc7b1705141d1a077493dc107ed626e8dc84681
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 35667a2969d80a08b1df4066cbf282fc5d875cc4
Message-Id: <172513163846.2915779.8366939144023883866.pr-tracker-bot@kernel.org>
Date: Sat, 31 Aug 2024 19:13:58 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Sat, 31 Aug 2024 10:03:51 +0000:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.11-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/35667a2969d80a08b1df4066cbf282fc5d875cc4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
