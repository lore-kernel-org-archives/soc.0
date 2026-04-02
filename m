Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6875363C47
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 21:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775165432; cv=none; b=R3UJi1gv8GFWxVhGhuLlJbWoCxwHkZmJfd23gnnzDw4zD+VKXrUntmLRQIaWNd4lI8LEmi2Lqu4a3K1rUn89WcPGngcSfCQhMyCtf9JwdKIH47smHzC/27nMVs7kTAuAsMHeIlDPJaajqGSQycFWyvXwJnr6shBaIe2GHKv5mVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775165432; c=relaxed/simple;
	bh=4GV0NoN2ZRj3OdlC7fnVjvg8SGl5L3Xj3wG5YBR5nYI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=VbQVOvdYvAssA/MjfsZ7TFTpBj9OZlC3uTQexKY5sxvIoEC0Mp28MEoPGYrA/XHXWzaLiPU4a089HVE5uPmYrO+bqF9/66LbtbdvFuBwl5VZSirGwTLbJM+RVKaAYBNVYrpqNxcZqhfwfz9IytD/Q0RouyJI19f3jYrTD9wvWcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSrf6xq+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSrf6xq+"
Received: by smtp.kernel.org (Postfix)
	id 8CA58C2BCAF; Thu,  2 Apr 2026 21:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7676DC116C6
	for <soc@kernel.org>; Thu,  2 Apr 2026 21:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775165432;
	bh=4GV0NoN2ZRj3OdlC7fnVjvg8SGl5L3Xj3wG5YBR5nYI=;
	h=Subject:From:Date:To:Cc:From;
	b=cSrf6xq+MAnMoOxxqbMmNpDMGEL5InCA0Kpkk9G4O1T7LX3Tpv2jEkuM/3fqXHFAq
	 1Z2U7MS+YY9mOBxwAl+sjimQejaEoA6ZlzGVFNwrYoYPsIPu105op/J+UruxJqQpNB
	 UXjF35yvhTVH9AjN1xgD/iEF36T2OD1qy3vvoJZw6oZeb9P7yUbHTZ5XfiGfwoZnrc
	 HJgIfqddFh8KItiXvm5qMrBQl4vL71M5Zmm0hYQqlit66P75+5Y9k9FdmL1epP58qv
	 Uh8bNvMlOa7uQVoahMJ79E+/uYYi/kyc6+O8jbzZAoaEtN76A0fUXtmuvnedzdKYqF
	 D5+ZTx/DFnEQQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BCC023809A09;
	Thu,  2 Apr 2026 21:30:15 +0000 (UTC)
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
 <177516541437.623252.428629675062047370.git-patchwork-summary@kernel.org>
Date: Thu, 02 Apr 2026 21:30:14 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Reset controller updates for v7.1
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1076575
  Lore link: https://lore.kernel.org/r/20260402170525.2452299-1-p.zabel@pengutronix.de

Series: [GIT,PULL,1/7] dt-bindings: Changes for v7.1-rc1
  Submitter: Thierry Reding <thierry.reding@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1074211
  Lore link: https://lore.kernel.org/r/20260329151045.1443133-1-thierry.reding@kernel.org
    Patches: [GIT,PULL,1/7] dt-bindings: Changes for v7.1-rc1
             [GIT,PULL,2/7] soc/tegra: Changes for v7.1-rc1
             [GIT,PULL,3/7] firmware: tegra: Changes for v7.1-rc1
             [GIT,PULL,5/7] ARM: tegra: Default configuration changes for v7.1-rc1
             [GIT,PULL,7/7] arm64: tegra: Default configuration changes for v7.1-rc1

Patch: [GIT,PULL] Qualcomm driver updates for v7.1
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1075452
  Lore link: https://lore.kernel.org/r/20260331214741.966509-1-andersson@kernel.org

Series: [GIT,PULL,1/2] arm64: dts: ti: K3 updates for v7.1
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1075974
  Lore link: https://lore.kernel.org/r/e724f95d-09d0-4ede-9ed4-0ce782d81058@ti.com
    Patches: [GIT,PULL,1/2] arm64: dts: ti: K3 updates for v7.1
             [GIT,PULL,2/2] arm64: defconfig: TI K3 updates for v7.1

Patch: [GIT,PULL] Qualcomm Arm64 defconfig updates for v7.1
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1075456
  Lore link: https://lore.kernel.org/r/20260331215521.968341-1-andersson@kernel.org

Patch: [GIT,PULL] arm: OMAP defconfig updates for v7.1
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1076067
  Lore link: https://lore.kernel.org/r/7hv7eatlnk.fsf@baylibre.com

Patch: arch/arm: Drop CONFIG_FIRMWARE_EDID from defconfig files
  Submitter: Thomas Zimmermann <tzimmermann@suse.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1075664
  Lore link: https://lore.kernel.org/r/20260401082533.214103-1-tzimmermann@suse.de

Patch: [GIT,PULL] ARM: soc/omap updates for v7.1
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1076066
  Lore link: https://lore.kernel.org/r/7hzf3mtloi.fsf@baylibre.com

Series: [GIT,PULL,1/4] i.MX arm64 dts changes for v7.1
  Submitter: Frank Li <Frank.Li@nxp.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1074637
  Lore link: https://lore.kernel.org/r/20260330141444.3789193-1-Frank.Li@nxp.com
    Patches: [GIT,PULL,3/4] i.MX dt binding changes for v7.1


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


