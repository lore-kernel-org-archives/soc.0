Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07209C433FE
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 15:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C205FC340F7; Tue,  1 Mar 2022 15:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7AB1C340EE;
	Tue,  1 Mar 2022 15:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646148613;
	bh=6clhzTqvkdEbbQrqfIR/1r5BfwG66CVSIiA1PZYyGQA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=eIZLWrlAerSHwchoqqnyw0BZJMFjLr9TW+KargYXHaFXkNEhV9R3951hmw6ofZqVR
	 sWYLIvpWEqSSFelSzaEJPIOvvuZycHosDhUQArU6gwuLqMLoiwFfpligXrgl28NO9O
	 732cGIjPwtIJRMOVPWsh5eStNt5gwhEVAZ/IIhcN9Rze34quPDmRi9UbqjKllYGS3J
	 rzpQzcn8F3LKinwlXkJEB3h9DbnPiBwWcrorsNJIC1q4NSuS1KoyQJJoAYC70s3+PA
	 ZJDju2D/zuswzeiKZeSOB29JYwLxfSnVX2p7EjXAgV5Vcuy0W9RH1CxkkmXrFlMVf0
	 XwMyXg1/wUCLQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7F64FEAC09E;
	Tue,  1 Mar 2022 15:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v5.18 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164614861351.22804.17450591580179248057.git-patchwork-notify@kernel.org>
Date: Tue, 01 Mar 2022 15:30:13 +0000
References: <87v8wxzrlo.fsf@BL-laptop>
In-Reply-To: <87v8wxzrlo.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 01 Mar 2022 15:15:31 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v5.18.
> 
> Gregory
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v5.18 (#1)
    https://git.kernel.org/soc/soc/c/94b0655636b3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


