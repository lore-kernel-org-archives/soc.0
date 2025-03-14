Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD341F957
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 17:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741973397; cv=none; b=K7nbCA1SJ8jlbFdZt0QjfsLoRO0g2857G0KfoKxd0b54VPLuUJopK9VxK8gZmODQL05Og4wlZ3yg8GcVdkNHA2qd+ifkYyy/kZj6/KiPkm6ASeAGX1VbvaZX/B85iUFt/4YJCjQWLI3D9gZaspeyvLNLqOaRNa34y8a+tEx3bic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741973397; c=relaxed/simple;
	bh=cnvZDhHTusVfJimablJUfTLi11VOMMy/sD8Ok+P8j98=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=UAF8GqFnL0nTKfHzj5ErYOhPO2gWtiww7jtBs3rYVSvKBKOFlcTNo2qWcjgA22jax9ULVf0YkE0UictehaWXs9V0bTiFT9Jom+Z3HeVDneJwds0ag0A9oS5Rx8ktUUsub9gHdEUZmFd12tn025e13KZqMihM1WeMnhm46SH/XbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWPlf7k/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWPlf7k/"
Received: by smtp.kernel.org (Postfix)
	id 734C1C4CEE9; Fri, 14 Mar 2025 17:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D573C4CEE3
	for <soc@kernel.org>; Fri, 14 Mar 2025 17:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741973397;
	bh=cnvZDhHTusVfJimablJUfTLi11VOMMy/sD8Ok+P8j98=;
	h=Subject:From:Date:To:Cc:From;
	b=aWPlf7k/WRwJb/GPOdsU2tVWhm2sePYb/8M3N0tvJdBwNiiaBHRE+EqXiaTA7Wmty
	 xfP6LfAYJEUxiYdLsrfyaZbLGBSxtGKH6eOyNXnq563xRG1aT8RlCi1bqXqUu4ItOl
	 6ukgbTrceRwC+0WX0t+AWs86IbAGH8IVcudXfCJiZAoUmoTTI4fOBcrCQElEqHQ0zr
	 theJYrye2g0uauL6GAFroXXunBob4wQq0RUQbWN4hpctxz6/Z5iO6LThJschV1kgO5
	 A4tSEIHx2MpCAgb1d4ZkWSLzxlHBwcpIEAOeQoD3rPzt9/ZXmhpSFV5MMRR+G6Z1AI
	 HD31e1yFMrEkQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 37D10380CEE2;
	Fri, 14 Mar 2025 17:30:33 +0000 (UTC)
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
 <174197343161.2324103.10776812355547525766.git-patchwork-summary@kernel.org>
Date: Fri, 14 Mar 2025 17:30:31 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL,fixes] memory: omap-gpmc: drop no compatible check
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=942306
  Lore link: https://lore.kernel.org/r/20250310141514.56033-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] Reset controller fixes for v6.14
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=944097
  Lore link: https://lore.kernel.org/r/20250314164401.743984-1-p.zabel@pengutronix.de

Patch: [v2] soc: hisilicon: kunpeng_hccs: Fix incorrect string assembly
  Submitter: lihuisong (C) <lihuisong@huawei.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=943913
  Lore link: https://lore.kernel.org/r/20250314100143.3377268-1-lihuisong@huawei.com

Patch: [GIT,PULL] Qualcomm driver fixes for v6.14
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=942530
  Lore link: https://lore.kernel.org/r/20250311022509.1232678-1-andersson@kernel.org

Patch: [GIT,PULL] Apple SoC MAINTAINERS updates for v6.14 / arm/fixes
  Submitter: Sven Peter <sven@svenpeter.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=942034
  Lore link: https://lore.kernel.org/r/20250309194926.51824-1-sven@svenpeter.dev

Patch: [GIT,PULL] Broadcom devicetree fixes for 6.14 part 2
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=941784
  Lore link: https://lore.kernel.org/r/20250308150528.1900822-1-florian.fainelli@broadcom.com

Patch: [GIT,PULL] Qualcomm Arm64 Devicetree fixes for v6.14
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=942403
  Lore link: https://lore.kernel.org/r/20250310191409.1208520-1-andersson@kernel.org


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


