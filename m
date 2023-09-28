Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3649FCE7B09
	for <soc@archiver.kernel.org>; Thu, 28 Sep 2023 08:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB0C3C433C9; Thu, 28 Sep 2023 08:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC2DAC433C8;
	Thu, 28 Sep 2023 08:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695888044;
	bh=jM5j+CBpu67bltIGFXAxcBnvj4DpWuRn5/a62dYe0io=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=HITh5eSEVpUmdq/vdjkrPOqk4J750o+M0pWvDD0KyC14T0Oa514uyp5UDB2M+Vd54
	 C86qSctRI7z7ErV9UAERApff6KWAHDDj0wwuyncAfzCDzUIZKlogZYhEC8jvZ1iO1P
	 6L64zoZ9Bq4mvyE2lIuGnRtvzCz5x1i/Paz/AvoPE90eqSmiaRFaJMbS+ZXZmz6Zky
	 UB9VXN8Kv8wF6ikDfnhxlpmsCtkDelrVNxLyx8kGSCU9kCVy2tO7EzinTjq82a0M8C
	 oPagBRZjQqV2/OpB915K2wX1yqqA4VVYmcpXdSXejw/3wEMAx0UDXXBEm3w4cAezWG
	 2BQQNLhm5rsOA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B1194C395E0;
	Thu, 28 Sep 2023 08:00:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Fix for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169588804472.3136.3258743093575963197.git-patchwork-notify@kernel.org>
Date: Thu, 28 Sep 2023 08:00:44 +0000
References: <20230927121555.158619-1-sudeep.holla@arm.com>
In-Reply-To: <20230927121555.158619-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 27 Sep 2023 13:15:55 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Fix for v6.6
    https://git.kernel.org/soc/soc/c/79684f2ea375

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


