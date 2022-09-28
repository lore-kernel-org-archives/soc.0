Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBC9C6FA95
	for <soc@archiver.kernel.org>; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98484C4314D; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81D44C43147;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664398829;
	bh=aQ2j6ZB2ZXmZENeGMS4zYoBiyGIq5ONbQ16hGdthZyA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=K4GHqIv0E81wz39fT9u3O6Y50W9AZursTQBcNvsNjkcW5YThSHNwk6MaqGccCmF4y
	 7IFmhGDsbgqDzNnXnpeJTd4zWMtySRhv1WWVTAWQlzc9JknJ1aggmC7DtY3bbFo0wW
	 s4chBhU7ywlDzW51rdIgtzdR9QsrHz/F/CviZrxM90mNXT8NNnd8WVPBNrIrRUdQUb
	 UZFynXwP+OvWA8UjistFkiifIyXnLGsENctdKvWMaVZ95h2bwZ/ulEDY9g++guMjJw
	 VE8KmWq/b5Z1l7+qXU01RgRuEjqsOpPkmvPUmHKsXMvJW145NHOTqHD/el6laTwHSg
	 jhqccnWDAeJ+A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7190AE4D021;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH v2] firmware/psci: Print a warning if PSCI doesn't
 accept PC mode
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166439882946.18494.1307099392044240187.git-patchwork-notify@kernel.org>
Date: Wed, 28 Sep 2022 21:00:29 +0000
References: <20220926110249.666813-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220926110249.666813-1-dmitry.baryshkov@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 26 Sep 2022 14:02:49 +0300 you wrote:
> The function psci_pd_try_set_osi_mode() will print an error if enabling
> OSI mode fails. To ease debugging PSCI issues print corresponding
> message if switching to PC mode fails too.
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [...]

Here is the summary with links:
  - [RESEND,v2] firmware/psci: Print a warning if PSCI doesn't accept PC mode
    https://git.kernel.org/soc/soc/c/998fcd001feb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


