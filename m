Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B37D1E00BF
	for <soc@lists.linux.dev>; Fri, 13 Dec 2024 15:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734103409; cv=none; b=PcWuBXcx21O4BOGU2kPSOu1cmEfq2fiKWAcAwkZUawHGbfgj4b6gPrMwixB3kBFo0QwxCGtS2GRIQ5UYS1a+UqD4+VDT190KU6X91SeO3NTCx1PfDtqqzqBz4XQwLo6LyqposGHG6oAoY+UEgJtN6dm/FF1gnLgNyGpLO849vbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734103409; c=relaxed/simple;
	bh=Q/FpU9qp9aOoHN2c8tNloUjxv9O8bSuMjEiRVODhiDI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=NeTOASMdpGpoUcv9dqLYpdvnf+WKQU8otHssTKS3Jsq/KFHQXsxXycdbPyUDJejxHV/xRMxaNG3mXNZFap/HFKp3Bir6xrAdYFsOepGHDRYpFd6gqA2akG4X6r6E/QhQe1NtUkesVtVny1UjD/hMja1Y/cjTFiT1Ws29zvEldRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+63hLUC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+63hLUC"
Received: by smtp.kernel.org (Postfix)
	id C8997C4CEE1; Fri, 13 Dec 2024 15:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB08C4CED2
	for <soc@kernel.org>; Fri, 13 Dec 2024 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734103408;
	bh=Q/FpU9qp9aOoHN2c8tNloUjxv9O8bSuMjEiRVODhiDI=;
	h=Subject:From:Date:To:Cc:From;
	b=P+63hLUCZoEUlzrEEisQ5XlfDc+H2sVmGXT6mLgKmEfk6ZvRCK9pKInzPk7ZBEdUY
	 iYaJFeyAOjVjLBEWh3NajMethl6Q+XMytRV2LtwtjuyN1mQxxIt8YxEumiBYNM2Qbr
	 uDWeFuSqPCr1qgCexE8mtRohm0f3m88N7CByVNlw8UQbMKW9E3IKP21A1hPhhoh6jf
	 Nqynmu43JJJQri9i+bGf4ismRT3lLyZNzfz4l2ztX1zu4q4b1OwuMzXABGW53XeDHF
	 S/Ux4eceTXMGvoR4huXoPKh+f4LYIPOY8nIRu6gp7z8+7R2CVrmApfe802KuMWlDdA
	 jRMdpIo880DZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EFBB7380A959;
	Fri, 13 Dec 2024 15:23:45 +0000 (UTC)
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
 <173410342443.3014960.14765932946147445204.git-patchwork-summary@kernel.org>
Date: Fri, 13 Dec 2024 15:23:44 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: arm: dts: spear13xx: Remove unused and undocumented "pl022,slave-tx-disable" property
  Submitter: Rob Herring (Arm) <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=910122
  Lore link: https://lore.kernel.org/r/20241115193835.3623725-1-robh@kernel.org

Patch: [RESEND] arm64: dts: apm: Remove unused and undocumented "bus_num" property
  Submitter: Rob Herring (Arm) <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=910129
  Lore link: https://lore.kernel.org/r/20241115195049.3637454-2-robh@kernel.org

Patch: arm64: dts: amd: Remove unused and undocumented "amd,zlib-support" property
  Submitter: Rob Herring (Arm) <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=910121
  Lore link: https://lore.kernel.org/r/20241115193740.3622591-2-robh@kernel.org

Patch: reset: ep93xx: add AUXILIARY_BUS dependency
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Sebastian Reichel <sebastian.reichel@collabora.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=908353
  Lore link: https://lore.kernel.org/r/20241111104418.3891756-1-arnd@kernel.org

Patch: [GIT,PULL] SOC FSL for 6.13
  Submitter: Christophe Leroy <christophe.leroy@csgroup.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=909651
  Lore link: https://lore.kernel.org/r/c3c4961b-fe2a-4fcc-a7a1-f8b5352e09a2@csgroup.eu


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


