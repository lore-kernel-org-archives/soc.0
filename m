Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F142C47073
	for <soc@archiver.kernel.org>; Tue,  2 Jan 2024 10:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD47BC433CA; Tue,  2 Jan 2024 10:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3703C433C7;
	Tue,  2 Jan 2024 10:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704190267;
	bh=XQ7jcrGtWRhwGgbzRX5f3D4zARVSx4QdLCg42IFH6YM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EmtX39SvvTiBPJMm/tqTeL6nh31POADAxNzAmvxKaYOij+HJrjxnVbbBPRhIgzorH
	 yKzXRhnBFKhbyDd5kbbglvjTE5ohI1UA3QVED+EdxRINaB1XBcwuWtrfqUcPVNq62a
	 39ikj7xGd5n2aUw2/Z3sC5Shn65xHhVbr3sMnV2gZLFoFYzuVL2miFBMIzmJewoh1m
	 7mzdpNAXSxNVZ4XCkXf23lQuExcqMPdfCXn+5T0GN4cg6qi2ZU5brMr+VEwEdPeoq/
	 ni2Dtl10dl5wkRLQIM8HrNkJiC5ypeCQpKAsJ2idOsiPxegZ6STYj3qyu6zvXYALZJ
	 HoDTzYWDwZ2JA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A7BA6C395F8;
	Tue,  2 Jan 2024 10:11:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V2 1/2] ARM: sun9i: smp: Fix array-index-out-of-bounds read in
 sunxi_mc_smp_init
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170419026768.6407.4152099553644908189.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jan 2024 10:11:07 +0000
References: <20231228193903.9078-1-wahrenst@gmx.net>
In-Reply-To: <20231228193903.9078-1-wahrenst@gmx.net>
To: Stefan Wahren <wahrenst@gmx.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 28 Dec 2023 20:39:02 +0100 you wrote:
> Running a multi-arch kernel (multi_v7_defconfig) on a Raspberry Pi 3B+
> with enabled CONFIG_UBSAN triggers the following warning:
> 
>  UBSAN: array-index-out-of-bounds in arch/arm/mach-sunxi/mc_smp.c:810:29
>  index 2 is out of range for type 'sunxi_mc_smp_data [2]'
>  CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.7.0-rc6-00248-g5254c0cbc92d
>  Hardware name: BCM2835
>   unwind_backtrace from show_stack+0x10/0x14
>   show_stack from dump_stack_lvl+0x40/0x4c
>   dump_stack_lvl from ubsan_epilogue+0x8/0x34
>   ubsan_epilogue from __ubsan_handle_out_of_bounds+0x78/0x80
>   __ubsan_handle_out_of_bounds from sunxi_mc_smp_init+0xe4/0x4cc
>   sunxi_mc_smp_init from do_one_initcall+0xa0/0x2fc
>   do_one_initcall from kernel_init_freeable+0xf4/0x2f4
>   kernel_init_freeable from kernel_init+0x18/0x158
>   kernel_init from ret_from_fork+0x14/0x28
> 
> [...]

Here is the summary with links:
  - [V2,1/2] ARM: sun9i: smp: Fix array-index-out-of-bounds read in sunxi_mc_smp_init
    https://git.kernel.org/soc/soc/c/e7322fcaacef
  - [V2,2/2] ARM: sun9i: smp: fix return code check of of_property_match_string
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


