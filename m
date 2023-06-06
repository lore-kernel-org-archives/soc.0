Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70AAC7EE45
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4717C433A4; Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9724FC4339B;
	Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686084024;
	bh=f+ErnUFYxZ3UgGoPAU5mrrPLJvO6UwdejicwYaV97qY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Rg1Gj5eYCL8RRAR8XBQo6CRsLe+0EXX34f//bWUlVNEFVQ8EsphOpAFtSu/a3pvxx
	 3fTEqbCpGclNz+mFHSFjcI9mIijDqr+dPtBXXQap6fBlJf2fR4SMvysRHf3P8H4VHy
	 rfwKk4Ll/Z1m9dPUnsJhO/os1C1N53dQWijxsF33i5MzXRR3EzvvWWiFCfSW3G8lAN
	 xYoMj/NA0qQhCXGCyKb6hf/H9qRlHR2aGRO+z+kjbhO/BROYdX0s/3yVgwBV+1qTZ1
	 ZC6FVCd2TYVa1MMTcy07T3m16NWSW03XFouvEnc5NiiMXsJ2jeWV5WjKJdkLfL88/a
	 qwuGyY1j1Z5HQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 78843E29F39;
	Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] Documentation/process: add soc maintainer handbook
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168608402448.20407.264145201677581136.git-patchwork-notify@kernel.org>
Date: Tue, 06 Jun 2023 20:40:24 +0000
References: <20230606-escapable-stuffed-7ca5033e7741@wendy>
In-Reply-To: <20230606-escapable-stuffed-7ca5033e7741@wendy>
To: Conor Dooley <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 6 Jun 2023 09:27:43 +0100 you wrote:
> Arnd suggested that adding a maintainer handbook for the SoC "subsystem"
> would be helpful in trying to bring on board maintainers for the various
> new platforms cropping up in RISC-V land.
> 
> Add a document briefly describing the role of the SoC subsystem and some
> basic advice for (new) platform maintainers.
> 
> [...]

Here is the summary with links:
  - [v3] Documentation/process: add soc maintainer handbook
    https://git.kernel.org/soc/soc/c/425d827ef91e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


