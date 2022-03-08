Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C982C43219
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2096BC340FD; Tue,  8 Mar 2022 16:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B8F2C340FC;
	Tue,  8 Mar 2022 16:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646757015;
	bh=BT39C8+1fMaATMlSo7fngY/XKLv97MdU/PQ1Y6cU3a8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZAa9P72xe9OWWbFUIJgiCyODCPvlO3bVw60xVuLZGxPnS3KmmIQwDJpIfDShJpapU
	 DLCFQWmheNC3FVl6iNdmj51hBs7MB4kWe7Az4Ly7Lo0JS2IfXrXRENJohiBg19cKCm
	 +/GEJ1aiYnfCYpCG1iOHtvtJ4bQn4iYYLb/J66ZpKccXeR/QWxu+kKG+fIcUOuMs0m
	 GjHRLTD70YbiS17LkQllsNaCIz9GRJW8wjHIjql+b5kCeF/9ensd67+MNfQFp9OdUF
	 hGwJ4+dpbaYzlZchbCH/QWy2PN0VjbEcrmPzymhTBBxL3jHjVaZ5Hkru8MH2br+8oo
	 ypTJL0N/8/ueg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E0217E6D3DD;
	Tue,  8 Mar 2022 16:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm: multi_v5: enable configs for versatile
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164675701491.9628.16810524361559670779.git-patchwork-notify@kernel.org>
Date: Tue, 08 Mar 2022 16:30:14 +0000
References: <20220308121933.3967868-1-anders.roxell@linaro.org>
In-Reply-To: <20220308121933.3967868-1-anders.roxell@linaro.org>
To: Anders Roxell <anders.roxell@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  8 Mar 2022 13:19:33 +0100 you wrote:
> Make it possible to boot a versatile machine in qemu.
> 
> Boot command:
>  /usr/bin/qemu-system-arm -cpu arm926 -machine versatilepb \
>   -nographic -nic none -m 256M -monitor none -no-reboot \
>   -kernel zImage -dtb versatile-pb.dtb \
>   -append "console=ttyAMA0,115200 rootwait root=/dev/vda" \
>   -drive armv5_rootfs.ext4,if=none,format=raw,id=hd0 \
>   -device virtio-blk-pci,drive=hd0
> 
> [...]

Here is the summary with links:
  - arm: multi_v5: enable configs for versatile
    https://git.kernel.org/soc/soc/c/42cc353b54fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


