Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10264C4708D
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F0671C43147; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D888FC43151;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042343;
	bh=MMzp/XTZ1P4V2SjsIW6XRzcKDGQoQZ31I/vd23y0Mzg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MjI4zZZ/vN0h+Wzlt0NV2NikcYxd/bRQ0JYq+YEjDeNL1T5+rwXyI0XV/fFjfKp4v
	 RmIPcVJwpaBs/dZ2JnTO5VdbTjvs3Od/jz7jt/3A06dDFErZYA0gVGqBYluQCH6szw
	 SXaEgUTNO42PL50UXesecbnkfvMw6+s6PeoQrhq/mtSENDU/+FNdDjE6HgRw2fTqun
	 0NhGsMbXhqdVtPcSLMBMafEsiVWix5PtTJZbKIKU4JJTG35ik2fMR28TX5+B6N9sXE
	 j/sz37mj8EqigYW6BUU3kWTmD+uN3eXVRX1xPq0vGb+9FrE7BFpNGFU/n42RP34yhC
	 NzujzANcVMEqg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C2A59E29F41;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] i.MX drivers change for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904234378.4359.15258101862681309479.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:52:23 +0000
References: <20221119125733.32719-1-shawnguo@kernel.org>
In-Reply-To: <20221119125733.32719-1-shawnguo@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 19 Nov 2022 20:57:28 +0800 you wrote:
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] i.MX drivers change for 6.2
    https://git.kernel.org/soc/soc/c/26a1200241f8
  - [GIT,PULL,2/6] i.MX SoC change for 6.2
    https://git.kernel.org/soc/soc/c/54721ff7d696
  - [GIT,PULL,3/6] i.MX dt-bindings update for 6.2
    https://git.kernel.org/soc/soc/c/3a8a1ab8f444
  - [GIT,PULL,4/6] i.MX arm device tree update for 6.2
    https://git.kernel.org/soc/soc/c/4be0308a5196
  - [GIT,PULL,5/6] i.MX arm64 device tree update for 6.2
    https://git.kernel.org/soc/soc/c/efa0b8251f95
  - [GIT,PULL,6/6] i.MX defconfig change for 6.2
    https://git.kernel.org/soc/soc/c/972d89438dc9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


