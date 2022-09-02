Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4515FC54EE9
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 11:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14B93C43140; Fri,  2 Sep 2022 11:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8ED7C433D6;
	Fri,  2 Sep 2022 11:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662116418;
	bh=xho/dyzHJCvaMnojqRFN8IC82xCQzVy81oLOiBUbbIw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=J703fZvk+pQRb/2tyHI1FcXtbroNq3pnqW1kcaupDgf4OaoN2c+tLyA44lCr+4iH9
	 KQCBDueKZ40agjVlwr2mcw3LYuZgXnVnf3G14Ur38IbvN9yS+orp4+sgf+F2O8huCn
	 9mIO+ykE2klF4Y3XDBPAIYH3joexGo8faJgE5CeJBCpeOvBULD/Phaz7Rwc/7Vsj1L
	 LmSd2cuq78jxdL40dFQj/ngO+IDqjpJrMclnOUfLgDEAkhxzpHomjduJkubiY8Xe0r
	 UQQ1Vc8QUfx+i5XjkT9diBPkvwTzxMGvbNeVu1HdBDkYX80hDe9ylIOOMd8ZPpwV4p
	 5oDvECIamK5Ag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CC5F8E924D5;
	Fri,  2 Sep 2022 11:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: juno: fixes for v6.0-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166211641783.12856.5112602683268909046.git-patchwork-notify@kernel.org>
Date: Fri, 02 Sep 2022 11:00:17 +0000
References: <20220829174420.207880-1-sudeep.holla@arm.com>
In-Reply-To: <20220829174420.207880-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 29 Aug 2022 18:44:20 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: juno: fixes for v6.0-rc1
    https://git.kernel.org/soc/soc/c/92c7c5b0f958

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


