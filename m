Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69F2C001DF
	for <soc@archiver.kernel.org>; Mon, 24 Jul 2023 14:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D675C433CA; Mon, 24 Jul 2023 14:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 701D2C433C8;
	Mon, 24 Jul 2023 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690207821;
	bh=K+DdvJrsGqvIQYGwl/tS6pJW0Sbrgk+vBAdLNRH0OQE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Uy6m05g+9jB+NPF58mnnw2cp0UZ8mM9ubGExDcNvofG2TC/1HbY+7Xue4Ul6uhssG
	 ps0M1Xas2GNKVUFF7BqNQF+DJvli6L3xOJ3v0VI3iHxzs2Ne7X5mTDWTfLsClHyBtf
	 LmY+NLy5Tkk8ohoAJ8S0ZJ8F8Ci4EwTf0UJ6IIJpHD7DUuzBxmgymD1kijDrBIkSK0
	 x0yaVvffk3G8IMz5xqLWIn6WzxuV2ZX4TBkF0KA92AVbKMrMADHH5Qa2ET1yv5WZ+r
	 D9SVV+n3QemIwtxCLYxKgjhCpL3Okz6HEIRWgG2ww+up+cWdvnHUauqQcxjgJkrrUy
	 dvr58NLkQoP9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5CE18E1F658;
	Mon, 24 Jul 2023 14:10:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: juno/vexpress: Fix for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169020782137.21041.16388052294600194721.git-patchwork-notify@kernel.org>
Date: Mon, 24 Jul 2023 14:10:21 +0000
References: <20230721112359.3369716-1-sudeep.holla@arm.com>
In-Reply-To: <20230721112359.3369716-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 21 Jul 2023 12:23:59 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: juno/vexpress: Fix for v6.5
    https://git.kernel.org/soc/soc/c/74d964097fb9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


