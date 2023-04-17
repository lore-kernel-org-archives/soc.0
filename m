Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CCFC77B7F
	for <soc@archiver.kernel.org>; Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C05BC433A0; Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FD10C433D2;
	Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681746620;
	bh=sMha20F9/eglnnHpTW0ou9w/LvgB85qI5zS4vHAarj4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NJ9yrmdjVzJFjccaA8s55LrE6qvxJg8IqAh8N1NC8b3x8ub+CVuN7U8fehdOObs7Z
	 qrwS9l7VhA3iABEl1RFlUVQkBYT/jdlG4CVQa75aC2g+zso9G/Kirmx2HhYGgHBy4b
	 dnFWADDJYc3DuOMYt/VLeb0TkCfEdsCKOnOG/o9bjqMdXvHrgapgCd/KoWuxpaYPr2
	 2T4O0ZuHDRw6P4953qHAV5L6ZXQz0fJRAwZo4r8fhgrrjbEsb+nU2nN57UXxxRiBRA
	 yaUVdOZtI7AA91d8IrgEzdkyY0EzwN8L3taaYco9VqCfsZWSPXktSHUZdL+jJd5ax1
	 zz4BvAPUMU6dQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6150AE4508C;
	Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: vexpress: Update for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168174662039.17676.10574595806243864673.git-patchwork-notify@kernel.org>
Date: Mon, 17 Apr 2023 15:50:20 +0000
References: <20230417145724.1904259-1-sudeep.holla@arm.com>
In-Reply-To: <20230417145724.1904259-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Apr 2023 15:57:24 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: vexpress: Update for v6.4
    https://git.kernel.org/soc/soc/c/1aa88541a2d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


