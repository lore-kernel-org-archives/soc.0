Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D42754B1D7
	for <soc@lists.linux.dev>; Fri, 16 Oct 2026 17:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170611; cv=none; b=f2W7aY6NxFySWNoiv3rRed0C41oUtyazlml0QYWTNIio2BteP9HeI8bmhBeafVoK32Ech93LAXch7Okm7kJmM2MrNbfT2j1e0ukggugJUVcByb4NSWuTbEsYWpQL0S2gHOiUlIj94JctbErDXBXyXw2GBI99uthLALdYk01phAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170611; c=relaxed/simple;
	bh=YTvEyKc84n+Y99ODPrJPjpY3THdx+YpmVETNod5NxJk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=TePDCuK+Rp4qIHM12Ipi/QgtGNXXEkGEeLBG5Ze82ECqRpn3O/CZEd17eXjjq9+Gq3uJCJVv/hCHTxeboQ8TQeGC/glKXQucseXHXKFouBTTSH4wlT7l+qJCnHE/Fd4zS0mkzmMy8v0TG35rYKnf4NCRIP+EOrC5zuDubkfBAqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGQX2T1V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGQX2T1V"
Received: by smtp.kernel.org (Postfix)
	id 0278A1F000C7; Fri, 16 Oct 2026 17:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07861F000C6
	for <soc@kernel.org>; Fri, 16 Oct 2026 17:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792170609;
	bh=aOOTEDFIfrueO4/874gx+7n6ZgkKPvJTChjMvMT9en0=;
	h=Subject:From:Date:To:Cc;
	b=CGQX2T1VdthKV1k7wkJ4NlDQ8ykJdnTQyZtM/b6IJaNUpRhlShGFqhs+io8abkKAQ
	 /nxfspxg0ZoPG2tVu1pOi5rDliNAicwCL27pNk1Ff/yh6fZyoQBjqujIkCYSf+vbMV
	 QqRavN52aveEvdoZ/bIaX0S0+UmukG+X8rhcKS7Flgj3apzmWtiJpFf9CmfHcwOUki
	 BKQHk4qxji0IRtwYAIZrtaOCG7T1Pxb2ToQL9+Q/CPQv1KR0vAw9WcZCdRVvHRCvDK
	 ejWKrcJqW2feae1jI7nPwV6oSBVWl6HxTP5QYtaGeg4+N/5qHpu0elW3Bu9BFYF7hk
	 BKhHtjSJaNJ2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BAECF380AA52;
	Fri, 16 Oct 2026 17:10:09 +0000 (UTC)
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
 <179217060851.880342.665107311903549577.git-patchwork-summary@kernel.org>
Date: Fri, 16 Oct 2026 17:10:08 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/5] soc: ti: Driver updates for v7.4
  Submitter: Nishanth Menon <nm@ti.com>
  Patchwork: https://patchwork.kernel.org/series/1179635/
  Lore link: https://lore.kernel.org/r/20261005124915.e632elbacgr6nxgs@anyway
    Patches: [GIT,PULL,1/5] soc: ti: Driver updates for v7.4
             [GIT,PULL,4/5] MAINTAINERS: TI K3 updates for v7.4

Series: None
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1184906/
  Lore link: https://lore.kernel.org/r/20261013-glitter-lingo-dce2f8d724c9@spud
    Patches: [GIT,PULL,3/4] RISC-V soc drivers for v7.4
             [GIT,PULL,4/4] standalone cache drivers for v7.4

Series: [GIT,PULL,1/4] RISC-V firmware drivers for v7.4
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1184886/
  Lore link: https://lore.kernel.org/r/20261013-defame-busload-7eeb111f35ce@spud
    Patches: [GIT,PULL,1/4] RISC-V firmware drivers for v7.4

Series: [GIT,PULL,1/7] Device tree bindings changes for v7.4-rc1
  Submitter: Thierry Reding <thierry.reding@kernel.org>
  Patchwork: https://patchwork.kernel.org/series/1178814/
  Lore link: https://lore.kernel.org/r/20261003095924.1370238-1-thierry.reding@kernel.org
    Patches: [GIT,PULL,1/7] Device tree bindings changes for v7.4-rc1
             [GIT,PULL,5/7] ARM: tegra: Changes for v7.4-rc1
             [GIT,PULL,6/7] arm64: tegra: Changes for v7.4-rc1

Patch: platform: cznic: turris-omnia-mcu: stop button emulation producers
  Submitter: Myeonghun Pak <mhun512@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1186841/
  Lore link: https://lore.kernel.org/r/20261016013918.3492835-1-mhun512@gmail.com

Patch: [GIT,PULL] arm64: AMD/Xilinx SOC changes for v7.4
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1183796/
  Lore link: https://lore.kernel.org/r/CAHTX3dJ4Hi0sHT9acVE+4r1pBU91Ryew9f-2D2vfDYcF98P7kg@mail.gmail.com


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


