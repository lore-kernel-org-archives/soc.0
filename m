Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18481330675
	for <soc@lists.linux.dev>; Mon, 20 Apr 2026 16:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776700803; cv=none; b=auD8XfbBoRKJjksdVB+l6GA1Jk50WkTao43pcPBUE4plglFjbnfipi+19PsTOL1POGfA4/BHDJJEhJINhFVt2hSBc1si3RHRltWh3/yM/wjOHDJB0uvNEUzWVtPz0ordMPMm8lAXAwigXQfKAOD/QeaKHoBm0bSKL5xPBbayy3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776700803; c=relaxed/simple;
	bh=qaYpcylcIjjfx0olwxsAN3mwAZ9fv6P9oCOoLtDC5tU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=JJAPnREMbTX8yzVKiAFL54MPGPNpi4Tn44bYXiqcvHP/Y5lFVxp+N+GPUKSLkplt5aPSQePLUdFonmjLdpZJcltOWvUi1fB55NCvnXZfiop5Szxa+mawgvIiKA/dDBM8tgfNh6Wjuj5MeLt80HKbD1GYJQ584oNizwE/IxyFUMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vi0lcaHx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vi0lcaHx"
Received: by smtp.kernel.org (Postfix)
	id EF747C2BCB6; Mon, 20 Apr 2026 16:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8427C19425
	for <soc@kernel.org>; Mon, 20 Apr 2026 16:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776700802;
	bh=qaYpcylcIjjfx0olwxsAN3mwAZ9fv6P9oCOoLtDC5tU=;
	h=Subject:From:Date:To:Cc:From;
	b=Vi0lcaHxr8MMi8CifXMF83mKvH8hARcyDTP099S/3UjE11mzDXqput9kM9S/riwpe
	 lPGo77eaN6EdvGiQE87BqbaUZ9JrB/sFP9TJdm4qRwKiWJf3Sm+nCF/SXX2i2CO5yn
	 xdHMakrlh9KNsWyI+RGTlCFajyBYKtOZIcqenkcuzcaO6hlHRcVGw7CuvyMuOQfbG6
	 thm56dQruRtN0iIr72aSUQGCKeRMYZPLGAEwwzhi/4OTD4CbArvBCa7zyjkTlEPa0n
	 5fCF9fgEFHL2PMgBFafD/2+JnUdbWMHfF/GWTAuNyeIAFZMMuabBnsUXR6hyQO/wy1
	 JcJ3ltVfClT7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D18F393000C;
	Mon, 20 Apr 2026 15:59:28 +0000 (UTC)
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
 <177670076717.1706382.7916502139257206694.git-patchwork-summary@kernel.org>
Date: Mon, 20 Apr 2026 15:59:27 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [1/2] Documentation/process: maintainer-soc: Trim from trivial ask-DT
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1080532
  Lore link: https://lore.kernel.org/r/20260413074401.27282-3-krzysztof.kozlowski@oss.qualcomm.com
    Patches: [1/2] Documentation/process: maintainer-soc: Trim from trivial ask-DT
             [2/2] Documentation/process: maintainer-soc: Document purpose of defconfigs

Patch: [v2] ARM: dts: bcm4709: fix bus range assignment
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1080999
  Lore link: https://lore.kernel.org/r/20260414064754.3129667-1-arnd@kernel.org

Patch: [GIT,PULL] Apple SoC fixes for v7.0
  Submitter: Sven Peter <sven@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1081287
  Lore link: https://lore.kernel.org/r/20260414202428.5278-1-sven@kernel.org


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


