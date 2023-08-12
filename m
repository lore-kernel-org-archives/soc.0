Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCD4C04A94
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 08:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 737BCC433CD; Sat, 12 Aug 2023 08:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A3DBC433C8;
	Sat, 12 Aug 2023 08:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691828596;
	bh=xRmYqGop7BxFSGTglSlUoBRBgmjw+BGPBO9CPqHgpj0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GZ2eVYl0VPAsd9WJJC3knThIkmnuGiu8JPaLuu3u1Aiqal/a0V0CyzuBDIGhqvX0n
	 XLyR+eP5DR7j7e8tef8VXsaKd+C2sd8SlenJ82gBwzBObLdP0Fj8u8bzjE4a5Xo9X+
	 dwvZjVes7hbNnUUTsu7ARJDVAh8l+lMU/6+1bZZyaAomjzSmQAWqGndUmgHbnYXgi0
	 FiU8CbHhewAVzLXZVZndrEs34IFd1TXvREeNbal/L4fTRX/RffxWQRFxSIHVxfC9Kx
	 39/o2/Zkk9WDu0zEGr94JsT4tPVfrlAhPeuREyYvmptd23BajxagsAKRuNjndRj+q2
	 3lmFAplR2no4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3143CE3308D;
	Sat, 12 Aug 2023 08:23:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: soc: Zynq SoC changes for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169182859619.22229.3162832775412926642.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 08:23:16 +0000
References: <a56457a0-7e5a-df46-2c86-3f2ace578984@monstr.eu>
In-Reply-To: <a56457a0-7e5a-df46-2c86-3f2ace578984@monstr.eu>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 4 Aug 2023 13:13:16 +0200 you wrote:
> Hi,
> 
> please pull this one Rob's patch to your tree,
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: soc: Zynq SoC changes for v6.6
    https://git.kernel.org/soc/soc/c/d842f4dc68a0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


