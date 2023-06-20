Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5662EB64DD
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7625DC433AB; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 577C3C433CA;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=0WzOiHz1LQW5f2rvpzDXMcE3cBhAbBkY2L6xyDmWIf8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oKTYojYltJAF5yNiOn2t/UQtyy2gaafVwvDeVpg/KUmZ43RPCF0GSyK14lkUGh7NV
	 IRc/99bgoEkD/jvB/AQYefyTQjXidLmZz+n5iVFPDrNUlKlfLtENhV+h/Damf8E37F
	 BeGDiNZjjSr4rJTPzkcbfq4JNpI8YhnH9oOw85XSASblFCI6nZRW0ItYojqtJ/tWia
	 rtn/Qu8UzinOUwa5xZkKimy9b0ctKjhZoGHM0g0tZCAviDBsyYDiuXRYl09urgWEWj
	 RnHQo+FBJ0N8s8kw2TWvCOO2kn7uN5M2nJPrV2gmitn3NCkP3DSlZe5+5NbsWBy3lh
	 gMuWA3dj8aJ1g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 33205E2A036;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] Broadcom devicetree changes for 6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611220.12258.11240309928222488341.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <20230619134920.3384844-1-florian.fainelli@broadcom.com>
In-Reply-To: <20230619134920.3384844-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 Jun 2023 06:49:18 -0700 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.5/devicetree
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Broadcom devicetree changes for 6.5
    https://git.kernel.org/soc/soc/c/313c22bb3195
  - [GIT,PULL,2/3] Broadcom devicetree-arm64 changes for 6.5
    https://git.kernel.org/soc/soc/c/d704f1fe9f4a
  - [GIT,PULL,3/3] Broadcom maintainers changes for 6.5
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


