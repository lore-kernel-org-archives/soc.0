Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC6BC4332F
	for <soc@archiver.kernel.org>; Thu,  2 Nov 2023 00:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1265CC433CB; Thu,  2 Nov 2023 00:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E56A1C433C9;
	Thu,  2 Nov 2023 00:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698883281;
	bh=MIzseMp7Z5H0d4sJlV8+DoGISP8YqE6OCXrA6xJe+OI=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=oZ55PuLgasreGOfpgpS7vdrVPs4GRjf3+DiKT9A9D4D4K/1bQCxTM0b+ciXaWrxjQ
	 T0a+he2KyrOa6to9tlrLIEkmNoShxjc321r1Cl++iHMqUBxMukalZ2SWRtacScFpMd
	 AheW9SHGQAyeHkcjP6R9io+YdHMoEMDxLy8IdLcuvPApi4i3udvMX8cBxMbdbH7ySl
	 myFxDl/joVOau3qKGD5sYhEXiXZbgdwh6CcT6/wHZONhxUea+rzTYOpPXWEVdKcSRP
	 iKiYez8tvwjkxEB3M+Ez3HyPuEqiva70NMNF/8eQBWeejiKiFmqXIORE8R19ZZNTvH
	 pmaph50DTaycQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D4BEEC4316B;
	Thu,  2 Nov 2023 00:01:20 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain updates for v6.7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20231101112516.5623-1-ulf.hansson@linaro.org>
References: <20231101112516.5623-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20231101112516.5623-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.7
X-PR-Tracked-Commit-Id: 9e0cceadb7a5099c637e787191a9adbf9ec424cd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3c86a44d623ee8734a02636d3544812e31496460
Message-Id: <169888328086.31464.5659850375207165849.pr-tracker-bot@kernel.org>
Date: Thu, 02 Nov 2023 00:01:20 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Ulf Hansson <ulf.hansson@linaro.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Wed,  1 Nov 2023 12:25:16 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3c86a44d623ee8734a02636d3544812e31496460

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
