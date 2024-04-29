Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E82DC25B73
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 40685C4AF61; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28A05C4AF51;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714424447;
	bh=ktG3ZEsPX1cBZ+L3DX30PpfcPSAmnURAAk983izsWEU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AhBnxdGOXE1yOpPG8VU0Ryr+CL+41aoVDIexol4jVmUyMY75r0VPfAY1Ak00pJkXN
	 zdq1X/FapMzrQLwfQraT3oLqe5B7ifPp6zCQT9AmMqCrxe0Gx043EbFZxvoS4jX03/
	 0eakchgVELQqYMx5yjQUGMgn/bC0CdJaq/W3LovK1/cSfD2KnUejGiDyx9YcPkWzVK
	 rL4PTo24+c80KhDFDxDpag0IxnTfY8cHTqCm+DT9RNuhpgKDgqhHsMPHGMZ6d+iuPZ
	 JBCwvXLFLMUKW/LklAZ5+DwaOhqQG1BAqKXlWIABvAJVrCivdG5hi05GmpYIEIamdS
	 n5sT62eDg+nXQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1E580C54BAD;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE driver for Trusted Services
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171442444712.17402.15060934166905928818.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 21:00:47 +0000
References: <20240425073119.GA3261080@rayden>
In-Reply-To: <20240425073119.GA3261080@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 25 Apr 2024 09:31:19 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these patches that introduces a TEE driver for Trusted
> Services. You can see more details below from the signed tag. These
> patches have been in for a few weeks.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE driver for Trusted Services
    https://git.kernel.org/soc/soc/c/40b561e50176

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


