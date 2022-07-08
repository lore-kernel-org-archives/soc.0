Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A6CC43334
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 07:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0EFF1C341D2; Fri,  8 Jul 2022 07:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECAF8C341CF;
	Fri,  8 Jul 2022 07:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657266615;
	bh=vMMWfh9iE9w5OTr1mY8gH9GRlPdL7iLj/56wCv3JRaQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZCiRCiE+DxzBRqgPFxUlmg1NMYo3bZ3aawP9+G4PBX5qnPs4FjI6Iiro7xdFkrXhs
	 za5E9chkKtIopPUi5IRmdvT8ow530FHL8Lbln/2eYidjgZ60rlKUxpFR0rg9Q7yduy
	 EOutxpaPP8LQH3w4IFUavRXagwtG/vyorcbZtAAhZALuzJ+Pg2Y1C2HEzGIjxnObOj
	 RoYnR0Vbb8L+2Tk5FadDEQU3RdhmF6AMZpsRq5vF2kMe2epdfOLb8fkp9Xhb6GQJT0
	 pYr0ufjiXb8LWCoXh9KoQGeAvE/NOvmGq4pOv3sF846K300GTqfk7vQV5WwNl/SXU6
	 ne9YpkL1tyfkw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CF215E45BDE;
	Fri,  8 Jul 2022 07:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: Zynq DT changes for v5.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165726661484.10888.5940966849613282460.git-patchwork-notify@kernel.org>
Date: Fri, 08 Jul 2022 07:50:14 +0000
References: <87d2bd4a-b90d-6396-17c5-c95ac64d17d0@monstr.eu>
In-Reply-To: <87d2bd4a-b90d-6396-17c5-c95ac64d17d0@monstr.eu>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 7 Jul 2022 16:20:44 +0200 you wrote:
> Hi,
> 
> please pull the following alignment patch to your tree.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: Zynq DT changes for v5.20
    https://git.kernel.org/soc/soc/c/30a32ee55f6a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


