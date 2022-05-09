Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C91FC433FE
	for <soc@archiver.kernel.org>; Mon,  9 May 2022 21:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 34E46C385C2; Mon,  9 May 2022 21:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DAF8C385C1;
	Mon,  9 May 2022 21:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652132437;
	bh=UDuCWhaJqj5Tg3QE/VtYmC3laUIZCk+62uhirHjgS9E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pEWOEVFmyPrGWdYoKWwTfke+zSwLEDFwyLiXCzkTc70fLZCLYYMOPc8DqPCJRs9HR
	 0nQkvLJ8nJJNg2YCwi42NmNS4ILLEk3ahYYZdOalNM/ZyY8v+61rBeioPmEWXR5bOf
	 pBbmX1dxxOxXpnlIgZ0R+oFTKFnMtbdXQa23HVu18dUne0fws5oIhqEF1V4s2ryPI8
	 QcQh2G5ShOLF2UbxN/Jt7Qlat/CUAjTJUFCw5Id6n7rP1jj92RHYJXbsZ+1YpPDpOR
	 Yz9xxeNjYf5s+wjcoLPukpuJRPBm9dl3nkQ8K8TwWeLOf+rgUC7QMQ/f4VltF2rDFr
	 0yENxD/ub5ZzQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F0299F0392B;
	Mon,  9 May 2022 21:40:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] TI SoC driver updates for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165213243697.32686.8075797812715962835.git-patchwork-notify@kernel.org>
Date: Mon, 09 May 2022 21:40:36 +0000
References: <20220507163424.pvqnwrxpoo73lmp2@debtless>
In-Reply-To: <20220507163424.pvqnwrxpoo73lmp2@debtless>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 7 May 2022 11:34:24 -0500 you wrote:
> Hi ARM SoC maintainers,
> 
>    Please pull:
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] TI SoC driver updates for v5.19
    https://git.kernel.org/soc/soc/c/1901300bf356
  - [GIT,PULL,2/2] ARM: dts: TI K2 updates for v5.19
    https://git.kernel.org/soc/soc/c/7665a85a6943

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


