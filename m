Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F76C6FA93
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33E3DC4314D; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D843C4347C;
	Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663950027;
	bh=NX3v5h9ZaVALT4jirzMkh/D2RliJDbTvq1FkdnTNiHI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=C8VXslo3A5ZHX5EQ0yYYKIfJewT/NyGkaxhQCzM1OJUbzj8Qk06KUnX3InGCnkOI8
	 if4fkJoFU65trg094OyZGMYxHXr9XauYtWckJK8l4RkJdKqMB2NMwPMpyKejrIv5pG
	 /Cti+zq4WfEBL8QiOBXdhJtfHsLxhrutCG3r3lNbk6k4SzDpLX00o/YuFCGw/sdSSR
	 3YaNO4VUT8tYB0KnnwkEsZ9lkQ8WDAGLEMudXbNgPAuc1IdlhFsXBRfVzigsJC0G4U
	 Y3mtvcFcFTRWRRnLZho7UIRqcpL1oe530lFIW+xHh1kyHeHJ0I6u+uC6Ob2yT4TQ/o
	 +rA/slc0Sb7bQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 07C83E52545;
	Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt for v6.1 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166395002702.3905.1474898130147353986.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 16:20:27 +0000
References: <87edw2xfle.fsf@BL-laptop>
In-Reply-To: <87edw2xfle.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 23 Sep 2022 16:42:05 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt for mvebu for v6.1.
> 
> Gregory
> 
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt for v6.1 (#1)
    https://git.kernel.org/soc/soc/c/01c65733fadb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


