Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF6133688A
	for <soc@lists.linux.dev>; Fri, 16 Oct 2026 15:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163429; cv=none; b=Bgq7lPgkeSgWU4o7jOTWckxuVCaY2KKZosSD97j+RfLLZNrxr7cUa03/3tkctURqMiR/JpIjEd4XkyfJXClhOfIoC3Wb3Ep7sPh0ZWiNfrRDWNHK88canoEDAUaBECctgCFQV16QHtx5ErdmgbTP+cItIFU6H3PwAvUqoLb7kCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163429; c=relaxed/simple;
	bh=UFUJ/Wi3LP6IMsIfTTlwNZZ7INcD6vXzjXvO996pvaM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=rS0wSucedPf0U2xuGUTNKrTAszVw0RemUDyuNCxNJbqur5oHggBfhA67sgOCozkeOT6OHgDHYcrwRKPQFjaW0cp+XcymRu8eHjH93k7RG66KuKCKKYQahSr4yI5cOGrjtt6nhOBljfjyGXAlFD2R+WvGhd3D/Rm8z0El9+Lvyko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxxZFEgV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxxZFEgV"
Received: by smtp.kernel.org (Postfix)
	id 75BF81F000C5; Fri, 16 Oct 2026 15:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7281F000C4
	for <soc@kernel.org>; Fri, 16 Oct 2026 15:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792163428;
	bh=cPqpC5bFozx/c1mdbZXDz/QJSEq9RhbDqgwDOMbGdvU=;
	h=Subject:From:Date:To:Cc;
	b=oxxZFEgVKcqXK8Wrtfwl3oIXGb62FC3RX35n/lBd34zLBBCy1P0G0pwM+T4jCNW3M
	 NW8StPCigZLHSaw7pb2T++363sdtcL0eroeD+XTiZVqUP6297e0dSs7MeYZ1+09FVu
	 B1fvGfKUXevFQcRtpdUC3agt6oqImGPhuwrh3lMBCDqFRzGXzLJ+XFg2l0uunSsjtL
	 qeP1VZx9SNEN//UwokY7wksvm+Bqez3GWDPcTveCXH7N8uv1RN528JXBtGi3zwBY7Z
	 /dpkJF6kpqB6fIeLfZ/bAcn2MG87W6GC4MWBMvq5xDMlB9FSX+0Ew5L4ufvJVy+JD6
	 OUElE02DWue9A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3CC69380A966;
	Fri, 16 Oct 2026 15:10:28 +0000 (UTC)
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
 <179216342690.806834.14074763977178806107.git-patchwork-summary@kernel.org>
Date: Fri, 16 Oct 2026 15:10:26 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] More Qualcomm Arm64 DeviceTree updates for v7.4
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1184157/
  Lore link: https://lore.kernel.org/r/20261012193412.14636-1-andersson@kernel.org

Series: [GIT,PULL,1/4] RISC-V firmware drivers for v7.4
  Submitter: Conor Dooley <conor@kernel.org>
  Patchwork: https://patchwork.kernel.org/series/1184886/
  Lore link: https://lore.kernel.org/r/20261013-defame-busload-7eeb111f35ce@spud
    Patches: [GIT,PULL,1/4] RISC-V firmware drivers for v7.4
             [GIT,PULL,2/4] RISC-V misc. devicetrees for v7.4

Patch: [GIT,PULL] arm64: AMD/Xilinx DT changes for v7.4
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1183803/
  Lore link: https://lore.kernel.org/r/CAHTX3dKJ9DKTUHOj+KvUVuePPXF25gmiLeaDJChTko9jV0DmFA@mail.gmail.com

Patch: [GIT,PULL] RISC-V SpacemiT Devicetrees for v7.4
  Submitter: Yixun Lan <dlan@kernel.org>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1181180/
  Lore link: https://lore.kernel.org/r/20261008011902-KYC9093695@kernel.org

Patch: [GIT,PULL] RISC-V Sophgo Devicetrees for v7.4
  Submitter: Chen Wang <chen.wang@linux.dev>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1182246/
  Lore link: https://lore.kernel.org/r/aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev

Patch: [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v7.4
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1184150/
  Lore link: https://lore.kernel.org/r/20261012192102.12999-1-andersson@kernel.org

Patch: [GIT,PULL] RISC-V T-HEAD devicetree changes for v7.4
  Submitter: Drew Fustini <fustini@kernel.org>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1178751/
  Lore link: https://lore.kernel.org/r/asCtEGcXwUoOHyMA@x1gen8.tail89d63.ts.net

Patch: [GIT,PULL] Rockchip dts64 changes for 7.4 #3
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1183779/
  Lore link: https://lore.kernel.org/r/2330337.ZfL8zNpBrT@phil


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


