Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C4EC6FA8A
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5FC4C43145; Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80D17C43143;
	Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662116424;
	bh=NnR+dIkkW8+zvgSRK2Sb9WiBVK1bnNt2eHWGQUcxU4U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FiJzeB4891DMepJsa/pFDAIoN+78IP+AcJ/7Hbc2c846AWzNO/4roC493ATTI4IkP
	 VaZ4JvnajTSsqzAtQ7I52+HCI4ACxJjeXH4wWYRKSHzCwUZnEzLwZQJO9sWDKz5uhx
	 93DP3jFa60udT/4ajnjYjAqjaYeL0JKUDonUWG18ePQIBH6v/X0EC9EY8x2tPwm92h
	 PW9bnU1AZL4fO5MyvoWef2gG0WAcbPzIL5Hg8JeX5I3UPOLJEeGAC6Rkxj5bbRX+8L
	 hgsjJfL0aNU06gTVQcV03cxoEjTUlhvtNZaj14AEvy9tpirhY76/YQL2m38w07nnYe
	 wkCP4cdyGYFlA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65CABE924E8;
	Fri,  2 Sep 2022 11:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: juno: fixes for v6.0-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166211642441.12856.10856652001274632502.git-patchwork-notify@kernel.org>
Date: Fri, 02 Sep 2022 11:00:24 +0000
References: <20220829174420.207880-1-sudeep.holla@arm.com>
In-Reply-To: <20220829174420.207880-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 29 Aug 2022 18:44:20 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: juno: fixes for v6.0-rc1
    https://git.kernel.org/soc/soc/c/92c7c5b0f958

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


