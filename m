Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65830C4332F
	for <soc@archiver.kernel.org>; Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A622C385B1; Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23716C385AA;
	Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649970615;
	bh=mcIwlKxdAolWaVreAhPfevCLqyO83JF7l/9S1sRzTXI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=s7umgkJlE7gy0JBvgi8n+DsAQq+R3TVRpjkIgRgZPq0YXlH84S/oJuwqYgYV+nOXq
	 YocgiPDAAN1jBaw6CrystU2MLuS/1e4GFaUszvDI35M6KNBCSc6ZGZJ0nVFpSleaq1
	 BvV79JULtEoT8THqqKyEoAhpudT37NQ0A/J7indadx6GAFhPsSgaX22u4ooZKGQ8Qy
	 ViNW8P5vEsic3BFN31BqhMyLvWUf5UE1MRsWEerlC7BpCri0RFTQ8vJebjNXFK9DOo
	 zNaP33BiYzz0s15jAKJxpYZaLdO3FK/CCurI5N41rb396Zs/Mz3xGbmTWYYst14v7p
	 FVIYIDd1/5j5A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 00A59EAC081;
	Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [[GIT PULL] OP-TEE fix for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164997061499.10394.13080846299508607692.git-patchwork-notify@kernel.org>
Date: Thu, 14 Apr 2022 21:10:14 +0000
References: <20220413052001.GA49798@jade>
In-Reply-To: <20220413052001.GA49798@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 13 Apr 2022 07:20:01 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small OP-TEE driver fix for the error handling path in
> the FF-A probe function.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [[GIT,PULL] OP-TEE fix for v5.18
    https://git.kernel.org/soc/soc/c/c834eff53c18

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


