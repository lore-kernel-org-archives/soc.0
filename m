Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F3EC6FA96
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14966C433D6; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F108CC43143;
	Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663950027;
	bh=ZaZoNVvN6QxNaXQSrh7gmi8GqABRTG5Hs5yyppbOJn0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kokGn3koMGy4vlY/FGdOtszhFlhURoZIoCQstxnz8QyMaIO1bz24rmNKcrhn1Mr7D
	 CauN+xu8Mawv+yrwVFJFmMMBm+FlP1BKc9K1DHupZMqFzc6EfVTeLu9HH0xJ4iRTIB
	 21k3l53C6BnU40bsXC4fwUHMid4owkZOPTXuvbwBLZ3POYfQV7/6cCF1k8shWSYXag
	 I81VVfUg2yuaW6UtB8QAlNu/BWeqmu7BlzIPVIiJ0l74vgK1iSnyAEMQoYWItQboPt
	 le5FXNDnkiaikD5s9I4/VPQe8w0rL261mB8Hj8sYR13AylvEXJjE7kL9A1Ag51Ve8j
	 CwZbwonul7sYQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DDF28E52505;
	Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/5] Misc hisi_lpc changes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166395002690.3905.9230642769914497700.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 16:20:26 +0000
References: <1662366186-233933-1-git-send-email-john.garry@huawei.com>
In-Reply-To: <1662366186-233933-1-git-send-email-john.garry@huawei.com>
To: John Garry <john.garry@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Wei Xu <xuwei5@hisilicon.com>:

On Mon, 5 Sep 2022 16:23:01 +0800 you wrote:
> Hi Xu Wei,
> 
> This is a series of small improvements to the driver from Andy
> and myself.
> 
> Andy sent his patches originally in the following:
> https://lore.kernel.org/lkml/20220708210859.6774-1-andriy.shevchenko@linux.intel.com/
> 
> [...]

Here is the summary with links:
  - [v3,1/5] bus: hisi_lpc: Don't dereference fwnode handle
    https://git.kernel.org/soc/soc/c/947f11d153f2
  - [v3,2/5] bus: hisi_lpc: Use devm_platform_ioremap_resource
    https://git.kernel.org/soc/soc/c/23bea44cd00c
  - [v3,3/5] bus: hisi_lpc: Correct error code for timeout
    https://git.kernel.org/soc/soc/c/5e3e70b8e1ae
  - [v3,4/5] bus: hisi_lpc: Don't guard ACPI IDs with ACPI_PTR()
    https://git.kernel.org/soc/soc/c/e8cd65061fac
  - [v3,5/5] bus: hisi_lpc: Use platform_device_register_full()
    https://git.kernel.org/soc/soc/c/4678a2d352e0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


