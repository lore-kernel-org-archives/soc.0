Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA7AC54E58
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4105BC433F1; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24848C433C7;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=B4l4A3mOV/A7GIWEayfxIdaCp2dtmXqYVlOGWX5+vUY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=VUx/too7ABKAkBd3M5AcT32mMLkqb5gJn12RbCfLvK9rQjCaqIoR1t6uzGKNPlHuw
	 ZNL567BGRDATqchJEmIUHxoKLlhGTgMVTKTFyN3K4Hd7QM4716vFGvBQKTlAD5qIsO
	 QTgRJrLy1aiyPvRHLoAY51XPl3Th7upID1JA2ozZ8kqk50CxSLoSpTXQh7Wj3pkdV2
	 c8tmcnJ0gw/K1FHmIdpM4xiGofItFFmvQtD5MlcRk7xmYf3Xx8NeHprQhuUDtoVXGF
	 Qxvaod365JBBra/s9JWcapHOLHqmEv7gg/z9/9isARhSzxMw2UMB/7VujnIJvo70Np
	 JBOQ8LFuL/4xw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 10F2FD88F88;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] soc/tegra: Changes for v6.9-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872006.25915.6654724986330625211.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <20240223174849.1509465-1-thierry.reding@gmail.com>
In-Reply-To: <20240223174849.1509465-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 23 Feb 2024 18:48:44 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] soc/tegra: Changes for v6.9-rc1
    https://git.kernel.org/soc/soc/c/3326155e5b99
  - [GIT,PULL,2/5] firmware: tegra: Changes for v6.9-rc1
    https://git.kernel.org/soc/soc/c/1b9df39edc61
  - [GIT,PULL,3/5] dt-bindings: Changes for v6.9-rc1
    (no matching commit)
  - [GIT,PULL,4/5] ARM: tegra: Device tree changes for v6.9-rc1
    (no matching commit)
  - [GIT,PULL,5/5] arm64: tegra: Device tree changes for v6.9-rc1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


