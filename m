Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5285C636D7
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8DF21C43442; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7833CC433AA;
	Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675269022;
	bh=TXAlc4kKr/EKkQ/iIh3myWjbdyz5z3zEqqT8YjSS9lY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NPPYnpmIwbWGE217RzjTllhV53TnWpdNs43BL/A9FiscI7Qr6me1ki/FAZUX1cPF8
	 G0X3FrnPKbaSalsSmOd2sd4Bz7aQsz7SlM6tAULGhz69cryq1SlLvvVTqXd+OASBSp
	 2HasVsUSh5FHn4VS4xGOdf2dlVWHMA7uWl8P6NcRtdsxtCyY8wHEq+UTQ6pvRm2k2K
	 sFGhoCRph5tkMpFJ6hOsRaz8BvmDpwOXif8TCPpFuGZzUUEjJ8nTPQTHa/SwDNgWvP
	 J/EA3oJTNSZ6xS3FsDQQU7CISVLbQOKiNhgnHuvT65nlvHhw6boJky2cUtCA71OsVR
	 jzVj3hvcO3hdg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5A214C4314C;
	Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: ZynqMP DT changes for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167526902236.23236.2013034342092674405.git-patchwork-notify@kernel.org>
Date: Wed, 01 Feb 2023 16:30:22 +0000
References: <89d82a7e-6b42-97ce-2912-aa7dec965ff2@monstr.eu>
In-Reply-To: <89d82a7e-6b42-97ce-2912-aa7dec965ff2@monstr.eu>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 31 Jan 2023 11:55:59 +0100 you wrote:
> Hi,
> 
> please pull these DT patches to your tree.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: ZynqMP DT changes for v6.3
    https://git.kernel.org/soc/soc/c/777d90d5f29e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


