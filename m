Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84C82D8DD0
	for <soc@lists.linux.dev>; Mon, 15 Jun 2026 17:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544609; cv=none; b=ZvDFt34T2e3UOqas3UkaIjPRt/m6vt7UOZYIQ5roRfNZb7cNG4T/63WY0Mok+rSyqRQPCf+eZoN4Bf1/EJ8l58UU5rBhoKNQL3GO84m6/a5NCg4kELXWHM6Gdvh7gWRkp/Q51yZt/J3ZxNv9jhirVf5noGTcL94iRSl8Vwlvwz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544609; c=relaxed/simple;
	bh=zU+jGC8QWU3YkBh45DMqzJg+PKJt2zQYAAsKgzR4E+o=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=gVuxhfOG74IwK1NGx6FOH8L/ZhaRAvYR8+wiVEa6Ww9TMvHC0ZK/nm9SBk+vaH0tCYIjliuX4XtubT21gzF6C0pWlooX558tL3BR1nz6/PqISSOOIwGUla6pJ/jms+jG5gSyZQKH28KYWdxQfiPqjYaV84at7EbA3cHQoVB/liM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7tNZO1w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7tNZO1w"
Received: by smtp.kernel.org (Postfix)
	id 9A5351F00A3A; Mon, 15 Jun 2026 17:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843301F000E9
	for <soc@kernel.org>; Mon, 15 Jun 2026 17:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781544608;
	bh=pjxtl+Vw1T52Gt8aZ+uWyfy1oUoN9uIwTnk8XjJudmQ=;
	h=Subject:From:Date:To:Cc;
	b=k7tNZO1wKO+oxf6Y9wVS2+zpUBi1OYziwtlvCvnxM/EI6d989u50dKjSExkCy8oR+
	 TnMkL390DhdtRIfneXNfj5wyS+NBOrxBKpPDgl/nxn32K0N/Iub705B9Z8xfqYqC+y
	 5eE6ZQ3GNJi3UaXOVkcRsGZXrvwUTzPAztbx88QMQRMcfRNBV3kmaG7ltZxgi3Hvra
	 63SvQ+Tj1bvlBwSFq2QdWayHsrZW6fWZidDNYzSYRVVRx3mUhvgLsk7w0yjd5MqiXh
	 EUzGrwwOvVTsylFWOKiM0s/FX9VlXUBiGpPxzjEqOA6tkCVNyYXCSFqvVmiGwq76rO
	 u9uJYdm7/1M2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D33B43824F27;
	Mon, 15 Jun 2026 17:30:04 +0000 (UTC)
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
 <178154460347.216722.5701839457744381055.git-patchwork-summary@kernel.org>
Date: Mon, 15 Jun 2026 17:30:03 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] memory: late drivers for v7.2
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1111607
  Lore link: https://lore.kernel.org/r/20260615095001.83933-2-krzk@kernel.org

Patch: arm64: dts: aspeed: Fix duplicate pinctrl labels and address scheme
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1110514
  Lore link: https://lore.kernel.org/r/20260612-aspeed-arm64-dt-v1-1-d1d1a4737905@codeconstruct.com.au


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


