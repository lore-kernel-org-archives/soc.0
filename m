Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1485B3C3F4A
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 16:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911239; cv=none; b=mlWxPXNuqUslt3hxicXj3nSpOwvKPdxWKeRq+dkmbebPOOcTSUvhPrqEG7StKE4oIYqJHao6psQ1lh+Ak3Sjx8MV4Q4Yf+Xbezo052gGzf3NVG9R3jyovLiGCNcU8S/3P8JOu2SkBHEcupFu2gfpB0N/nCwQ2jjpFcxa2Rz2E6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911239; c=relaxed/simple;
	bh=Z7FxWPZX/Gjc/uq8+t6pbevw8gabeckNXiKJrBPRzFY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=PackF3f53X8NuwFSfqaH0uwRH2g6N9fgynqxaZ28jK4UY5814RGUd6hAN1XEFlY1a7S2iofYnL3Sebs/eaNgyzJsKl3Fp2u4l21X2YK2Lc423qL/FsmD7bTXRZYsptJCl/aqgAQuZ5/6HeZTuQ8T8x2LHBesnyC9MtyA+9IDHe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBuK92Id; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBuK92Id"
Received: by smtp.kernel.org (Postfix)
	id AF3011F00A3D; Fri, 24 Jul 2026 16:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994BB1F000E9
	for <soc@kernel.org>; Fri, 24 Jul 2026 16:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784911237;
	bh=r4GPYBawhXCzPrPezZ5MQjxWqYYfL0QyBfKvjZsghSA=;
	h=Subject:From:Date:To:Cc;
	b=WBuK92Id7a6AD1pvkjU9huE61lM53/JO4K7L+KKGGryhI+huAirueUP5InnX6IFLF
	 k7GLW9Neq/VrPd2wayLS3ZwHLURLhcp7Jr1+e57hEk056wLapVq0ytq9hs9N+vVoXJ
	 5V0KQi5gCCqPmjHLAQh0E23jzCFArxhIJYSzed5YFtFBCMcFrGvAkOwlX/CWaPbctk
	 bj5G/n5pH/uMhbm4RFH7e0dpssR9qrcNOSeac/ffgk6mnRTDvieq52rv8RvJf3P3bo
	 WknQj0BAFFTl3bG7+BunAPmZ0QW2JTcgYYNOpEtafgH/JsYjc28HHBSTdHjzdJg+7C
	 vjnYcsh2eQGHQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1C0D639263A5;
	Fri, 24 Jul 2026 16:40:06 +0000 (UTC)
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
 <178491120469.3229915.6202579326725862008.git-patchwork-summary@kernel.org>
Date: Fri, 24 Jul 2026 16:40:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL,1/1] Broadcom devicetree-arm64 fixes for 7.2
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1131830
  Lore link: https://lore.kernel.org/r/20260721170851.3581392-1-florian.fainelli@broadcom.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


