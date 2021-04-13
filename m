Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772D9C43461
	for <soc@archiver.kernel.org>; Tue, 13 Apr 2021 09:30:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 17E93613C1; Tue, 13 Apr 2021 09:30:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 00A0D61222;
	Tue, 13 Apr 2021 09:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618306211;
	bh=52+gBUZWae3HE3MCJSNF0+J8oZNAmjwkIOmxV0mDJbk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=BtweGZZqIZizIlUSAIqLJM6bhT3NKDhQj1msjzOLX+c9lTydfuVibfTzbeYmOqzg1
	 LeYbSQBdeSKYJQdPxyQdl5PIb6lchGYM/1u4MQpD6eNSTKlkasDIIpFNIjP54lhOGQ
	 pdtB7zK69Drg36KnWJJEApR6iFDSPj0IO5WMxgZhd9hK1wS/e5JN6ee/cPpsw0xOpl
	 TpCsi2nS1GaoHj7CQb+I2mbq3dUWnCA6AXVKSWnCpJLQjbJsPFithiT053fYWClsTZ
	 wrtSlgNpBzUn1ufqwT4WqujdvkAKvAu8YFv2sQoNvpCM4eKRat2yyz4TXriZNUznl0
	 V+3RC1qYWzceQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E766B60CD1;
	Tue, 13 Apr 2021 09:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc/fsl drivers changes for next(v5.13)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161830621094.20348.18398372295713466336.git-patchwork-notify@kernel.org>
Date: Tue, 13 Apr 2021 09:30:10 +0000
References: <20210409205719.27927-1-leoyang.li@nxp.com>
In-Reply-To: <20210409205719.27927-1-leoyang.li@nxp.com>
To: Leo Li <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri,  9 Apr 2021 15:57:19 -0500 you wrote:
> Hi soc maintainers,
> 
> Please merge the following new changes for soc/fsl drivers.
> 
> Regards,
> Leo
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc/fsl drivers changes for next(v5.13)
    https://git.kernel.org/soc/soc/c/41c39cfc841d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


