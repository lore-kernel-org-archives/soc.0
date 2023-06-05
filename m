Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB97BC7EE32
	for <soc@archiver.kernel.org>; Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B37BBC433AA; Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A933C433A4;
	Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685980240;
	bh=2PTwgHdIXDjZFIL8tuuz80WNG6TdcYxI4pqOuArZtYE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZGDwYvBDP90ai4pJS4Gs8dK/XR6Jqs6PIrh6+WFKVFEC8RNvNuF6mYGYACyrEKtfH
	 Vl+AFbZ4pIYHSifI8FJ4/ZA9e0RH2BbAESQuei7eLyCeo+LymVCeg4wqFQx+4fjrHB
	 17ivw8/tiwMEU4WOrUL0MmWqGMKzGAkrfO36drlde3CINI4Re3jyFX/AIBF/83lLEe
	 FQ+tKp3nt1gNFpcz2I0Ji1vKB3ykXzOWee8iNuShrjXa5SGh0uvBgcLcINh7a5V3h7
	 EVMb0zx49ypmkimNf5QKr/gYXpAu70jDSmE56L7yPMxEvVLOuKtMpCAhrHa2VlUa9C
	 qEeP42zFHPI3A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6B2B0E4F0A9;
	Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver fixes for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168598024043.10098.12996868688756123593.git-patchwork-notify@kernel.org>
Date: Mon, 05 Jun 2023 15:50:40 +0000
References: <20230601141058.2246039-1-andersson@kernel.org>
In-Reply-To: <20230601141058.2246039-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  1 Jun 2023 07:10:58 -0700 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-driver-fixes-for-6.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver fixes for 6.4
    https://git.kernel.org/soc/soc/c/be02e1fc71d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


