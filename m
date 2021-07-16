Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C279C6379B
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:22:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 61030613F3; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4692561416;
	Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470526;
	bh=WlnhcUj85KgB67a4vjPS5KVr+FDWDxa+NH47CSbr7kQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=X+N8BLbP/vssk9SuPRi1Dm8HyRpVg1MAlBp2CtXVnA1Y4Q9exqdbFdAQm6UFlvQOt
	 e+KqtwCgrmWGAPF27Jn0g7V/Ub3c6eu61/M5dAMHyrM14x3suMpUOXKcINzNxaZrHg
	 JBrl5r9d/s4wrsyU466jnNYaq0QTPr40s632Ehzy23THYlpXN2lR4qr3S7ofk9hYX3
	 42/EL+zrYmko77FJpHpK7f0Pt9ZSslaAN+TSxCtH8rkvtcOpyrCtRENocV+9CBCoq2
	 IKTetjOOP2jI2qfRFsqOMILdfA75wfdoUibPLFlF+8b7TdjStQaXqOpSIdy6/I+eYz
	 Q44aMKT6gXGOQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 39F3A60970;
	Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.14(part 2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162647052623.25202.2562833763597716783.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jul 2021 21:22:06 +0000
References: <20210625102819.206172-1-sudeep.holla@arm.com>
In-Reply-To: <20210625102819.206172-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Fri, 25 Jun 2021 11:28:19 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v5.14(part 2)
    https://git.kernel.org/soc/soc/c/959cd8f125bd

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


