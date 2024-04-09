Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A25CD129A
	for <soc@archiver.kernel.org>; Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADD6CC43601; Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DEBAC43394;
	Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712678195;
	bh=WWlW366OXcGOwPD14C12bUJvAoqVV00HZV6uo9IDY5g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=StdLoAaVpO4jgvB4zEDKwiLZyusPFMDgGrw16HLwdavJvbg/1wj9rCG0rsz7fMJ6n
	 CrAXb+FURMl5mKcncd1rbk72NYGIt264mU3i54h5nD/vJuPOar7Ig9hYBR4emwT0fC
	 j1/fmn2hE7jgFKg8OplRjYhUU/KDX1fXySgc8jRTI8u8bwZs6jKSphh8ZEb6xSbdvY
	 qVilNz4YSMpWTaLoWMNzJHBQSnwxc79CT5+MtCy/XpUMQqJsiKYSlzh+HpPdwdWD2l
	 0wBlrGWJlv+wZ9RfibEzSKrjc9A+PXKXzmlM8SFdZeJ6RNHiOLxR4N5L99uotherLG
	 W8C0eyqzf9PmA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 76FA7C395F6;
	Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171267819548.12038.9040732241921972657.git-patchwork-notify@kernel.org>
Date: Tue, 09 Apr 2024 15:56:35 +0000
References: <20240404140306.450330-1-sudeep.holla@arm.com>
In-Reply-To: <20240404140306.450330-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  4 Apr 2024 15:03:05 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v6.9
    https://git.kernel.org/soc/soc/c/64c80c99ed4a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


