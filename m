Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2481BC36000
	for <soc@archiver.kernel.org>; Tue, 17 Sep 2024 09:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E627FC4CECF; Tue, 17 Sep 2024 09:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B70C4CEC6;
	Tue, 17 Sep 2024 09:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726566484;
	bh=in0240nTWtpue0E5W9ePuFa+MTZ7JrJvOvZGw3gdGU4=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=dAnA4k528xoZo59QqQXvF4CXWid+dw3WuYXDi6tH8mwguTc0Iz0TbxjSrPJRzrt3f
	 VOEmSRZmr8SO7z7iAhAO0EHWx6zPAzwBbpeKUkG0IBWyhb00wtdB051DOZzeDhmiPD
	 4xns9R4SIg/484Gmf1ka7UNX54JZTdDJLRMe5O5cV5To5I3Ze2ZootPa7c7Zhs+jqh
	 S370+ZfVN/NiM8O/JfqnuiggjPTSnptGdvwVoRsfBg5yXZ/gF7PIuGJiToxNANNBFK
	 9KSXoNT+r1TguQiydJH4zQ2VLacEkKcuvybJdIVpTsmgDGgxv85ZXzO1Z6uuydG3Qa
	 4Pcc6Lc8yokqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE2323809A80;
	Tue, 17 Sep 2024 09:48:07 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] soc: devicetree updates for 6.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <212ba952-faee-42f8-959d-c2a8d3dc89a7@app.fastmail.com>
References: <a40b4b3a-5d61-4bef-b367-745ba058be9e@app.fastmail.com> <212ba952-faee-42f8-959d-c2a8d3dc89a7@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <212ba952-faee-42f8-959d-c2a8d3dc89a7@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.12
X-PR-Tracked-Commit-Id: 168c3e0d443599dd370710243fbf5c815fad7890
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7b17f5ebd5fc5e9275eaa5af3d0771f2a7b01bbf
Message-Id: <172656648638.78027.25795316916626812.pr-tracker-bot@kernel.org>
Date: Tue, 17 Sep 2024 09:48:06 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Mon, 16 Sep 2024 16:31:29 +0000:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7b17f5ebd5fc5e9275eaa5af3d0771f2a7b01bbf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
