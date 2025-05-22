Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0549E221FD0
	for <soc@lists.linux.dev>; Thu, 22 May 2025 11:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747912795; cv=none; b=OhulfIT7rCxZDRiBDaQbv7P08NCnrUumzjaMoMOL/FCBLrvVNdeZ2IXNYIYgjPTkzFv/Ug/kz96DgVy2QPwgC5pASOWS+PiZIZxahds/BRvNxAnG6HvE1Sva1QPRqH8hMKnLVwUm3omwRMBBagfGVGJRzII9ubP4GtJf2jzGxBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747912795; c=relaxed/simple;
	bh=VXdpv7x702wR8MfZGZ3xfvGv130HN1T4QmhdIeGcj60=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=ZcZBMF7soiDqq+KcaVEGdpLpiuz+kcLbtocA3AClvk8LFnK9OLHlOuSaa65FEIwgzlKTwnFy6uoY+8XVz762QzWuejgw0eTBAzH+DFcCfwirkMZggO/bzLeyKukKKdqxyd8hg9Bw9QsQJbCU3s3M+EdpDhD4DS9al5yjnWngA84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pjUc+Vet; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pjUc+Vet"
Received: by smtp.kernel.org (Postfix)
	id EB4DFC4CEEF; Thu, 22 May 2025 11:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64F6C4CEE4
	for <soc@kernel.org>; Thu, 22 May 2025 11:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747912794;
	bh=VXdpv7x702wR8MfZGZ3xfvGv130HN1T4QmhdIeGcj60=;
	h=Subject:From:Date:To:Cc:From;
	b=pjUc+VetKRVxg6kcikIbdq/QM1A+UNCoQVWUBrdcLC8QUz3W1aveyzp8jFQA0wFlq
	 yTIVmfRiLddfCl0Pc+nQYEa/NSE65R4HAnsejT3ANfhgEGEMs95alhU2CShNGK359q
	 JO5mp48knAEKOpiEL3asNzbHuptReM0SbNFIrqvsY4/msAQE5oW4ldi2UvPDjUUr2R
	 py78SaW14CYtJOpF+cuCVwKvc81XljU6Rfy296hAyhAtFIrmDGB1KjKeG9cuyLjt7j
	 RPr0TDO73tPEeU8UIzO7yuDpiP6xDe+6cKS/vqqLHNXB0sFQwa5hg52Z/Kqf9FcVEA
	 ivNvjMoMhkODg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 748173805D89;
	Thu, 22 May 2025 11:20:31 +0000 (UTC)
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
 <174791282989.2837630.256494072701039897.git-patchwork-summary@kernel.org>
Date: Thu, 22 May 2025 11:20:29 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/3] RISC-V config for v6.16
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=963568
  Lore link: https://lore.kernel.org/r/20250516-joystick-mortified-385820b1ad0b@spud
    Patches: [GIT,PULL,1/3] RISC-V config for v6.16

Patch: [GIT,PULL] One more Qualcomm Arm64 defconfig update for v6.16
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=964394
  Lore link: https://lore.kernel.org/r/20250520025119.40021-1-andersson@kernel.org

Patch: [GIT,PULL] Broadcom maintainers changes for 6.16
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=962447
  Lore link: https://lore.kernel.org/r/20250513140808.2047729-1-florian.fainelli@broadcom.com

Series: [GIT,PULL,1/2] Additional MediaTek ARM64 DTS updates for v6.16
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=964560
  Lore link: https://lore.kernel.org/r/20250520114356.1194450-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/2] Additional MediaTek ARM64 DTS updates for v6.16
             [GIT,PULL,2/2] MediaTek defconfig updates for v6.16


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


