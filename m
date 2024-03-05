Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9611BC54E41
	for <soc@archiver.kernel.org>; Tue,  5 Mar 2024 17:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79B7AC43394; Tue,  5 Mar 2024 17:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63C27C433F1;
	Tue,  5 Mar 2024 17:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709659229;
	bh=FBZ35HUyIlqOCy0U1IGMOd4AzOzI8O01zLPeAy3Rp+0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=e22FnyiTeKTMJHtoClsfdfrDJUkmURlv4pmOEvEdgQQtVElVRqeB8tCI/t+Wlr8VI
	 cQlHoY/YkyRPjai60SgUqSpn/YGu9N9GGPE3k3RvzLwnk7ut1fbiOGTRRUt50WaxgG
	 3MYXjEEn8L6D8ZwUA6xHLhtEpU03tmHUXI37LL2m90L5iX7B+IcIC57P2Cg8Ng+oKK
	 lAPA2FdatHfKucDCmovImQ+dZGfHWEzy+WbZDK8vomuyJios4TiBacP6NAP/enHy+o
	 rThP39yeL/jIsmzXhP2wqjBAYbC02nXQgshdlImovuZqVfnVpFEhN/4YeO6S8h9i5p
	 df4hr/s7Da4ew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 47F53D9A4BB;
	Tue,  5 Mar 2024 17:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: Enable support for cbmem entries in the
 coreboot table
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170965922928.19661.8392489385089852319.git-patchwork-notify@kernel.org>
Date: Tue, 05 Mar 2024 17:20:29 +0000
References: <20240304-coreboot-defconfig-v1-1-02dc1940408f@collabora.com>
In-Reply-To: <20240304-coreboot-defconfig-v1-1-02dc1940408f@collabora.com>
To: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado_=3Cnfraprado=40collabora=2Ecom?=@ci.codeaurora.org,
	=?utf-8?q?=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 04 Mar 2024 13:28:35 -0500 you wrote:
> Enable the cbmem driver and dependencies in order to support reading
> cbmem entries from the coreboot table, which are used to store logs from
> coreboot on arm64 Chromebooks, and provide useful information for
> debugging the boot process on those devices.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> [...]

Here is the summary with links:
  - arm64: defconfig: Enable support for cbmem entries in the coreboot table
    https://git.kernel.org/soc/soc/c/d8999d151e41

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


