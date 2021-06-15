Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9186C49EA4
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 739A3614A7; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5B19F6162A;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623772813;
	bh=vIOCt6232viQTarV5M1Nkfv7dBkFdXpNdI4sUPYQyrU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=VIWAgMwQBqmq3JxmHC4S08N7JiQds9WeJ5F3ti22ecm+FeOBSSEVfJZtxWFxx0Zqa
	 nChCE7GtQlBgjKk5LvYS+apbtsLlmeYuQlAR6NfwXre9Jf670hYh+k3BR+66YPEFp3
	 9vIRQOKzohWBe3AO2E9CwDVz75hYEqL4GLsG13Z+5yOBPFN62sGlsAYPqRXOLqp5kG
	 SJNY61KWBhiZw52FekIthwuDH9I9Uem3vhFGaHdcybW4G45A21tqvGG6LMumafLrM8
	 dyWa4l9OwWDw9L/szFRyG73UlE26zVlE5vk2pqHc+kNOw5oyrIjAaWw4ozEDSsbRdJ
	 HlMGX35RbKVqA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 55CCD60CAA;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] ARM: dts: imx28: Add DTS description of imx28 based XEA
 board
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162377281334.17464.11305682093609668397.git-patchwork-notify@kernel.org>
Date: Tue, 15 Jun 2021 16:00:13 +0000
References: <20210518142857.26170-1-lukma@denx.de>
In-Reply-To: <20210518142857.26170-1-lukma@denx.de>
To: Lukasz Majewski <lukma@denx.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/for-next):

On Tue, 18 May 2021 16:28:57 +0200 you wrote:
> This patch adds DTS definition of the imx278 based XEA board.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> 
> ---
> Changes for v3:
> - Remove meaningless 'regulator-always-on' and 'enable-active-high'
> - Provide proper order for ssp{023}
> - Change memory start address to @40000000
> 
> [...]

Here is the summary with links:
  - [v3] ARM: dts: imx28: Add DTS description of imx28 based XEA board
    https://git.kernel.org/soc/soc/c/445ae16ac1c5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


