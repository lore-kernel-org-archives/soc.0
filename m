Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65036C4167E
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4497CC385C2; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25738C385BD;
	Thu,  5 May 2022 19:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651779108;
	bh=2EDbdlz3LLo1LJ3VhRAntZ/CE8vfff8W3iUDEbefuF0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZyH64VM/8wGmtR4xdbaNzolCMluGv/fp3ORCFOEGmyfmget10+d3vlvixSS0k+VHa
	 k7S2qpT3Z5hfiIxg020d4z9egKNy5YovvSl3ou5terfaj8siUFY6wgR635VIgzqXBf
	 7NjE6vh3njx/Yp9fWFR6moZ6KhxvkuzArSKxiEGAGQ6jvytg7loFPcE9roCcVOFfud
	 Ka4g5NiZTrvWsCjfan0CHt79BlVDRqU3Xawecb4GYFIm+GUVJv66ce6dHUNA0h4GCo
	 vimo3AKKbe3tggd6c0j0yMj7t4hSBMTUlM59nDeVUzNY8RqQST47DZjfX7/g7RMTuw
	 my01BQCqXpTxQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 053BFF0384A;
	Thu,  5 May 2022 19:31:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC RTKit/SART/NVMe driver
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165177910801.9627.12656188073939134308.git-patchwork-notify@kernel.org>
Date: Thu, 05 May 2022 19:31:48 +0000
References: <20220505154020.84638-1-sven@svenpeter.dev>
In-Reply-To: <20220505154020.84638-1-sven@svenpeter.dev>
To: Sven Peter <sven@svenpeter.dev>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  5 May 2022 17:40:20 +0200 you wrote:
> Hi SoC Team,
> 
> Please merge the Apple SoC NVMe driver and its dependencies for 5.19.
> As discussed on the nvme mailing list [1] it's easiest if we take it
> entirely through the SoC tree since there's a chance that we will have
> more drivers depending on rtkit for 5.19.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC RTKit/SART/NVMe driver
    https://git.kernel.org/soc/soc/c/bdc33dad34be

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


