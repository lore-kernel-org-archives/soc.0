Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87ACFEE49AC
	for <soc@archiver.kernel.org>; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16E9EC433C8; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E80A8C433C9;
	Tue, 22 Aug 2023 02:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692671475;
	bh=UvfpXzrjR19fQq6dl/nYQDTDP+vMXHutJeekLJNFohs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=f8MF2zaPVzTcBgCzdA5r6d11ccNbwbX+GUYPGno5537Cj0kBKxm7aJQ50Ge3L310e
	 BE1CTjeKSYgL92WhemA4ghgRblahe1jj9Mm2d14Ot071p464e+kTHIS24/l94JHR0T
	 cIyDzPJq+rgJP4FyBlVfbIr38nRkdu4X9xssNON5qTtqhFFEpWQzAnlr1MVFBqumU5
	 pUv9iVuGAGN5wFQD94kt5RZCE2K8fJXHOZ7JI08VU5/7VWUH7PFy6R3t2aNDFaoLZV
	 2FZKHXUQoMmtX/tSa6ScUhPkYQUfByc5FSzcLXBgPVX4LaEDWhDn7KC2SwGZdlAI6O
	 6jykRgZhjmZeQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C7D23E4EAF9;
	Tue, 22 Aug 2023 02:31:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 0/2] soc: loongson2_pm: add power management support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169267147581.32531.1050555529477221419.git-patchwork-notify@kernel.org>
Date: Tue, 22 Aug 2023 02:31:15 +0000
References: <20230803063703.5659-1-zhuyinbo@loongson.cn>
In-Reply-To: <20230803063703.5659-1-zhuyinbo@loongson.cn>
To: Yinbo Zhu <zhuyinbo@loongson.cn>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  3 Aug 2023 14:37:01 +0800 you wrote:
> Loongson-2 platform support Power Management Controller (ACPI) and this
> series patch was to add PM driver that base on dts and PM binding support.
> 
> Change in v6:
> 		1. The patch "[PATCH v3 1/3] loongarch: export some arch-specific
> 		   pm interfaces" had been merged into mainline tree in v6.5-rc1
> 		   thus this v6 series patch need drop it and need depend on it
> 		   and it's patch link was:
> https://lore.kernel.org/all/20230615091757.24686-2-zhuyinbo@loongson.cn/
> 		2. Adding Ulf Hansson to Cc.
> 		3. Adding soc@kernel.org to Cc.
> 		4. Keep indented with one tab +2 spaces in Kconfig help text.
> Change in v5:
> 		1. The patch "[PATCH v3 1/3] loongarch: export some arch-specific
> 		   pm interfaces" had been merged into linux-next tree thus this
> 		   v4 series patch need drop it and need depend on it and it's
> 		   patch link was:
> https://lore.kernel.org/all/20230615091757.24686-2-zhuyinbo@loongson.cn/
> 		2. Swap the positions of compatible for 2k1000 and 2k0500.
> Change in v4:
> 		1. The patch "[PATCH v3 1/3] loongarch: export some arch-specific
> 		   pm interfaces" had been merged into linux-next tree thus this
> 		   v4 series patch need drop it and need depend on it and it's
> 		   patch link was:
> https://lore.kernel.org/all/20230615091757.24686-2-zhuyinbo@loongson.cn/
> 		2. Remove the pmc label in dt-binding patch.
> 		3. Add the Co-developed-by for driver patch.
> 		4. Simplify the loongson2_suspend_valid_state that "return
> 		   (state == PM_SUSPEND_MEM)".
> 		5. Use Using loongson2_pm_irq_enable() to replace.
> 		   loongson2_power_button_irq_enable().
> 		6. Remove the "oneOf" in dt-bindings patch.
> 		7. Replace "suspend-address" that use "loongson,suspend-address".
> 		8. Use u64 type that for "loongson,suspend-address".
> 		9. Rename "pm" to "power-mangement" in dt-bindings patch.
> 		10. Add the reivewed-by for dt-bindings patch.
> Change in v3:
> 		1. Reword the [1/3] patch commit log and title.
> 		2. Use the old naming for suspend interface for the [1/3] and
> 		   [3/3] patch.
> 		3. Combine some small function in the driver patch.
> 		4. Rename 'pwrbt' to 'button' in the driver patch.
> 		5. Use the specific compatible in yaml file.
> Change in v2:
> 		1. Fixup the "suspend-address" description.
> 		2. Remove the "return -EINVAL" in PM driver probe when firmware
> 		   no configure "suspend-address" property in dts in oder to
> 		   other PM state to work.
> 
> [...]

Here is the summary with links:
  - [v6,1/2] soc: dt-bindings: add loongson-2 pm
    https://git.kernel.org/soc/soc/c/6054a676e969
  - [v6,2/2] soc: loongson2_pm: add power management support
    https://git.kernel.org/soc/soc/c/67694c076bd7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


