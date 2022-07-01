Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FB1CCA489
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4FD76C341DC; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3706FC341D7;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656708097;
	bh=7n0l1X8OeuCMjnhD7GdC5R+WIDarvnijD+RUMolIHRU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DkOIRVO3JdEGPWZ1GKxxpO4F4Z0+ckFYi/p51IccOfyHyv0497zXqFhbKgZgj1v5e
	 JhpCVtjSDcfSrUKQrgzvGzigQvr3/fllw8HFvdl6eOtmre0L31ZnWdGZsTKb8ipypC
	 bP+I2RYo06Aj5QRX2lk9URaNUgJYWIYbsyf16Ygq5YB0rm44Z0P8DSLjfkvXEp6giC
	 4zb598Bg3P3CRAHyzZs8AF4x3h3hZtGG6y4mq0h0XvBMWSpafRzoU6NA5g+y1Q8ChL
	 si/DIBn5E5FIP3ZK21yZ+wDfIlGBG4B0lMZM/L8TlyJmXYWSkiINH73yxYBne359km
	 nnia0+MHcDNKw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2022DE49FA1;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v5.19(Round 2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165670809712.26141.15602256196802213873.git-patchwork-notify@kernel.org>
Date: Fri, 01 Jul 2022 20:41:37 +0000
References: <20220628133315.699803-1-sudeep.holla@arm.com>
In-Reply-To: <20220628133315.699803-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 28 Jun 2022 14:33:15 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> We pushed several extra conformance checks in the SCMI driver and quite a few
> firmware bugs have been discovered with that. Due to absence of formal
> conformace test suite for SCMI, we have to workaround them in the kernel for
> now :(.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v5.19(Round 2)
    https://git.kernel.org/soc/soc/c/d95ce66d4cc3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


