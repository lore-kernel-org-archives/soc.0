Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51014E7F12E
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3806EC43215; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 218FDC433BD;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695762233;
	bh=3yLvg6LKXWjnzcQG1mvRsNdhVpbR95n8t/cMs6a+ZRY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=b2HhX32VSlXhNutiZ1sFvuGrsQUZ2zpnhWSihpax1aS7gCbGFYNTs91SXKhlQRi0N
	 bNOEagMHpMrSGKcTG2oEzWi1+k6VjrORRdktJ5Sm8IOOjvlhLbGXsy+fmM7Z2SkrXG
	 nNLTPPcZ2n9woYc6HgXNqnLxBeXlZMtaam/2aO51WG2vMsjO8GWHQf3d1dvnHScHnw
	 IuLvAqgVCmpd/IKaXMDZgrrpdzzGxKKa1TDSKREM1L9xSU5rvuZZXceZ1WtelF9KZc
	 BWvkHZ49E5cKspjBwn+skK17WUfHgJp9tIf5yqZrHciql8u49+Ldvuy1MZVFSYem42
	 b+a0Vu44Th2bA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 094F1C73FE9;
	Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2 1/2] dt-bindings: Changes for v6.6-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576223303.24546.9138850777752827397.git-patchwork-notify@kernel.org>
Date: Tue, 26 Sep 2023 21:03:53 +0000
References: <20230901101742.1871434-1-thierry.reding@gmail.com>
In-Reply-To: <20230901101742.1871434-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  1 Sep 2023 12:17:40 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 72738fdeccd172210539a786e23b09b67565d509:
> 
>   dt-bindings: firmware: Add support for tegra186-bpmp DRAM MRQ GSCs (2023-07-26 18:23:42 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2,1/2] dt-bindings: Changes for v6.6-rc1
    https://git.kernel.org/soc/soc/c/e85a757dd400
  - [GIT,PULL,v2,2/2] arm64: tegra: Device tree changes for v6.6-rc1
    https://git.kernel.org/soc/soc/c/d64f140476d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


