Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93653C49EB9
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2985C613D3; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 107BD613CD;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502411;
	bh=Cc4ckKw2aM+O0SHNOCZkU4SiMhPTbgYG0eSe/1Yj8Gw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ioOV1AscbVTpnHN0WvDMd0EpvWu80sDHs5oPOHuiZWaqdfPqd2Jaof58Oy1QMr7rX
	 W5ylePjz785JOpLtTNbspVD1uCXuLnTWBi0hVMQKtujEmNd9239jSgDZliutAP1dka
	 0EaIK9KRDw4lsDE+/rgYOcTwpWb633ZY4FNyBbMo7R1CzQZ02TsBYtdTEbEi4CoSrY
	 YzZtGCHxEeZwEqizSxa6Mwe4LtAoj9C4wATSbYkTOYGhG0ag4fQeWxdQS8f7L4I09g
	 6IND7sStEoJacWloXynnjwctc88WLa4G2dlBx0ab052BVs2xPD4Tf+6TKXAYRHBwvW
	 TQFGPBa2+/O5Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0AC0160A54;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v5.13 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450241104.24025.14391747070994519218.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jun 2021 02:40:11 +0000
References: <87eecx0w6s.fsf@BL-laptop>
In-Reply-To: <87eecx0w6s.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Sun, 20 Jun 2021 10:36:27 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for fixes for mvebu for v5.13.
> 
> Gregory
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: fixes for v5.13 (#1)
    https://git.kernel.org/soc/soc/c/4014f3177b0a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


