Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31819C4167D
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 236C3C34104; Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AFE5C340FE;
	Tue,  8 Feb 2022 09:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644311579;
	bh=poKEqjFRJRLFQFphcEeDjnvP5LjWfogIAD7Q2ZSJQF0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pETc8EE1kAjQfdNlgVVs9ekT0Lk1DI6Ke989BN8rxUARK/7t2VyG7gJgAXbHfhF36
	 8BiU/WifUwB7BZREMQzOsyxPel9mcv75KsTyqD2Byi40Qoes0q8SrK8jydtjiMXZfO
	 CB0dqcIJm+BcWVLPlzp/CiigLL84d98DCjbm6jTlI/F+j8M0jgvuTCJOs16gmlDsUA
	 aug01cQbJgxl9rT76eDgf2mqucagDFJ4+1ynFc2/x7mS8Wx3G7TZ/XN3mwd2dpBdYK
	 6uzApB49RQrE5EYyX+toMOW2aNFOjg8iU7pQxi1u7+U7QUJjFSDwTeN0i7LZFvS8Vk
	 dZwi4hFRD5jvg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E8921E6D45A;
	Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC MAINTAINERS updates for 5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431157894.18327.5223929631783086541.git-patchwork-notify@kernel.org>
Date: Tue, 08 Feb 2022 09:12:58 +0000
References: <24ae6871-3e67-5c7f-2060-28048db439a2@marcan.st>
In-Reply-To: <24ae6871-3e67-5c7f-2060-28048db439a2@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 8 Jan 2022 14:13:49 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge this trivial MAINTAINERS change for 5.17.
> 
> This commit was waiting on the watchdog driver to be merged, but I only
> just now realized that it silently did. Sorry for the last-minute pull.
> If this can't make it into the 5.17 merge window, it can be added as a
> fix later instead.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC MAINTAINERS updates for 5.17
    https://git.kernel.org/soc/soc/c/78b390bd5657

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


