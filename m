Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3ADC77B7A
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 20:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E60BC433A7; Fri, 26 May 2023 20:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED3FEC433A0;
	Fri, 26 May 2023 20:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685134222;
	bh=XpuhK3KmNspukOkWTiE62DAB4J7eXx6nQZvC9u84uqs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=n8B5VwnjKUVLWds9aXjM6esMnSPscGMWP4HlxVLCb44ynK4waF309KQzwfO23iXyZ
	 uKsi6ypZP+jntQU8EgNwvQhj7WJYK89vTMFcJaSN24DHs5hJSMscWt2ZafRq+4Z08D
	 fd7n9bQHES1tIxqfEmhcSZyhGZkWBnjufbneh3AjA4YuXkCpAmagAdHtRTqKuCgbCq
	 NZVxs/XJUvCThN4FNxV3PXfPu8FdoYsoMURcZrQzDuAcxNciIV4NynqfCRGuV+X+lu
	 Ki3HV2JVQeKyhODmsQSxstaS8ZAvVUcsp1UN/xtAE1hJRv7S0KpUm3I7b6ZwNvX7E8
	 k0Apl6i8zuAVA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C9BA7E4F133;
	Fri, 26 May 2023 20:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SoC/misc: SRAM driver and binding updates
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168513422181.30982.8689386816593080526.git-patchwork-notify@kernel.org>
Date: Fri, 26 May 2023 20:50:21 +0000
References: <CACRpkdbEQ7nTnJTj5WMtxvH057fDSbX5tNs5j4Y=5KSBMpa-Sw@mail.gmail.com>
In-Reply-To: <CACRpkdbEQ7nTnJTj5WMtxvH057fDSbX5tNs5j4Y=5KSBMpa-Sw@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 17 May 2023 09:27:48 +0200 you wrote:
> Hi SoC folks,
> 
> it seems most natural to pull these misc/sram driver changes
> into the SoC tree.
> 
> Please pull it in, some notes in the signed tag.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SoC/misc: SRAM driver and binding updates
    https://git.kernel.org/soc/soc/c/edc24de71648

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


