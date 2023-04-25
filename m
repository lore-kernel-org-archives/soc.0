Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59846C77B73
	for <soc@archiver.kernel.org>; Tue, 25 Apr 2023 19:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F928C433A4; Tue, 25 Apr 2023 19:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19434C433A0;
	Tue, 25 Apr 2023 19:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682450763;
	bh=KCDfFiGMhzVJzDCLAJH84UgkJ+pnVki0K0y/rDbm9sQ=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=msuVvfdfbaLgxZOeUDIcfavBXwFQ6fZmoxW75VvXPJkofWXw3v5nTiKMfA+cAYV80
	 hmDtWh7fCpuhaD1SdE0zlM4IbNVyhXL0rgupPdZqZyE3h2jvsWUYgYb0+0zSnz2H8V
	 OOiuCGqMVTUNChpPLJ1lT/oay/LPHGvLoE1+lLb6Hlt5CundYFqr2Cuf/AQy1w912F
	 aTte8GGihPxK6qoW6eMnql2fGRfVypnnkCfD+IMwXhpAr1Nm5UEWrii+neS+s0CQA/
	 rUpsIkvaEYJi4LFBrgOMID7Oxu3DcIC4dmIvYWXQhnWkd02IQZj0Eecc4uadebeEQo
	 CjtAGYl6oarOA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 01044E5FFC5;
	Tue, 25 Apr 2023 19:26:03 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] ARM: SoC defconfig updates for 6.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <01f461fa-e2b8-4e69-a7a3-94db842b2f72@app.fastmail.com>
References: <bbd25997-173e-4c3b-930c-65c6232908e3@app.fastmail.com> <01f461fa-e2b8-4e69-a7a3-94db842b2f72@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <01f461fa-e2b8-4e69-a7a3-94db842b2f72@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.4
X-PR-Tracked-Commit-Id: 2c25b94f881cf9389001cc08b1232a8099b3f8bf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 672d2dae19012cb2c40fdf36711ee3b5f5420724
Message-Id: <168245076300.1749.7338808536116485218.pr-tracker-bot@kernel.org>
Date: Tue, 25 Apr 2023 19:26:03 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Mon, 24 Apr 2023 23:00:56 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/672d2dae19012cb2c40fdf36711ee3b5f5420724

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
