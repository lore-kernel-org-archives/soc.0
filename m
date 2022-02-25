Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53751C4167D
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 294BAC340F2; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AD06C340F4;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=NfHoP3cRNvIwJvZYmx+X8F8rfRj1S2Jg46pCCGn+qjI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RaclQ/nvr6YMRIQIlXEANzXO+fbMEGgZV4nS4lgwzicubbd/hj85G0xC3NmwbfdUx
	 cn5qyo2UQPO2h8tkF3FYgbcqvCV1ESIQnbXrVyUTpkyGv10R3geZVWKR3SafSM4/5z
	 cheAWp/4i2syUdnebldULsvFG114JUcE1bjdEapzaMspMpgyKGXV48E/dc5RklUE/A
	 13atgMlEulYRkuVqUz8Bkq60WYRcbaT/6Iuq30p67oGXBNVGLbNoyXpuKvTfr8mjHk
	 e6fcuB83fPTzfe1dv21KEUltbdrHjl1aWNyTbcsgtW8QA8HbIDxADvYDnrUj3OaBDh
	 mKUHE0VuBf0FQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E0AA2EAC09F;
	Fri, 25 Feb 2022 17:21:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966291.15608.12465939740557592920.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:02 +0000
References: <20220222201742.3338589-1-sudeep.holla@arm.com>
In-Reply-To: <20220222201742.3338589-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Feb 2022 20:17:42 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v5.18
    https://git.kernel.org/soc/soc/c/b610c55bdfb9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


