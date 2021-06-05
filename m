Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941D6C4743D
	for <soc@archiver.kernel.org>; Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 40BFC6142B; Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 296886141C;
	Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622934026;
	bh=KNIHY9xECTgQux6V7YmtmSyScwHdlHkdyNqH4Jk2MeY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Wpr6DIQd7+26gmX7ewpaEQeMXtVu1IhFruIWln2vc4HpDfo4ZUsqQ+q/vEZUM+h5J
	 +EOLyIaG2FfUGj00xyll00WTCtj58x09nF2jykVv0GZBXgy/HVs0pq3/YAdO2M3Eak
	 C+v+xL1M4sAwhHf2pXb6hlnXTGPsZfDs0sgVCV4KeEU97IFv4HWAtMVgRzlRG9ZJzL
	 u4t8I39TpyFnJbf+9CB8K7nTe41ynQxGeaV6vxeHZ3J9keLXUQICGz6RBHtsrHgwCA
	 QVyc4y9qovxVpGenaaQLqLySCixVyS+IhfDS4CL+rqzot8sRxRdohk5v8Alqihae+s
	 TnsDi5FWbLMrg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 21E3C609AD;
	Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: TI K3 fixups for v5.13 rc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162293402613.32315.13768121436459176240.git-patchwork-notify@kernel.org>
Date: Sat, 05 Jun 2021 23:00:26 +0000
References: <20210518115634.467vgpbzplal5kou@obituary>
In-Reply-To: <20210518115634.467vgpbzplal5kou@obituary>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Tue, 18 May 2021 06:56:34 -0500 you wrote:
> Hi,
> 
> These are minor fixups for the 5.13-rc towards making the yaml
> conversion of various txt files in 5.14-rc1.
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: TI K3 fixups for v5.13 rc
    https://git.kernel.org/soc/soc/c/b9c112f2c223

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


