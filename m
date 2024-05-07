Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C71C25B79
	for <soc@archiver.kernel.org>; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ABE87C4DDE3; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93747C4DDE2;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715074839;
	bh=NUJ3/nc+Kw7FNZQxaNk+MHjfryEz2t8Exymln+Y4QxM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tAgq9dz3pTs5VK+Q5c6JFtppKiIHp63QZE07k1bv1oASanSJSj1p0J50OaXISAFUD
	 WNJV7JiN41rhmgaoYyUrhTwFqg5gDag5r1kclvpHWjVCvDXM2Fwh17mAJV86dV9yD7
	 AIn/attxq2joYYSazkZ9uaK8iiL7xUUPhlWTLuUsv/VdufwtRFLMGq5q0tEtFEIr3v
	 PB4hzQuwVYmwLg+U4/Rny2GlxnM8HqY1S5jx0sIjSY0XZtch07ejHs83FWKd6tJGp2
	 kU50d+nkWpHh0LCmWwTY08NwHX9mIaA2Xu0FLn0dkLZbsKNT/qeJ8uiKRnChQbfoLp
	 CpD0yrcifSW6g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 883D6C43331;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171507483955.24942.5692272056085977123.git-patchwork-notify@kernel.org>
Date: Tue, 07 May 2024 09:40:39 +0000
References: <CACPK8Xd2Qc9MQUJ-8GuRjmyU50oMHpmmHPHLqAh9W_1Gyqi2ug@mail.gmail.com>
In-Reply-To: <CACPK8Xd2Qc9MQUJ-8GuRjmyU50oMHpmmHPHLqAh9W_1Gyqi2ug@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 3 May 2024 20:53:11 +0930 you wrote:
> Hello Soc maintainers,
> 
> Here are the ASPEED device tree changes for 6.10. I've missed a few
> releases as I was
> on leave. Andrew Jeffery has stepped up and helped this cycle, some of the
> patches were committed by him this time around.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: devicetree changes for 6.10
    https://git.kernel.org/soc/soc/c/aa32dec674bb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


