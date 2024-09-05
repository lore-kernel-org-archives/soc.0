Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3E2CD5BCB
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 15:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02F69C4CEC7; Thu,  5 Sep 2024 15:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB59C4CEC3;
	Thu,  5 Sep 2024 15:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725550839;
	bh=G8SGVbaetMh+mwxfRMbKpgdLvGPvqkBb6q2mHx45gjo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dwNtQrfA+dheUpjfZPkaXrGXmOs7DE8PWKCgGCLUGTL34Kx1Dv09sOEemWgK9qBTB
	 3Xa+Qgngl+9g/K0HonsZ1cM0AiC82v8h3BRFdz8nRqp6GU1aN0a5MRSR0YgH6MslA9
	 dWROREhFVk3j1A4kosYIFwDiJmvWU0uD2xcfaYU4qnbojParjMdigALvY5nURvt7ne
	 3+U/TDczrngC37rQU+cZddWJiZT1trWxeo1n6VRzx05HmaXTfSVFGPkjg04PEf4xrX
	 8pvyUMvv2HfXQNwVhDQvfjIf1mkLD2BJCKT1KL7wtYhf3BlrbdJS6xaljLL5n+BFgl
	 imj3MZP6AMNRw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACA53806651;
	Thu,  5 Sep 2024 15:40:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] ARM: dts: Fix undocumented LM75 compatible nodes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172555084048.1737985.7316210141322204166.git-patchwork-notify@kernel.org>
Date: Thu, 05 Sep 2024 15:40:40 +0000
References: <20240816164717.1585629-1-robh@kernel.org>
In-Reply-To: <20240816164717.1585629-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 Aug 2024 10:47:14 -0600 you wrote:
> "lm75" without any vendor is undocumented. It works with the Linux
> kernel since the I2C subsystem will do matches of the compatible string
> without a vendor prefix to the i2c_device_id and/or driver name.
> 
> Mostly replace "lm75" with "national,lm75" as that's the original part
> vendor and the compatible which matches what "lm75" matched with. In a
> couple of cases the node name or compatible gives a clue to the actual
> part and vendor and a more specific compatible can be used. In these
> cases, it does change the variant the kernel picks.
> 
> [...]

Here is the summary with links:
  - [v2] ARM: dts: Fix undocumented LM75 compatible nodes
    https://git.kernel.org/soc/soc/c/ef1e32cb6314

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


