Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D261346A18
	for <soc@lists.linux.dev>; Wed,  7 Jan 2026 17:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767805410; cv=none; b=tKRwtCji5tcgQV5cPIpFcXfx8E+SYlaLUK4OyKHmFgSFqz3u/lWoDFMGDduUXN0bOCsUo3HKeYvYMEqVn8CA4RRnxbagnq10DVw7fozCfGN2e59b9IBqKYfK+pjgo4nF5CaF8zjkXzZ0w6BSmeAK39vft+0w3Y6nmBc/ggIvqi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767805410; c=relaxed/simple;
	bh=gvjLsqstr5dgJk7PLp5BVvTU0CmLQJNpzmpqN/XR850=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=LPmPsuWr3qPFXEY693gmcUKB+74/WhoJTEai2Ywch+gsygFys57DpQVApt6P+wwHEdrfY9/V1s6vVzASWIVzXMjkeQJIBY0u5ktNHPThkQpHtCcruPmbFiF2jeoZjETETGSy4CJFdSd7RwfjG7tQ4Q9CNj1CPjCDEgT8MTfP+wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDoo2zBL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDoo2zBL"
Received: by smtp.kernel.org (Postfix)
	id DEA93C19422; Wed,  7 Jan 2026 17:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8903C4CEF1
	for <soc@kernel.org>; Wed,  7 Jan 2026 17:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767805409;
	bh=gvjLsqstr5dgJk7PLp5BVvTU0CmLQJNpzmpqN/XR850=;
	h=Subject:From:Date:To:Cc:From;
	b=FDoo2zBLWcfCyqeiSSu4QKOckE//GRM3pHW9kdKmkPKOrv3NBMvXZEyeG08T5a2gN
	 oKvgyiVIPYTU9BMF1e5zyTqfRdqpoNqHdAQYob2ipw9hk2gOm3k4lLr+q0Ww2abrvJ
	 /Ak14y67ssK60hr2VcaB/DeanSH5o4xxyh9L81FBmEVNRtqRjyBGGc6M+F3p24+gpk
	 aaC+B9cxA0Le9NOWZlky1KHtopMHEfEHG+JVCfOhfIMXHEHEI8DbOs1iX9zUIoecM/
	 Z78z1NUrhxDKwV4hgbI6FMhVOKZDvDICEJ0K9EFM8rKOLPeIiGDAjTEv2WSNGh/ftP
	 25ahAflvzN/PA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 052353A40FD9;
	Wed,  7 Jan 2026 17:00:08 +0000 (UTC)
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
 <176780520648.2859028.16337561819404579166.git-patchwork-summary@kernel.org>
Date: Wed, 07 Jan 2026 17:00:06 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] i.MX fixes for 6.19
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1037534
  Lore link: https://lore.kernel.org/r/aVSX6SK_LADf1ti4@dragon

Series: [1/2] Documentation/process: maintainer-soc: Be more explicit about defconfig
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1036085
  Lore link: https://lore.kernel.org/r/20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com
    Patches: [1/2] Documentation/process: maintainer-soc: Be more explicit about defconfig
             [2/2] Documentation/process: maintainer-soc: Mark 'make' as commands

Patch: arm64: dts: hisilicon: hikey960: Drop "snps,gctl-reset-quirk" and "snps,tx_de_emphasis*" properties
  Submitter: Rob Herring (Arm) <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1038650
  Lore link: https://lore.kernel.org/r/20260105174002.2997615-1-robh@kernel.org

Patch: [GIT,PULL,1/1] Broadcom devicetree-arm64 fixes for 6.19
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1035204
  Lore link: https://lore.kernel.org/r/20251219204603.1016528-1-florian.fainelli@broadcom.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


