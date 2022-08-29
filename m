Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE677ECAAD2
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91976C43140; Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72525C43470;
	Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661766603;
	bh=HuxZ60rZX6ZHulET4DzD3hkLO6BZmMmA1N4wScalJpM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GRnl3fucBYJcCrcalP1ygfRoi0fcufimRWYbbXpT6ufqSfL1w+Lqh1gok9S/Ai1e4
	 WBaKL+sH96n61eRjVjFmsSPlqrrOna9jF03kllP3AwkgTs2JkeTZZ09qJoOMd51Ovw
	 dj773qMHAziBsnLbPxpT9SOG94BVl/DSBFEFmIohij2nHkG+ivVt2xL9kje/riAMmv
	 pKO7jz2Qt3QI2TbF/OBxrnIv20xVIl8/EiHYiIbMq6J+NrGfxDtP1bovfHnTQt9gRq
	 0fcnPRyArUtWi9ich1Q9FwmTHxzzXtApnWJGgepcRq0MmnPEDZJtGNuDTXWiWhfMLk
	 mU40PQdLLC1Cg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 59A66E924DA;
	Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: Drop ARM_CPUIDLE(generic idle driver)
 config
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166176660336.19402.8946600240951479171.git-patchwork-notify@kernel.org>
Date: Mon, 29 Aug 2022 09:50:03 +0000
References: <20220822121604.2213778-1-sudeep.holla@arm.com>
In-Reply-To: <20220822121604.2213778-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 22 Aug 2022 13:16:04 +0100 you wrote:
> Since commit 788961462f34 ("ARM: psci: cpuidle: Enable PSCI CPUidle
> driver") the generic ARM cpuidle driver probe no longer worked on
> ARM64. It was however left enabled with the driver failing to probe
> successfully. However the commit 51280acad855 ("cpuidle: cpuidle-arm:
> remove arm64 support") removed the Kconfig option so that it is no
> longer enabled for arm64 platforms.
> 
> [...]

Here is the summary with links:
  - arm64: defconfig: Drop ARM_CPUIDLE(generic idle driver) config
    https://git.kernel.org/soc/soc/c/853ff6c32150

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


