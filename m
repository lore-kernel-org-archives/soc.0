Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816DAC54E5C
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67395C4166C; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51AD0C43330;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709574032;
	bh=ihvpGAg3p/+dZuaZQTRH8/JR5MFchg9EcxTyi9VeAvM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nQCdiH0LuvPBBLpi7ZpIRFJKZGseguLBBeT5Em5W6SNXyYnZklQ6VGK1TpR/QTzZ/
	 DcBZmjujUDp0GeFPacZoxrvLyftpl7hh2VHSRY/nZscUW4ubdsYo1Fj1x9HHXWg2Wz
	 rhuqejyDZ2pM+5VIcj/xaWU2NO0usst7DoEl02MidowFllmpzBmAhdCu3S0W1J9v1k
	 sEur9DWtwarJ2r9zx8IA5bSmQS3od0wO2mC+RaXXgxs/duhtAcDPKvplxT6G1431/e
	 q5fA1u7aD7EzW7b0X1QyRILSyxggKTg39U+c6FFl/OTXAQfYZGcASfszMTxraVr80i
	 sCWknkTKPhG8A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3810FD88F8D;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: vexpress: Update for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170957403222.23732.6110303573197155591.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 17:40:32 +0000
References: <20240223033307.117906-1-sudeep.holla@arm.com>
In-Reply-To: <20240223033307.117906-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 23 Feb 2024 03:33:06 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: vexpress: Update for v6.9
    https://git.kernel.org/soc/soc/c/6b5fad59fd46

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


