Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1066C3DA6E
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 00:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 739BBC433C8; Thu, 21 Dec 2023 00:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56615C433C7;
	Thu, 21 Dec 2023 00:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703118317;
	bh=vZKEV3ljhiQDc8qjSfmq9brWdBZMOVpKE+NlhMQB8t0=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=ovyaOrY5Manv+Qb7OA3JZkCwlHDw0vOtr786cVYe+nVC1F+P6C6DIZKkB2zEOMad8
	 m8RJjdWs1b4cme0wDyiB99Roka1c19wGw2uB/8N4RYEHSCiLJNuqwx0hTTVCinb5lk
	 3KY0uqicpcKVbnIdOogZJLpc8lnUSH8OqLx67PxXK72TWy5/gVq9358JWYJiarRt0H
	 ps+qXAI07LN8iEieLUznQ7NfwPZ9ochEhBJE2xcunrfU2mitJikJreLkSSZIvf4bKw
	 0FTRHGyyET41RaA+byoijYJrKloCiOPiHx3ElMalXH49PBeA8ZeV7MPDRUSOcQxn3W
	 yMykoqH9g5Wsg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3D80CDD4EE5;
	Thu, 21 Dec 2023 00:25:17 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.7, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <10ff8b28-3892-4920-b4a0-4612fe814f6d@app.fastmail.com>
References: <10ff8b28-3892-4920-b4a0-4612fe814f6d@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <10ff8b28-3892-4920-b4a0-4612fe814f6d@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.7-2
X-PR-Tracked-Commit-Id: fa3d6c7183106a187a8d399216db3f088a6aab81
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 87c71dd604e54b412db09b74cb67ebce09c57cd5
Message-Id: <170311831724.17908.9476961698840609318.pr-tracker-bot@kernel.org>
Date: Thu, 21 Dec 2023 00:25:17 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Wed, 20 Dec 2023 13:21:17 +0000:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.7-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/87c71dd604e54b412db09b74cb67ebce09c57cd5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
