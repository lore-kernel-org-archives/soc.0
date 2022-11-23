Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471F9C4167D
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28C6DC43149; Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12B7AC433B5;
	Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669204824;
	bh=7o3d8UKi1BZzhEaxSkBGVMfiAdpfJvhWbieHGT+hW9I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UIywe1wQZkZ9mB+ncGh4yPnCQF+YOUIFTdLzeNmUvgATadt6nkEXKHtbsUxcOr9f8
	 zCVaJUbBvkKoKbKFwNpISNPlR/oSLSzLyOCqpQNN72p2jEho2mF6r/HVLntDgpTnB6
	 vbMoSYSyFo5o/CcwObluoTzMChyFITHpBkOHKP4ukQcS39NBO9aIVDo7+CpdzKjl+C
	 iH71CJHiba6Kk/Qm8yNphAgxXW95jzB9G2vdIsnoyE7rDI2Q2Zfd2BsjRIdzGFTKUL
	 mRf19A6TkfvCIkR7CQCXAJqPZPirRrc0vGIz6z4UJaOptJsyZk7m4fDwaT5Up4QF25
	 C5cAxgT0dvGng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EA1BBC395C5;
	Wed, 23 Nov 2022 12:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2 1/7] soc/tegra: Changes for v6.2-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166920482395.7332.14928966392738346030.git-patchwork-notify@kernel.org>
Date: Wed, 23 Nov 2022 12:00:23 +0000
References: <20221121171239.2041835-1-thierry.reding@gmail.com>
In-Reply-To: <20221121171239.2041835-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 21 Nov 2022 18:12:33 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2,1/7] soc/tegra: Changes for v6.2-rc1
    (no matching commit)
  - [GIT,PULL,v2,2/7] firmware: tegra: Changes for v6.2-rc1
    (no matching commit)
  - [GIT,PULL,v2,3/7] clk: tegra: Changes for v6.2-rc1
    (no matching commit)
  - [GIT,PULL,v2,4/7] dt-bindings: Changes for v6.2-rc1
    (no matching commit)
  - [GIT,PULL,v2,5/7] memory: tegra: Changes for v6.2-rc1
    (no matching commit)
  - [GIT,PULL,v2,6/7] ARM: tegra: Device tree changes for v6.2-rc1
    https://git.kernel.org/soc/soc/c/714aac5dcd3a
  - [GIT,PULL,v2,7/7] arm64: tegra: Device tree changes for v6.2-rc1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


