Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24278C2FC1A
	for <soc@archiver.kernel.org>; Thu, 17 Aug 2023 12:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3759C433C8; Thu, 17 Aug 2023 12:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD02DC433CB;
	Thu, 17 Aug 2023 12:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692276625;
	bh=9tyRsZ5MapGLqn5rMexQjk9mT71E96e1qW3P8+qXDuQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=sdPm5J4qDdcaQlCstYGalxpIAuFGYduKRi2HzTBDwaTzIAEoF6cwqckW7Poujuz2n
	 yLsgq/MVmSDzt4OPZR2haLnrBzriKQso3TZWQM5GjaREbORlvJqWMQAg3WYwYdLjPW
	 rDJpFJxmCWjOO+bbwli4YbJ1HSZDt9PVJwNMC4nMLH8/Z/F1IsO0uezm1kwuVuVQKl
	 pQiUc1ojhQRTZGgsaD8q9lvsXmRN9SOHI7dfzRXK2RcEwRj1t59HKxjq93YExWiULW
	 7LR101kcrhgyx4j/QoNLKdGvgcfV9IuqC/NfeSHmPzEFCYMeRKKb8UDHZuwAkVZBNI
	 0bhAn1c2en7cQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AE025C59A4C;
	Thu, 17 Aug 2023 12:50:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169227662570.28155.14202697129071591590.git-patchwork-notify@kernel.org>
Date: Thu, 17 Aug 2023 12:50:25 +0000
References: <4519945.8hzESeGDPO@phil>
In-Reply-To: <4519945.8hzESeGDPO@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 17 Aug 2023 00:02:04 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find a below a collection of fixes for the current release 6.5
> cycle.
> 
> Please pull
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.5
    https://git.kernel.org/soc/soc/c/e7c12167a294

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


