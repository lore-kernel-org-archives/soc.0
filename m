Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0827C43219
	for <soc@archiver.kernel.org>; Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86ACCC3460C; Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70F09C3460E;
	Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639518011;
	bh=SRkK+zORD64pjFYhimaJXhNy411Req10PHgTmAIZeSQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=j1H0frt/wd1S+07J1YcYFLpKlUvqOuOIQn16Xzw/mu4xBMNUFyN6EOgW3m1x53MlG
	 xigCzbOIudeXf3rk4jH7bHyMjGqY98rv5nO0f8up+kpOaL/peChUtFUrq2QWXCc9JR
	 QAdtXWNl56XeE7ZRATIhrq7DweaW+v2deVhaMibddwWld6QCv09HQXF9CwyU9QeXD0
	 zTkHLrSOvL9ExfffDbKNOVnR68NfnDagc897rMlKeauK/YMqXFTsK2XEazD2f9bA8/
	 orM6dIs/Frp9d1vCA6eB5Urw2Q21+dzqrhtHR1GPeLSEZSH9I3UG/nYcQVb5ZvPxcx
	 Gu4k688dr6CHA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 443AF60A69;
	Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: zynqmp: Xilinx SoC changes for v5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163951801127.19193.8464505824574306465.git-patchwork-notify@kernel.org>
Date: Tue, 14 Dec 2021 21:40:11 +0000
References: <48dec441-2c1f-73a0-3e6c-aa0d7be5ba26@monstr.eu>
In-Reply-To: <48dec441-2c1f-73a0-3e6c-aa0d7be5ba26@monstr.eu>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 8 Dec 2021 12:58:48 +0100 you wrote:
> Hi,
> 
> please pull these patches to your tree. They are doing small cleanup and
> fix handling in power domain driver with also checking firmware api call.
> 
> Request for 5.16 came late that's why sending it again rebased on the
> top of v5.16-rc1 but with the same content.
> Previous PR:
> https://lore.kernel.org/r/0ea5d885-c770-af56-7de0-bcf6adc61bcd@xilinx.com
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: zynqmp: Xilinx SoC changes for v5.17
    https://git.kernel.org/soc/soc/c/5213313b9ad8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


