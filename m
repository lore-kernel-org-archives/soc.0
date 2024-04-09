Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED47CD1296
	for <soc@archiver.kernel.org>; Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7B7BC433C7; Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C982C433F1;
	Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712677239;
	bh=cGrsaCOQKk4l/N4HFBQs10EiLdhDEa1TdoxeYC0tXSE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=qrDBu4GrVAT86P5pf9Pyx3TIrVoVBc43/a3oXiHCuo11q4p7v05Nkyps97Ew+nr3H
	 zBRWmfsKFadAEyKM3fNXaNzcuHIGop+/9MwkO0Y8+ZiRDRVHvAEx+sM6gp0XJqEdIe
	 qmNwucPCyVeTCbXr4AvYhdVAiuTVfv5OHeFKRY3Vb3l4cDf17mlq8tdbvD7QMGVQL+
	 tX31kFeX2pG5VoZKFbDpUzsa17QM+Lig5O7BVLujDQFS3fOF6bi7vQVOUdS1MgfBcI
	 /VubMvnETon6boRtMCQA9jZO4CyYYN5Y3EXUjk7e0huDrTNGArdBd5906TNv3mH1T/
	 Eexxmf1QfGgEQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8F4F6D6030E;
	Tue,  9 Apr 2024 15:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Fix for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171267723958.12038.7562441738852603380.git-patchwork-notify@kernel.org>
Date: Tue, 09 Apr 2024 15:40:39 +0000
References: <20240404140339.450509-1-sudeep.holla@arm.com>
In-Reply-To: <20240404140339.450509-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  4 Apr 2024 15:03:38 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Fix for v6.9
    https://git.kernel.org/soc/soc/c/e349017a7b5c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


