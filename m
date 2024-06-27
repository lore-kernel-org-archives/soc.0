Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBED5C30653
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 15:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9349BC32786; Thu, 27 Jun 2024 15:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D4FDC4AF07;
	Thu, 27 Jun 2024 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719501630;
	bh=v/shv5n432pjqPbDCdnp1eV5VzZsf/t7wXQ7RObPoYE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=WNS3MBZq9NR5NfbDYxSSgaJy6EC0PsN23A5WiNjCNnXzteBqxGEe+aw4sXe6IbI6G
	 7MpZR2PBq7dHIdSVWu0cKaJpY9HpROknymh2aHA3K2wxk23xqZAk//qrHPr9KbFQnI
	 pGZyXyNZrPH1NdL7SdTGVM/eMXnkeGDV6qswoEEVgorRj4SaEdv/Y7GRlcdox8E0P7
	 5gtLN4DA4ynw/OJcdTK2mPi3ZQfGiUnYwtp0crwyC9Cm3dqFqsePBGrTs8L3ofRBYy
	 eqHBAv1SR0EY39b0b3p/ISYJ/83AeIHxxYH5m7XweqAIx8GTdh1sJfu4M2jbBC9mHq
	 IHRvNrstoQXLg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65DA3C433A2;
	Thu, 27 Jun 2024 15:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE fix for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171950163041.12878.1370067399734910962.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 15:20:30 +0000
References: <20240627125112.GA2674988@rayden>
In-Reply-To: <20240627125112.GA2674988@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 27 Jun 2024 14:51:12 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch fixing a few missing-field-initializers warnings
> in the optee driver.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE fix for v6.11
    https://git.kernel.org/soc/soc/c/56d62dc2ba68

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


