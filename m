Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B897EC433F5
	for <soc@archiver.kernel.org>; Thu, 24 Mar 2022 02:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81647C340E8; Thu, 24 Mar 2022 02:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69D0CC340F3;
	Thu, 24 Mar 2022 02:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648087497;
	bh=qJxSn4phJiz6P6/QcHdHQNZ8ikyDicIpNxAAeaofSng=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=tws+9d0ptpxWfk0v5nE6WQ+lDVZSR1ysvwAWlhGXKqfWd5cDYmZrawks/5WF8p4aE
	 uNGFNxrfnRg0UsiWinLD5ewpjbbkNgxF8TVBqa9mpKM3KhgPx3TclVBAaF6vB8vA1b
	 Tis8HjUGkznJpWyr+o6fkDTQxvHqGjzR0LVW6X98G+rsPPdmWe7QctZTa+J9lFjd2F
	 vP3aQf8bB75/u+QOJyytvP2hQdtqja19+k8JjUdfw5e5kMJVeEh2N6B0SHbAudoG2t
	 yDtMnPpbQJmSshAs+CzrAUCqy+N7Fzpp+cuVutyLr49S5wsD35BsNGluIVWlIVcXJd
	 019DOn4HMtlsA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 53913E6D402;
	Thu, 24 Mar 2022 02:04:57 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] ARM: defconfig updates for 5.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a182FVbZ5QfVhMr20nxQN31fK29Csr_GRp_WpFoBFEPzQ@mail.gmail.com>
References: <CAK8P3a29JCfCNWrJ-x7S+kewcSBpeguyo8fmUTt_V4gfrW3=HA@mail.gmail.com> <CAK8P3a182FVbZ5QfVhMr20nxQN31fK29Csr_GRp_WpFoBFEPzQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a182FVbZ5QfVhMr20nxQN31fK29Csr_GRp_WpFoBFEPzQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-5.18
X-PR-Tracked-Commit-Id: cf38326010aebf39855977475a901c4c7a3e0b63
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8ffa5709e577385a1c8d20fb434cb02732f1d991
Message-Id: <164808749733.29083.14436045072418943499.pr-tracker-bot@kernel.org>
Date: Thu, 24 Mar 2022 02:04:57 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Thu, 24 Mar 2022 00:08:16 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-5.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8ffa5709e577385a1c8d20fb434cb02732f1d991

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
