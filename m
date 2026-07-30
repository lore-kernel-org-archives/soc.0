Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA743ED13F
	for <soc@lists.linux.dev>; Thu, 30 Jul 2026 09:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405066; cv=none; b=YQ50auN//l8fehqnonrqUahx2/qHE5XR29rVtaD85pJqhYCvuXecEvkit7GeZWMgvMed2mEPtW1PfOOh+bF+k+sv8uXl70b21JWPM+8Z3Hn/Z4M2L/hIa2kZ+uQFcxQVvo/Hz44qQhZgzQqfXOvHAA7NM/4cjanjChDg/KHzj5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405066; c=relaxed/simple;
	bh=x4gBOk6pdGCnlwLKG2PxxGO9OGoPit7dUmVSSPDtC5Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=nlSlEo3gYu1E0tO9AfJJ/mYOp/dCMT883ug7FfN9+q+TiaIT6xoSH69yaXjoCYR4OJy7ekmY/JcSXgrhJiV9kDutRyu2JBCF0eTQzogAKuDeV5L98sP9Tyg39+saPKs118A64xhJYUcy1oC2Jl97V2qRGZhTbeXSALMgpaePE+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mie/GVhV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mie/GVhV"
Received: by smtp.kernel.org (Postfix)
	id 04C181F00A3D; Thu, 30 Jul 2026 09:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37FE1F00A3A
	for <soc@kernel.org>; Thu, 30 Jul 2026 09:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785405064;
	bh=LG89vuooOP1DTHRDaBnE2dgWBqfpXOaDMCQ4GfkKpcQ=;
	h=Subject:From:Date:To:Cc;
	b=Mie/GVhVLNSVvJgHHlMFNaxiC77xE2psM7iBW8BYlwIEctg0UeTQ/ftpDF3s9DFKT
	 OQmAX0JL0hag0+/VS123lbrKJssqP6WtLpqKkH6rY2DjJ8er5+X4JtN+mZMBRbn9xA
	 cUgds1wUYu5+vc1RSKSP4MglB17RJRgT3RTXcYQ/p2qqOfvSaBpMmbGSG7tLGvf9KC
	 SMzEcrYg5bvrydjM6FImpzrF5uIq3h1sik35rUvr4AL1eHKrM7iqKit3M12WELGNOr
	 QkmlDUhGMmLuHwNF5dOPJdcpUwu2UYDRxGdQFs0xnimLRQZucYE8oC7vt5t9zt+XO7
	 +pIH0Hu1Lc00Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B0B381195C;
	Thu, 30 Jul 2026 09:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178540502829.3469699.2349787020457254303.git-patchwork-summary@kernel.org>
Date: Thu, 30 Jul 2026 09:50:28 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for 7.2
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1137034
  Lore link: https://lore.kernel.org/r/20260730020642.68595-1-andersson@kernel.org

Series: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v7.3
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1137220
  Lore link: https://lore.kernel.org/r/20260730083249.13867-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v7.3
             [GIT,PULL,2/3] MediaTek ARM32 Device Tree updates for v7.3
             [GIT,PULL,3/3] MediaTek SoC driver updates for v7.3


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


