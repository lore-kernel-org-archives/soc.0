Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E35DC4706C
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3AB1EC433B8; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DFA6C433CD;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=276Dz29oHb0ykCVWG3LINTHS8VN5XgXGXl3DgpOJxpU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IJYsOFKf55S4DnBDUFLkJ41n7P83Ivm9G6Id6vWY1aqVvypuefVeGXKOCUCtKTHhI
	 jtEXzu53VJos0HNxnStshxOQx2lbo0+F6UvnkNMEZfTkMsv5amaMbwktW7V6HZ5zTZ
	 dCtQB9/fG/Ld+6fVTWCHAAVN5xdRp8J/6+bVI3IwtslokA0Q/P8zFRwnz/xMPws8EZ
	 IrGoOOcgB0DS5cVYZufaNLA83z/60BFoVzh+9ohfG/VBvJMouNggZKbZiVOv7hWZOr
	 yoiBGuiFHVpx1GiiPNYVop9F4RqGUEreXLW1eJeOBwK0qKEdQYFtY5Kt94tT156fyf
	 iTN3uihz1Tp4w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 02E23DD4EFC;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046600.3302.5639308381202998669.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <6572C4C8.6050401@hisilicon.com>
In-Reply-To: <6572C4C8.6050401@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 8 Dec 2023 15:24:56 +0800 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: hisilicon dts updates for v6.8
    https://git.kernel.org/soc/soc/c/6fab7e69de6a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


