Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058AF3E3D85
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 03:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033824; cv=none; b=ZyHTjtBry0n+iUea0sFwUQSP8FupEift40aaM0Q1rHg1jEeZmQHbt8lsRzuWbF3sqcrnucUsdo1RJxLsucNZPe9MOqGgGxxwce5l1bzm4SnzR8dcyxnkjW1xyErLoL3CPiLXVVxo2AeGbgHns/62kHcgG5KzVpZspBDD9UK6jJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033824; c=relaxed/simple;
	bh=0AMLTqgttnMsOhUiRLl+TZZxVHcsnZufu6aR1g9IR4o=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=lBVlCYPfDxR6ahIpCKhwc2ROOCF5Y5fvXrRyiGHvbqaPp8up5wasKBsOxach1Jwqf8ZastG0dpn0YfdHn/wkJ5rFMsnibpWoytukgTlTYatEytqvixlt57N4fMOeOyaoPwzeZjPvykUApLmDaJ3tV2RNoDX5ja3kLh39VzfYaBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GFJ8l+SK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GFJ8l+SK"
Received: by smtp.kernel.org (Postfix)
	id 00CF91F000C5; Thu, 15 Oct 2026 03:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5A71F000C4
	for <soc@kernel.org>; Thu, 15 Oct 2026 03:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792033819;
	bh=YF9bcYnHTFV0q5bHnQwLlDBLhQihBKYuQVsC/UcvZGY=;
	h=Subject:From:Date:To:Cc;
	b=GFJ8l+SKWJ1NAANCONSh3kt61mhmenrqY2Ubo0DF1BGpVejjU1OFOpAjdlx5febPa
	 +DbOaWQ0Mq0EvbPIfoTIW+BXL0iPKtjjKWMbCDs7+9kfgjKTB6vZsTfC8uy1cIP/ue
	 Bhds4jfiTUTpJ7PkeOr1K9JMwbrZFCLAHElYWzBnEgLV6fTBmsQxL0rUp6nHOpJ8Ap
	 jiGPVmPM3ReWMR8hhgDUxZNjuqrbCHOoqGLbVFuKfZCIdY01k70I5Y1J/ejy0En/5j
	 9rTcYjS/y1Up7PYo5AzyqAK1uEdjkcuH0alKy3gxlvr6CwmDPqkpTuOSSaC3HGMsY7
	 nOcyQ8gtwULhQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B6F89392E992;
	Thu, 15 Oct 2026 03:10:19 +0000 (UTC)
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
 <179203381813.3155468.8618238026449619902.git-patchwork-summary@kernel.org>
Date: Thu, 15 Oct 2026 03:10:18 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm64: google: New ARCH_GOOGLE for v7.4
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1179529/
  Lore link: https://lore.kernel.org/r/20261005101657.34571-2-krzk@kernel.org

Series: [GIT,PULL,1/4] samsung: drivers for v7.4
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Patchwork: https://patchwork.kernel.org/series/1179533/
  Lore link: https://lore.kernel.org/r/20261005101845.34752-5-krzk@kernel.org
    Patches: [GIT,PULL,1/4] samsung: drivers for v7.4
             [GIT,PULL,2/4] arm64: dts: samsung: for v7.4
             [GIT,PULL,3/4] ARM: dts: samsung: for v7.4

Series: [GIT,PULL,1/2] arm64: dts: dt cleanup for v7.4
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1179553/
  Lore link: https://lore.kernel.org/r/20261005103232.37247-3-krzk@kernel.org
    Patches: [GIT,PULL,1/2] arm64: dts: dt cleanup for v7.4
             [GIT,PULL,2/2] ARM: dts: dt cleanup for v7.4

Patch: [GIT,PULL] Rockchip dts64 changes for 7.4 #2
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1179300/
  Lore link: https://lore.kernel.org/r/2088481.8hb0ThOEGa@phil

Patch: [GIT,PULL] i.MX arm64 dts updates for v7.4
  Submitter: Frank Li <Frank.Li@oss.nxp.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1178410/
  Lore link: https://lore.kernel.org/r/20261002142852.3968477-1-Frank.Li@oss.nxp.com

Patch: [GIT,PULL] i.MX ARM dt changes for 7.4:
  Submitter: Frank Li <Frank.Li@oss.nxp.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1178393/
  Lore link: https://lore.kernel.org/r/20261002140826.3947315-1-Frank.Li@oss.nxp.com

Patch: [GIT,PULL] STM32 DT changes for v7.4#1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1178368/
  Lore link: https://lore.kernel.org/r/44917365-a20e-484e-a252-f420f566ddb1@foss.st.com

Patch: [GIT,PULL] ARM: mvebu: dt64 for v7.4 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1179277/
  Lore link: https://lore.kernel.org/r/87qzi56wjp.fsf@BLaptop.bootlin.com


Total patches: 11

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


