Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BB9C433EF
	for <soc@archiver.kernel.org>; Tue, 12 Jul 2022 21:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D29FC385A2; Tue, 12 Jul 2022 21:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D526C3411C;
	Tue, 12 Jul 2022 21:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657661420;
	bh=cXBOlthG1qItol61EibbIDUC5maDkiwqmrjn18jEXgM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tPYjjuqcXxA5ZgwcLxlyfcWvUUw8wjQ9jn0QU6BcEM7Txqs1gsdHRRk14CTqc77SH
	 gnxah3AIvE67IM0EXLi+ikj9sJ8vyIPSvKyzozZ3SyHUa7xrvLJPDAv2caG+1x9FUe
	 qHqbGpmORmNP6C1xuXg0siMDahchDRElKK8lBiqtbIloK4SWUbxwHla8KRAo5UetDi
	 +K5r2VVzyu7mF4PXj1NVBAgnbHSZKkm8r5t5vu5ZpOtEjKNnH1Kpu5UEUprjEGNgSw
	 lhai1IszMkJfPz65GCPWL9V83UkP4w0jk3A4yYBujQ2h/rVnFQHXuKi3GIMpPvrR+x
	 uwUWt+X3zf95w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 35706E45225;
	Tue, 12 Jul 2022 21:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/7] Broadcom SoC updates for 5.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165766142021.32298.12968643589018688521.git-patchwork-notify@kernel.org>
Date: Tue, 12 Jul 2022 21:30:20 +0000
References: <20220711164451.3542127-1-f.fainelli@gmail.com>
In-Reply-To: <20220711164451.3542127-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 11 Jul 2022 09:44:44 -0700 you wrote:
> Hi Arnd, Olof,
> 
> The highlights of the pull requests are:
> 
> - William and Anand add support for a large number of Broadband Carrier
>   Access (BCA) DSL/PON/Wi-Fi router chips under the ARCH_BCMBCA umbrella
>   and we expect to see more activity in the future on these chips.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/7] Broadcom defconfig changes for 5.20
    (no matching commit)
  - [GIT,PULL,2/7] Broadcom defconfig-arm64 changes for 5.20
    https://git.kernel.org/soc/soc/c/14376871658a
  - [GIT,PULL,3/7] Broadcom devicetree changes for 5.20
    (no matching commit)
  - [GIT,PULL,4/7] Broadcom devicetree-arm64 changes for 5.20
    (no matching commit)
  - [GIT,PULL,5/7] Broadcom drivers changes for 5.20
    https://git.kernel.org/soc/soc/c/9bc697091a47
  - [GIT,PULL,6/7] Broadcom maintainers changes for 5.20
    (no matching commit)
  - [GIT,PULL,7/7] Broadcom soc changes for 5.20
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


