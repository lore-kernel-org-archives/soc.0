Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D11EC38145
	for <soc@archiver.kernel.org>; Thu,  8 Sep 2022 15:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14732C43470; Thu,  8 Sep 2022 15:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8545C433D6;
	Thu,  8 Sep 2022 15:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662652215;
	bh=TughXk46qxzkOouVbjVmoiBGq0gqbpMy1Gg3l6WFS6Q=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RPFms2Urh24OvCl3togXqRZKs9oR5yn6SJEVbZLrHUOuK9sO6/NV4VduvnXLFSgLD
	 6Mo35N//zspKQxdO2bcSuLeYTHjYt6nfIJMv7jyyUr6pk24q+2MPhT156kh4Spcil6
	 pG0ItB2pRbDjNQHWABws35M0Ds+6jd7PQL3mM9T7cMqZUwNCmDDJit7vHoLuaSxnf4
	 oqApZ/sbryE0PrTkZsgumMaxQYC3Pmq+YjA/JJcruYH6c9xo6BMbM12wbmheLpWG9R
	 XIUkGPNmuSZNUgox9EWXrjFRq1HmuqmnTWF24tlSfbXsvE1tK41nQGyQmLjM1D48nZ
	 XLSnc4jFaeQng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CD72FC04E59;
	Thu,  8 Sep 2022 15:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v6.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166265221483.8789.9983439098515658170.git-patchwork-notify@kernel.org>
Date: Thu, 08 Sep 2022 15:50:14 +0000
References: <20220829174435.207911-1-sudeep.holla@arm.com>
In-Reply-To: <20220829174435.207911-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 29 Aug 2022 18:44:35 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v6.0
    https://git.kernel.org/soc/soc/c/d4f1920d07e8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


