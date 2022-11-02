Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1520C433FE
	for <soc@archiver.kernel.org>; Wed,  2 Nov 2022 21:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4C79C433C1; Wed,  2 Nov 2022 21:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 992A3C433D6;
	Wed,  2 Nov 2022 21:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667423416;
	bh=flSEN9ZcXEsHdfat84ewt7hvtlvmQnCpPW9V3f5zMBc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UYrGvSJQvmXhTI//UQh4SplWhuR6Wy5dFv8epbS7d7OKWpQLrRthpoem5BwP7+RQX
	 zqzgM+CAzaURu9UcoV7wxAe0BeplUoLerDqWshSWywXKJZwhQy7pDuCArksqtFfe1e
	 CWhKbM5lTqjO//pzrNQiRaD3iu+9yLMoyJlwHmjOPRD55yFG2uWPxBaOfA2HPleFYN
	 cH3RJ9UfwceCIfwmJtr/57Imh+4tVK/leam9dhL+Us8PUPpo0dRKRgVlwEXLKIT5R4
	 aIhy/NyksoSshWc3ELkpeFP7YSSamRNN80LzdeSbxeLziIKPt+wcelCcgVPiO+RE7g
	 lAW6GuXS/dgrg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8505EE270D5;
	Wed,  2 Nov 2022 21:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166742341654.30442.7532599503113857028.git-patchwork-notify@kernel.org>
Date: Wed, 02 Nov 2022 21:10:16 +0000
References: <20221102140142.2758107-1-sudeep.holla@arm.com>
In-Reply-To: <20221102140142.2758107-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  2 Nov 2022 14:01:42 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v6.1
    https://git.kernel.org/soc/soc/c/f76c745151e0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


