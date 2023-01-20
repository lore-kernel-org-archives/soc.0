Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF95C05027
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 10:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D41D8C433A1; Fri, 20 Jan 2023 10:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE44BC4339B;
	Fri, 20 Jan 2023 10:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674209417;
	bh=2TXciqa3DsKV5i6vMlNxuNID3eXlbcIabmuKm0MzeGo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=NQzqkDSENEv7kQtRqIezo39k9MaQTR3/5B9qiIEDp46tht4WiTDdZOiXk7Uh8dkuQ
	 MzewAfV2q7poYJbAuOYAsBh7DucXPx/EEjTvufWCbWtsIAe2xpcQqm5x2n5eOOkfgR
	 l4RXlPtYniUPYGVuuuHLEmTA1jTosAWuc3TwbLwfr3ZlDaIZEBILW0qCS22ShSK8/o
	 mru16qH+ZZswr7JYgvhPKzSNjStFbdPfBpLEH5Uj6oUzFBoF66AZ89MQSvuaRSt1xd
	 EtXXJbVx4bS1BU2oJ4YJkGKCrcZYDfQBRbD6hvuudt7FCepUo/Vp8XCwE3KIg3EY5o
	 5VEeZFLysz2MA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9EAB6E54D2B;
	Fri, 20 Jan 2023 10:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] firmware: zynqmp: fix declarations for gcc-13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167420941764.17943.17068912346898242848.git-patchwork-notify@kernel.org>
Date: Fri, 20 Jan 2023 10:10:17 +0000
References: <20230117164133.1245749-1-arnd@kernel.org>
In-Reply-To: <20230117164133.1245749-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 17 Jan 2023 17:41:14 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-13.0.1 reports a type mismatch for two functions:
> 
> drivers/firmware/xilinx/zynqmp.c:1228:5: error: conflicting types for 'zynqmp_pm_set_rpu_mode' due to enum/integer mismatch; have 'int(u32,  enum rpu_oper_mode)' {aka 'int(unsigned int,  enum rpu_oper_mode)'} [-Werror=enum-int-mismatch]
>  1228 | int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode)
>       |     ^~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/firmware/xilinx/zynqmp.c:25:
> include/linux/firmware/xlnx-zynqmp.h:552:5: note: previous declaration of 'zynqmp_pm_set_rpu_mode' with type 'int(u32,  u32)' {aka 'int(unsigned int,  unsigned int)'}
>   552 | int zynqmp_pm_set_rpu_mode(u32 node_id, u32 arg1);
>       |     ^~~~~~~~~~~~~~~~~~~~~~
> drivers/firmware/xilinx/zynqmp.c:1246:5: error: conflicting types for 'zynqmp_pm_set_tcm_config' due to enum/integer mismatch; have 'int(u32,  enum rpu_tcm_comb)' {aka 'int(unsigned int,  enum rpu_tcm_comb)'} [-Werror=enum-int-mismatch]
>  1246 | int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode)
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/firmware/xlnx-zynqmp.h:553:5: note: previous declaration of 'zynqmp_pm_set_tcm_config' with type 'int(u32,  u32)' {aka 'int(unsigned int,  unsigned int)'}
>   553 | int zynqmp_pm_set_tcm_config(u32 node_id, u32 arg1);
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - firmware: zynqmp: fix declarations for gcc-13
    https://git.kernel.org/soc/soc/c/d2c865553adb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


