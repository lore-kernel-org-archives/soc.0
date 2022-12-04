Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7378EC4708E
	for <soc@archiver.kernel.org>; Sun,  4 Dec 2022 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3CE6FC43470; Sun,  4 Dec 2022 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27711C433D6;
	Sun,  4 Dec 2022 12:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670156416;
	bh=ZBQaouFEry4D4maJb55ukgdtaTW4RYgLyYiKTbiywms=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=uN80DcMOqhJco6j0jA8hfoa6CgT6QVSSQ5hpBcBn1pvLPKUQlLH8kYiAgibr91bL8
	 s/ZCbSx4O8a7Wgq8Hqxw6Yd25m4xI8gUeadT9+58b4v9Iq8Q4O/vtnkk9DMDQOlEM0
	 kFyZbloG+9cnM2VmDosHyjfv0g22JJNm1LpadEc6EbF8cu89p9Md4JlDLKTjSX58vZ
	 UbRzb/+VU+2C2VVtWbX9M3ggjlCBo1H+YkbpGPPTiiJePzCeuzRlc21lKrVJF4w36f
	 k48377rK26EUwqif4szXLEIMMYsEb4BtfI3tGpgFkf0Dx8Oisj2REWS1+Vx7R86own
	 2lLgcNztdI18w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 013F6C41622;
	Sun,  4 Dec 2022 12:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: =?utf-8?q?=5BPATCH_linux-next_v2=5D_pxa=3A_Remove_dev=5Ferr=28=29_a?=
	=?utf-8?q?fter_platform=5Fget=5Firq=28=29?=
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167015641600.6046.11022950979316748717.git-patchwork-notify@kernel.org>
Date: Sun, 04 Dec 2022 12:20:16 +0000
References: <202212021042043546303@zte.com.cn>
In-Reply-To: <202212021042043546303@zte.com.cn>
To:  <zhang.songyi@zte.com.cn>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 2 Dec 2022 10:42:04 +0800 (CST) you wrote:
> From: zhang songyi <zhang.songyi@zte.com.cn>
> 
> There is no need to call the dev_err() function directly to print a
> custom message when handling an error from either the platform_get_irq()
> or platform_get_irq_byname() functions as both are going to display an
> appropriate error message in case of a failure.
> 
> [...]

Here is the summary with links:
  - [linux-next,v2] pxa: Remove dev_err() after platform_get_irq()
    https://git.kernel.org/soc/soc/c/1d9ae5a1356a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


