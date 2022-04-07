Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AF5C433F5
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 12:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C886CC385AA; Thu,  7 Apr 2022 12:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BD5DC385A0;
	Thu,  7 Apr 2022 12:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649334899;
	bh=GQUkEZ7tirV/NdDw3HqguacTSZIMCWb31Cr/C15DoOw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rQalVOUyebZCNIZSaRLcJuZBrqLUkzACSJ6fTC13iQPAaTwLNukE3NVh1zmjaVYSN
	 AoI7i3NH+zYLv9DJNtvQSXhHS3zzSAQK+aDnbkRuYE6rXj9tjY2LbipNNH92FpL+j1
	 9+xhdqlkta8RGmvNB1HIhRiu47qV160779/vAPsp2/2iYJJtLDvypo69IOYxM6Nf5+
	 nrk4TVkg4ytwhPTI4VnVii0zju32MVGrpQyGTxql88UBMekTZ5eQzbpMjKHOM42x7H
	 /Bn0d79lthn4PE3E/JIVcWkuvemeeoN8OtkaiOwF98CB74UEYsvPuPnXQHvC0UCvV8
	 QYzmXrT0+kOUw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 76140E85BCB;
	Thu,  7 Apr 2022 12:34:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: vexpress: Fixes for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164933489948.10369.5076987107237480975.git-patchwork-notify@kernel.org>
Date: Thu, 07 Apr 2022 12:34:59 +0000
References: <20220407110828.1436206-1-sudeep.holla@arm.com>
In-Reply-To: <20220407110828.1436206-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  7 Apr 2022 12:08:28 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: vexpress: Fixes for v5.18
    https://git.kernel.org/soc/soc/c/bc22bb224b3c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


