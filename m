Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BDBC83F01
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 00:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0DBBC433CB; Thu, 31 Aug 2023 00:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 886DBC433C8;
	Thu, 31 Aug 2023 00:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693440616;
	bh=yZmGDM+7nmiJrUsWaSDK3KgayWHfJw44NO1DhzlxTIY=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=GWszlWTYIPUk4K/pHThSayfyC4cO2AWyPhRo2tzt3Kz+oxj3xFt7BXJ5UwTH4F0eE
	 FmbokQD3FPTPGxjqtuXHXp3U/gcIeKL3FzOLaWA9Y0djEDWhAYmUretKrKvFBsp79t
	 wpy+yMrSXXKumfTTl0P6LI3XlfVsV2BOJbpyhtCJjq5O3q2zoqtx5WgqrqptLp920B
	 Iv9gT/j99ikLSVfym1N3R0P9Ay+6Dfjgle55fYHFcYpvnzmm6CqO5zQnx3X5siiA5q
	 CRSYpCW9Px0Fn7VUkcg3FqsXHmkVs4TPGJzEGS1wntPKZDG59zzQ4dcl8ZN/Pl3yUv
	 TYNpaDs4rH7Cg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 752F2E29F34;
	Thu, 31 Aug 2023 00:10:16 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC/genpd driver updates for v6.6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230829213441.310655-1-ulf.hansson@linaro.org>
References: <20230829213441.310655-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <20230829213441.310655-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/genpd-v6.6
X-PR-Tracked-Commit-Id: 5e536362f6ab97f709c07bfda962a7bb036c2563
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c66403f62717e1af3be2a1873d52d2cf4724feba
Message-Id: <169344061647.21437.12187585839322369368.pr-tracker-bot@kernel.org>
Date: Thu, 31 Aug 2023 00:10:16 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Ulf Hansson <ulf.hansson@linaro.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Tue, 29 Aug 2023 23:34:41 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/genpd-v6.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c66403f62717e1af3be2a1873d52d2cf4724feba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
