Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FB9C63705
	for <soc@archiver.kernel.org>; Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 655BBC433B5; Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44FC8C433D6;
	Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670448029;
	bh=2EJznOIgmcs2yQZoOS5qlwSipU5GqJZwO4KFbJ9SG7o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=VfvK1cB7ux6bX64y9Evh7Trw/Z/OJh7nTdMYmqKr8qMGTOlnIC0dKTM5x8WeCKqIt
	 dCGMbZwWsRdoIP7llwPlKRlMNa/pIaAGdQI3dsab/16hO1hYy09G1QR1NB1rWfF3qU
	 ha39D8q5AA1g42TSeYUlqvpBY5yJIquv7NYZwjTyRj19KxTl5v9B/Fqb3X5x2iUaZE
	 ik9I4QvRu8sFGd1jN9/wRzq5N1r1KuaK4tGUx9evysDEYPF5uciqZ1ZUNzWv3zpvDM
	 UX6NFppFke3KXxddBiuh1EUZ2ZG3OcHevOEI/BS/ejz/cjILjLkdMECtzdpUPPB9aQ
	 gltVbax2ZcHBg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1313DE49BBD;
	Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm: dts: socfpga: dts updates for v6.2, part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167044802907.32577.2307760668554161318.git-patchwork-notify@kernel.org>
Date: Wed, 07 Dec 2022 21:20:29 +0000
References: <20221206214006.590562-1-dinguyen@kernel.org>
In-Reply-To: <20221206214006.590562-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  6 Dec 2022 15:40:06 -0600 you wrote:
> The following changes since commit 31354121bf03dac6498a4236928a38490745d601:
> 
>   arm64: dts: socfpga: Add clk-phase-sd-hs property to the sdmmc node (2022-11-18 11:13:49 -0600)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.2_part2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm: dts: socfpga: dts updates for v6.2, part 2
    https://git.kernel.org/soc/soc/c/c05188c8062d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


