Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86E9377023
	for <soc@lists.linux.dev>; Fri, 29 May 2026 22:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780094415; cv=none; b=g5ATmIRo6PAgC6zDkSV1rKB4lQYyo4WeAkoAzZqUpAEllO7AwPkDprycYVlbGPI1KXOFlt8yro9iG5pjmV5+doGQc9jG5gT6DsGmf3F+7CLB5KEMGEE3sA7MYyPu4lwtIpX9fx3sY1yBo5oW7isvvRqT11emHRPxf1bXYgt3hnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780094415; c=relaxed/simple;
	bh=AWjyAEoKvvGu4pm16CAmVCAzsmEY8JNIdlbo86m4gDg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=JLD9SYMMboMXt1IdaEVHkvhguk6tQW+jaN5mMkrATvdRGcNBA5NFYbKl4Xlvf392hah8W44CZCEAH/+JCFdiGK0l2O8+bFGIGlc0TwtIRym8Y9TSFeOwPjUv/XH5cARK3sZz15xx17ohMwgST3W27zZs0FG2rscexBLDjO2dyB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SenXdqW7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SenXdqW7"
Received: by smtp.kernel.org (Postfix)
	id 8C6BB1F00898; Fri, 29 May 2026 22:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7708B1F00893
	for <soc@kernel.org>; Fri, 29 May 2026 22:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780094414;
	bh=ewltDhf3tgdyDtXhaUYC4cop5o9p5d0+gi1ANL7H6Sc=;
	h=Subject:From:Date:To:Cc;
	b=SenXdqW72OjhNog50joyleNokFfBaG4z8560hV8+AmmQjeVPFqtzeuvL52thqNTzJ
	 OgMRDX2MYtlEnrRvoRyaborv80p7F6jLnywwxU4XF1kkqFAYyR5cR19c4XWTSyjqAz
	 lbjLZgi01DBE7JaelQr+dauxYbEA40wnFS07v24fybFkh00ibKbbrrP04D8o91dJYW
	 yWphhubteCKgw+HRwgkvrjHVCyN0c23XjvkChxpKFvY+b1qzHM0tOHAQvtx/ks6c2B
	 P24mUvb6k1xzK4LUbadl8whtQYYQX/GkGnV6b+JTadwmT9rmiWzDkjsbfVlQC9JTTc
	 +jUa68CD51hhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5699039301A3;
	Fri, 29 May 2026 22:40:19 +0000 (UTC)
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
 <178009441794.1985625.9383459942407210248.git-patchwork-summary@kernel.org>
Date: Fri, 29 May 2026 22:40:17 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] samsung: drivers firmware for v7.1, replacement
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1102879
  Lore link: https://lore.kernel.org/r/20260529121757.13224-2-krzk@kernel.org

Patch: [GIT,PULL] memory: fixes: driver fixes for v7.1
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1102685
  Lore link: https://lore.kernel.org/r/20260529071949.12520-2-krzk@kernel.org

Patch: [GIT,PULL] OP-TEE for v7.2
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1102841
  Lore link: https://lore.kernel.org/r/20260529111430.GB2532355@rayden

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v7.2
  Submitter: Sudeep Holla <sudeep.holla@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1102421
  Lore link: https://lore.kernel.org/r/20260528185827.776851-1-sudeep.holla@kernel.org

Patch: [GIT,PULL] Qualcomm driver updates for v7.2
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1101092
  Lore link: https://lore.kernel.org/r/20260526152600.5555-1-andersson@kernel.org

Patch: [GIT,PULL] AMD-TEE for v7.2
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1102840
  Lore link: https://lore.kernel.org/r/20260529111153.GA2532355@rayden

Patch: [GIT,PULL] firmware: arm_ffa: Updates for v7.2
  Submitter: Sudeep Holla <sudeep.holla@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1102422
  Lore link: https://lore.kernel.org/r/20260528185856.777407-1-sudeep.holla@kernel.org


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


