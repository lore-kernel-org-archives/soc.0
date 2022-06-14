Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B328CCA480
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55C98C341C4; Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B630C3411E;
	Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655239034;
	bh=TqXZaHlxuAjAx0iwrVhzUdGUw7TAwczVaaALIWytH/s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lDvrQWvETHZPe1RI7sIm9Rufz+FDVWC5ukKA4NucfOIJb19K2dyxdD7z/OXb/DXGq
	 wQ6Njuj8+kPXwCEucJflg5goUDrvPaiw8J4IXMLp4gb+6SmOVTyfGfhYRxrtt0dbCM
	 kwf7mLPqwXR5i/UUWLpn+WtSoeb9Nf80V/YXd3M1obuy9LMWVE4ecjNtIkakipo69f
	 VYjK7XspcUU26rD8Ow6aIGHbav/3RcI2ApPpbn+sbp8xoiZGm2QP8No7EjANK+t1oB
	 qN0rtQwlvfU6jYoN2BhPfSCB7p1QhW2bmUMHhM6Ds+oIarOrisIDgAMJp0C5fjDF+t
	 OpIPyeJm3nC/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 15850E7385E;
	Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165523903408.29335.1224241877958075928.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jun 2022 20:37:14 +0000
References: <20220614100007.1029881-1-sudeep.holla@arm.com>
In-Reply-To: <20220614100007.1029881-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 14 Jun 2022 11:00:07 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v5.19
    https://git.kernel.org/soc/soc/c/002ec157477c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


