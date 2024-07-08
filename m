Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B8EC3DA4A
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0355AC4AF1B; Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDF0CC4AF15;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720451507;
	bh=73mDjP2AvKqfG3pEOCTy1bJYK7qI/QhYltlvNzOqtsI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kBFv4UY3gFS5rttFL8hYcoq4WII30DrCjvPFSe2+qcSSt9SEWvJvTCNsEJ+SiDSWE
	 u3TnGsmAroqRVhuCXMx64XztbXLFTcwZCnUt7pfP5a5/ciXxSGT1OzwbXyGA6ag3Y2
	 kPbMd8yN6rYXvMOeouqxXUVb50kxaJ7W1M4C3Sf5sPwywOzSgRr307Mzkbm9RKXS/I
	 iDzlM5JHw1ciuh+RMcEA4EiftyZxDz/4TQ4HA/+038S+KvJM/ID49hDbiyNno3HwfK
	 V6SgBpWaw5ZDVr8XKlnqU5rf7YG0emgvlb1HfKm9IF3AT+7Z4LxS2uaRk2t33gaoX1
	 /cTbGgqNv23lg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C6791DF3718;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172045150780.17395.5258832269777843699.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 15:11:47 +0000
References: <20240707-nuttiness-lustfully-4aaf03c991b2@spud>
In-Reply-To: <20240707-nuttiness-lustfully-4aaf03c991b2@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 7 Jul 2024 18:58:00 +0100 you wrote:
> Hey Arnd,
> 
> Should be the final PR from me. I meant to send this stuff out end of
> last week but I ended up getting sick - and I'm going to blame screwing
> up my PR subjects on that...
> 
> There's not really a huge amount in here, I ended up dropping the k230
> that missed last window cos there's been no further interest in getting
> it support outside of the basic uart + interrupt controllers + memory
> configuration dts that Yangyu Chen sent. The board is fairly frustrating
> to work with due to the bootloader setup, and maybe nobody really cares
> since it's fairly underpowered, especially compared to the Spacemit k1
> equipped Banana Pi board. I've stashed it in a branch in case anyone
> surfaces that cares about it. So no vector 1.0 hardware with a dts in the
> kernel yet.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetrees for v6.11
    https://git.kernel.org/soc/soc/c/31f6b5a651f9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


