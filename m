Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7E6C6379D
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:22:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6D41D6141A; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 51B1661418;
	Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470526;
	bh=dPdDPDI75iRIJXWNsBtzi6G5peoZ8oUpgxwg/+CBum0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hcxNV/hBVy6tcQ18I3zzIXqR7a2epOyxxFmLOLEm4O4GOqlZESpL/JERNKLFqC0Pw
	 eW33jYjp3h3F5H5eINpwgu1pI/GN4wcPbvDFDpcL7oL8++uULndWAO07O+YkcGPoQQ
	 jRla/2r7nWydsvuOZm5/a/J/q+Z480qkbk+Sp2+TfMn75CXDVlqCq14sFTHVIUyRq0
	 lXuIMxMHynuBuSM3a93ktmmqpqfvjHGQ7LJTsb7j0iCKvJk9E3B6Kh/PRrvDfXVQCm
	 HX99YVrQpFJpnjFT8q+i+SeTNOYE8RgBDkUSEeKfcmfTloBLwtPV79BeVXi1OalVjO
	 TwWe+O5IPB+hg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4258160963;
	Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: fixes for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162647052626.25202.18235216929239191066.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jul 2021 21:22:06 +0000
References: <20210714165831.2617437-1-sudeep.holla@arm.com>
In-Reply-To: <20210714165831.2617437-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 14 Jul 2021 17:58:31 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: fixes for v5.14
    https://git.kernel.org/soc/soc/c/2526112b681b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


