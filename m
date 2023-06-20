Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C044C04FDF
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6D1AC6118A; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFB31C4936D;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=hQ1BDigQG9M8YPGrEckXW89jkdHUU4GxSKjAvrzx0UQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=VzQN1UO1NRMJ5dc9tG3e/BcYm23D35d7t/a/c4VbTA3NmZQ4cfZl6HrgzRHYSciD4
	 K2WpEJlwpo7ETU7q/WlG547MMI2cha2PNXw8jH4SoMii4EWabaBnc3yIwD7kQc3csp
	 EfSQStizWuaKM8eyoHw85o7n32jR9pl8QL73dbPWSx/Mez5T9emu+vozVKAzyKtIDg
	 RiPByqK5yTkJi+JQAimmr5FqvUrdsueokl4oSZq6tOyic+AQl9LR1cpAe0Vik46sNT
	 x9kFNx98Dbb1IC09xx9qhu2ljxoe5LqIBPY+oAMl0/l7zahoKFwg4ZHBNrymgjVMvc
	 kHkaGerj16EEw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BBF05E21EDF;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm ARM32 DeviceTree updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611276.12258.6971459232325325652.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <20230615163926.1462225-1-andersson@kernel.org>
In-Reply-To: <20230615163926.1462225-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Jun 2023 09:39:26 -0700 you wrote:
> The following changes since commit 925bac3caa46c5790d21ee236869b017090aad2d:
> 
>   ARM: dts: qcom: apq8074-dragonboard: enable DSI panel (2023-05-30 07:54:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-6.5-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm ARM32 DeviceTree updates for v6.5
    https://git.kernel.org/soc/soc/c/6db92533d6a3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


