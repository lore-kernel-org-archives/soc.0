Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D68C3DA49
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DAF07C32786; Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C37ABC4AF0C;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720451507;
	bh=skDPEAJqQD1rVf/fiKe2BnMi7VBrU/RVlgGRJNeUkUY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MXY1RNPutRUpRxLBfNcgAbnvlRkEFhj2N5etU9Rad0R0yxOOYN/RdeOZgH8uGKL62
	 YEV7O0e/WDq1555N03nt5VYM+xb2t7/0t8MZz1FScPxQGIxmc2BDjVjiqRgz4Yh+9o
	 Qf4Segq1uQj7dXNl3cX4shPilk1tJbAR0ySPdLxtpnczIO9qqH4gyfsQt+oIMDQzrt
	 vOM9GWUESIOJ09MzcsAEL67o7FgI8lGDzKVM4+1oNEsrz32DKJ5V2Dgl8fWFZx5pFR
	 XGRVL+Wk0Qi2jDNr5wzZa1+bXRVGKwiWGr2v7Y1XNFkhaUO/szxKEh0xJjUUsl0B3m
	 P2Os4VJsa0q9A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AEBD8C433E9;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172045150771.17395.10178932665486230298.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 15:11:47 +0000
References: <20240706173140.18887-1-andersson@kernel.org>
In-Reply-To: <20240706173140.18887-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat,  6 Jul 2024 12:31:38 -0500 you wrote:
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.11
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v6.11
    https://git.kernel.org/soc/soc/c/2d61b9303cec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


