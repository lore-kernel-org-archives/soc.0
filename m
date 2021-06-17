Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6649BC49361
	for <soc@archiver.kernel.org>; Thu, 17 Jun 2021 01:50:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1FEEB613E3; Thu, 17 Jun 2021 01:50:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 07A4A613DB;
	Thu, 17 Jun 2021 01:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623894605;
	bh=D2Xzw4Qnv+Qzvbfq1/wPVlRqDaMIaBftRSLWj0NMCWc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=je6wlIoX2SWgAAztv2iOEum5+XC4hlshdW7Ynof3UG9DSe8T7LO9TUp2MqfMUP29M
	 OGgS8cop+y/iRDz2XZNHDlGbsaIofZE98J6s+FGHq2whZJThETkK9Ft3tDsSKbkSHO
	 JRbfeB91eCahqGyyy06eNYqJyL6c4M+QzaE/oDSObKOEicOZzqfFFcbTIoofk4EVs4
	 ZSXMBE20U/M0/gr1VqiCxZwR3zwDbR+AmFBiYE7Mhgy4PGooEeDqkH98QSNhOr1YHM
	 o07A6/ZuRiY0XkIHr86BdCA3hNAaGJZiiXvLnPWqLXRT5rv4cpIsBTakfnP7Cutr/s
	 bXiSudLFSB6WQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EC08860989;
	Thu, 17 Jun 2021 01:50:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: Tegra for v5.14, part two
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162389460496.26973.9044984526081713013.git-patchwork-notify@kernel.org>
Date: Thu, 17 Jun 2021 01:50:04 +0000
References: <20210614195200.21657-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210614195200.21657-1-krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 14 Jun 2021 21:52:00 +0200 you wrote:
> Hi Arnd and Olof,
> 
> Tegra got quite big rework this cycle.  The last piece comes from Thierry,
> however it depends on one patch in Will's tree.  Since the last Thierry's
> patches depend both on that one patch and other memory controller drivers
> changes, they are here.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: Tegra for v5.14, part two
    https://git.kernel.org/soc/soc/c/1eb5f83ee936

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


