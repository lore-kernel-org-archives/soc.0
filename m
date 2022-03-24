Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AF5C4332F
	for <soc@archiver.kernel.org>; Thu, 24 Mar 2022 02:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1CCC9C340EE; Thu, 24 Mar 2022 02:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 065C2C36AEC;
	Thu, 24 Mar 2022 02:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648087498;
	bh=l7tkezXcPsAnyNN60TGc5hci5d/GThxzcsAyl9yJ3Wo=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=vOHkyl+2BHKnbiQyq9wqpmLSMHwjpFLxsVyIPOcGwu2VpwQ2R++70mELmiRn6AB6F
	 TH6WcplQ8NX38GwCTHdUeTj5Jn/IN6QR8zHNVExiwIcQ6Kt/BAeolEhNw8n2qs255W
	 rDRIlbHkVUcEf8uTDi3eNMQ2mrxtpEyzJQKwkKSuR3ben4UfBjeKtdExodBEmqcCWJ
	 zXTLKKweGgP/LZ6eiAQGsZUuuGEfPdshxrlW7gEeksaXLGZMSezPfDHgkdlTpm9cap
	 /tNEv3CC9huQDEfWHvnoUS1K5iCLcEA5GWZqZH6Er93r9rgiGOnYnPga1oeJ4jN5tC
	 uwz35GPw/cATg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E35B8E7BB0B;
	Thu, 24 Mar 2022 02:04:57 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] ARM: DT updates for 5.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1oGWkyPHZ-gV3pP94hOrJJFBsvvkuzzXBhaYpbzEGR5w@mail.gmail.com>
References: <CAK8P3a29JCfCNWrJ-x7S+kewcSBpeguyo8fmUTt_V4gfrW3=HA@mail.gmail.com>
 <CAK8P3a182FVbZ5QfVhMr20nxQN31fK29Csr_GRp_WpFoBFEPzQ@mail.gmail.com> <CAK8P3a1oGWkyPHZ-gV3pP94hOrJJFBsvvkuzzXBhaYpbzEGR5w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a1oGWkyPHZ-gV3pP94hOrJJFBsvvkuzzXBhaYpbzEGR5w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-5.18
X-PR-Tracked-Commit-Id: bcea9aaa4373f2ee8ea3c758b76c479dffe85822
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ed4643521e6af8ab8ed1e467630a85884d2696cf
Message-Id: <164808749792.29083.313387977230642955.pr-tracker-bot@kernel.org>
Date: Thu, 24 Mar 2022 02:04:57 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Thu, 24 Mar 2022 00:12:27 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-5.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ed4643521e6af8ab8ed1e467630a85884d2696cf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
