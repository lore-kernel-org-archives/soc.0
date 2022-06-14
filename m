Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB5ECCA487
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7CBADC341CC; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61D45C341CD;
	Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655238815;
	bh=y/MgrX41YqJTd6FLXNLvo/YlQzxcC3Xc8JmqtKXZYLU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Jk8LbC03g2hFIiu+Xmzx0FiCXLnuFxDweuKmBZa0LxbygiU5ryrgHeMvtxNMQCN3w
	 AjUEpV/Cz1U73660CSD64EiiykcLUPdgbQloK83rAzivUcavsMbKsmW7pzUOXuMM00
	 xQNE62n76FA54T6+ILhp1Bk3Cjq2gQv976gRUA1GX4O0NFDOg6iPGdf96CWD6hUJLE
	 KoOD620f32EvIiakhNIr2KqZ89ad94mZl+a3eX9+4fduQflv2w0AimiEnCJbnX5QFx
	 UR0hvgjepfwxLmZe0hXp9aoDpgnsUzAKc/7jlLNd3Ct0IP7FPXMmvCsauqtXYF/lLr
	 /P6J/pe/bIRwQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4964AFD99FF;
	Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH] ARM: Fix refcount leak in axxia_boot_secondary
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165523881529.29335.5121149300038266463.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jun 2022 20:33:35 +0000
References: <20220601090548.47616-1-linmq006@gmail.com>
In-Reply-To: <20220601090548.47616-1-linmq006@gmail.com>
To: Miaoqian Lin <linmq006@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  1 Jun 2022 13:05:48 +0400 you wrote:
> of_find_compatible_node() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when done.
> Add missing of_node_put() to avoid refcount leak.
> 
> Fixes: 1d22924e1c4e ("ARM: Add platform support for LSI AXM55xx SoC")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> 
> [...]

Here is the summary with links:
  - [RESEND] ARM: Fix refcount leak in axxia_boot_secondary
    https://git.kernel.org/soc/soc/c/7c7ff68daa93

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


