Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD69CCA483
	for <soc@archiver.kernel.org>; Tue, 12 Jul 2022 21:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86F56C341CF; Tue, 12 Jul 2022 21:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6ACD2C3411E;
	Tue, 12 Jul 2022 21:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657661420;
	bh=7DHqpDIsCtXndJzRLqIRdzFXfLRjk3sVdW9gNDLc/6w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=BzgrrmwJE95b/vk9D4KlZ6hnS/l5ItzeLHkDKM3I1HugY+g+DmIALb8mu4ulpdIvf
	 VoAwxyk6brcGTtGC613uP+/JJ02PXvNalQCxbURvQm2JZzxDwYZozFA5wWgL6f/jY3
	 ZDj1/7W8chlReTu669nMFlYphScIP5ng7teb3I6LU/WVbYJ5NvkEymSUhPJX9lgBv/
	 qjoXhoyvSB5yVo70HNeex9qr63yLwp/T0PVxUDkUvY1yaYpCSwtvQfX4VFQUFLFzjw
	 jaCDoP5/K1N8YzCAQulNsNpkG6JLGa/cb29W60PiqUIaVzkksuC16DukrSGX0keUEr
	 muUgZRkEhPwew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4DAA5E45232;
	Tue, 12 Jul 2022 21:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] TI SoC driver updates for v5.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165766142031.32298.5001290847632117543.git-patchwork-notify@kernel.org>
Date: Tue, 12 Jul 2022 21:30:20 +0000
References: <20220708232655.reqjdbib52ejdja4@unadvised>
In-Reply-To: <20220708232655.reqjdbib52ejdja4@unadvised>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 8 Jul 2022 18:26:55 -0500 you wrote:
> Hi ARM SoC maintainers,
> 
> Please pull
> 
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] TI SoC driver updates for v5.20
    https://git.kernel.org/soc/soc/c/62fcbc5c5d10
  - [GIT,PULL,2/3] arm64: dts: TI K3 updates for v5.20
    (no matching commit)
  - [GIT,PULL,3/3] ARM: dts: TI K2 updates for v5.20
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


