Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C003EAE7
	for <soc@lists.linux.dev>; Thu, 29 Jan 2026 09:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680263; cv=none; b=pyCIqT0sfS35TINhlm+9OVECSWHEoMJiY/DmOcXwINqlW41SjaCFHuO+ZzRdKXxexMaOqM//XBcLaEa+uEeF9tq8BM4pg8amgIztRjMULiLy2XWShqkNsqhTd16gYK04vSSG4YWFJ88D/LqGkUd+RA5eEshrSgB11LGVFjK4w+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680263; c=relaxed/simple;
	bh=gms/FJyPLB7zKaF+n/Tr2ulKA/UMEkBe9Zh6UavFUBw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=m9TKSGdRdxzA1iQsMjFLHgGP3DTfbhxZOdrH61vyUFXPcf9lYdo9jCOr/LuZf7jqOH6TZ6ilkYTfTDf4GfO8U+8spNd4AFRVnVT2oE+lKI1hm/sjIgugW4d2dT/aWCAwi44u5rTZGRFQBUJiU6nH+yroULXPcPcFaXU1m1OLDWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gd0pI9iv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gd0pI9iv"
Received: by smtp.kernel.org (Postfix)
	id F0F82C16AAE; Thu, 29 Jan 2026 09:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB65EC4CEF7
	for <soc@kernel.org>; Thu, 29 Jan 2026 09:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769680262;
	bh=gms/FJyPLB7zKaF+n/Tr2ulKA/UMEkBe9Zh6UavFUBw=;
	h=Subject:From:Date:To:Cc:From;
	b=Gd0pI9ivbllC0xhjJRYBIwd6oco2MHwzCEq7ATsd2n0d9aB44J9iIYvpNs0GoIw6H
	 sD3WQidZR++AuFvdm8u6W7KVa+xDXBUdxRKbREWKFP4qjr/Tr8P1UtlVhOp9HxfJiP
	 kiCuki7tUHb685iqQAv6EsQJOssKLzqqd3s+It0mVc4WTpTQW/YJ4lGol6EbJnjvJV
	 XtNbHb88x4PwvtOqXeRL3a/+B4mO28Ia6eamtINnB7yYc4feSivINPZ6ICfF/L1Uwc
	 IiyczNBvZAZUoZ+hCH3G6fpK5InGMJI1JqHKc01T+yEUY2a7/fXjFRY5rxYQxVykA7
	 tjj9ubKNQRyoA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 14B97380AADF;
	Thu, 29 Jan 2026 09:50:57 +0000 (UTC)
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
 <176968025569.2433421.8717734920958697120.git-patchwork-summary@kernel.org>
Date: Thu, 29 Jan 2026 09:50:55 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: MAINTAINERS: Add myself as maintainer of hisi_soc_hha
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1048235
  Lore link: https://lore.kernel.org/r/20260128-audition-professed-31d1b66d5b4e@spud

Patch: MAINTAINERS: Change Sudeep Holla's email address
  Submitter: Sudeep Holla <sudeep.holla@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1046823
  Lore link: https://lore.kernel.org/r/20260125201545.3461463-1-sudeep.holla@kernel.org


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


