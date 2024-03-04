Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB44C54E6E
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C022C433F1; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55DF7C32789;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709539275;
	bh=zCQEJjAZL8Lr3XqGUmvWIgnV07YfZm2NFmOnLuyCxtw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TAkluLh5Nz7LQzskHZ0uQ4rO6MwO+xUQXwE/3wwUwITpRiujwldX6GMDS1bK8jt6n
	 rZqIL+kJefCIK2O12tryCwI80xH3yEK9N9MjembJtayQuvcXL2rerCTgADEXSYklOp
	 dOTazUaz1vFDujyzgp9MZzqAXPJfC4ndMu/+9XhBmDyABW+OWFQs369xFw7TjQxSWQ
	 sJNJkMH1CONXFDCVIsHTfLpcDGwF41QnuGXH5TSERpHF8hr/QEFlJ9aKjKiavqzYfq
	 U0gXgTSMJuSspko5HbZX9Bi/TsjHhAGCVUGZcSqifFDBtW1q9+trQIfGurRY0fOivH
	 FOWRSyy56/s2A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 41CA2D88F88;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt for v6.9 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170953927526.27833.16582714316420329444.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 08:01:15 +0000
References: <87cysehr9k.fsf@BL-laptop>
In-Reply-To: <87cysehr9k.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 01 Mar 2024 17:05:11 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt for mvebu for v6.9.
> 
> Gregory
> 
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt for v6.9 (#1)
    https://git.kernel.org/soc/soc/c/ada123939ee6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


