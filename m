Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09113C05052
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CDC60C433BC; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B86B8C43397;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691835627;
	bh=xL6Ma/KaZCsHhftsyRiymaFv56HmMaUVj9jD18uzb7w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=s117Pt+d4jjIqw3X6X0TIzHV+PoASG+kDcG9jnwdogEl7Ut5HV8ZMD8WXgKMJPYR5
	 33VaY8a2bm1VAmo6umy0fKDXldDwNLI+fnnkvm5bcTxeblrHqK8XNJFN37APMc617n
	 FmJPv4S02KRXrV88AuqpwyQHZsON2GaDQRyjOkr3IgRKu6L9JZ0x066++XXVD3p4C4
	 Whbpq4623kZTOlMW7r6fWTXSZx65XdAvdEs2CBSmDFyKJVndVOn8pgUOXIYpg5XvIF
	 ommN+1eJ3edejfzhfhTWXElAJngtj8kxWzw6NtrFwXRDmq59QI8xQA33ITpgIVzfcw
	 LtA13jTO8xl9A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A491BE1CF31;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: soc: ZynqMP SoC changes for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183562767.32343.7601407619528790349.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 10:20:27 +0000
References: <399efa45-df0a-4ec7-e25c-774bb8bf6fb4@monstr.eu>
In-Reply-To: <399efa45-df0a-4ec7-e25c-774bb8bf6fb4@monstr.eu>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 4 Aug 2023 13:30:22 +0200 you wrote:
> Hi,
> 
> please pull these 3 patches to your tree.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: soc: ZynqMP SoC changes for v6.6
    https://git.kernel.org/soc/soc/c/bf08f3233b0a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


