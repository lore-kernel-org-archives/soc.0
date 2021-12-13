Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2238BC4321E
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 23:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F41B5C3460D; Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF24AC3460B;
	Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639438242;
	bh=lV2aKIzVm5V8buQuauyZ2FVuT/DrmFPZUiPdPBG4K7M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=V3alzWwmhqFeCBxUwl6JXdtGZKoFVhP/nW2yBxXB6l8GjUF96/OrlAnfiaK2mQcyo
	 gWL2rn+UObXWJS7W0M4RmcKILbHn8lgTRle+zIZcPCLvaXLPEA1pYX2RR1biL0PwWb
	 YwI/EOLSKF5+hTONnjRxEjpNYO+ER9MXu/xbWhUiwsV2Ag/g4CEyQjnznTq/AXEusd
	 KAGrCC0ORqGQjpq95bwT/OdmJnXw4Olfrp9XcxMJRUhkMGkOyIcbEDRr2wN1tz0j+U
	 z1ll/LS80ly8TnGdrXftlu7pdobabAzINacNW1ERuF+jEepE+xTVMZ+BFRcrLsht31
	 ZnQUdTObqiB9w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BB49060A9E;
	Mon, 13 Dec 2021 23:30:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 5.17 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163943824276.22239.14443841620020951066.git-patchwork-notify@kernel.org>
Date: Mon, 13 Dec 2021 23:30:42 +0000
References: <3637342.7akbv5NDAT@phil>
In-Reply-To: <3637342.7akbv5NDAT@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 13 Dec 2021 11:32:39 +0100 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below Rockchip changes for for 5.17.
> 
> Please pull!
> 
> Thanks
> Heiko
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 5.17 #1
    https://git.kernel.org/soc/soc/c/f3141df0418c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


