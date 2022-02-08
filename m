Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C53EC43217
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06D23C004E1; Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE70DC340F8;
	Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644311578;
	bh=GUz1PJHyv/r8FtyfW4189gEjkm1yYaIt0HyWiCBhBiE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CPfmWDEiIDimAMw3M/e098rKv/USL3X27ijzAca09C4AU34l8j8s79/3+yux8bEIK
	 zVabCIOhTfr7ZzVYsoUt4dQVwfqXZOMx6h2ERoJGeRjJyGj+ypM5JHhbPD2IHqTsGP
	 Ut0fkP6svrSSfPMCtrKkpN0ymXrYgVwW0bXRxtU8VAf3epsTvAr6O/ul1PPqOAzjlG
	 Np9t6W73utI2LvqhCj/MzdvRyuLmNjrf8iS0jsIrHQFS7r/t8A0ZA3NZ1P4UKuST0w
	 DooTHzHDAoMdwe9AVyCs9LTISGs+pNvT2GtWt5Ewk8CrCcl60MRB95f1dcQ7onbEhl
	 7WRcFF3ADvp+A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B7005E6D4A2;
	Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE fix for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431157873.18327.12003279951405344661.git-patchwork-notify@kernel.org>
Date: Tue, 08 Feb 2022 09:12:58 +0000
References: <20220203132323.GA4132001@jade>
In-Reply-To: <20220203132323.GA4132001@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 3 Feb 2022 14:23:23 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this OP-TEE driver fix which decouples driver private shared
> memory objects from the original tee_context. This fixes the root cause of
> a shutdown problem where the driver would dead-lock waiting for tee-supplicant.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE fix for v5.17
    https://git.kernel.org/soc/soc/c/63a8728579a8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


