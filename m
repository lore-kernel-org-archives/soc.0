Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0032C35E1B2
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 16:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380677; cv=none; b=Hxsg/ykC5ARvUAcuIP0eHmp0zC4827oeXRRnNkiwUz7oCG/Mx2yDmIP6uwaZmJ0igG7XGal4bsPlK/H0lSqhplz3MmWPW1URhiPq/GAfpjfyty0JLi81pBuY9H73vInBRnRujqjrfhniV1emcAe1iieI0v6HtqZS3suufehyq8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380677; c=relaxed/simple;
	bh=SC+SJUg4pUo1lOwGiuWW9Qu4WOk9EalQ7cIH2N3F+HE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=KJgqmMP+Z14Tm1zokTIrAEztVQInYP17O6zu94/K0M/9Egd1hy/ueURvybA2HoFfKBdod0tPQBH9f/m+CdCTjbsbsObRVt5FZDPfE3lg7HubkcNyhiWxv9Gh5dFsFMSY4ynLD2k+oPn+yeUtRFaso6oYBvlkhCvFszxR/TxZ8Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4D/Bb6w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4D/Bb6w"
Received: by smtp.kernel.org (Postfix)
	id 8A3BC1F00A3A; Mon, 10 Aug 2026 16:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F391F000E9
	for <soc@kernel.org>; Mon, 10 Aug 2026 16:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380675;
	bh=Ae3QOeHTorx7aG14smr+QXKgE4/TTIwf0TZQYoQsL/8=;
	h=Subject:From:Date:To:Cc;
	b=D4D/Bb6w2Qxxn+WKmtiYDQYoY8/+Dyx7BLg5FFuV4j/c5MrcCoit+3CBC3WC/0KIh
	 gWvEvu08pq+3o/0zyUVVOqm3MrVu/iTR/k6xNazoa5jewwxsrwNbP71/AJ99XAO55G
	 /6pjLNxJAqAJr6f3PEk8T0/3jxJFJFXLWw4CtXP9i5YEBCMy9c7QW/KAog0GE7Yyp6
	 OcUpSz1lgLlra94FFgpveOG7aeVo1t565kt2wjJMPQp3ycSF4zLgpd+94LwM91fDHy
	 hEk3uirEiAVNooY1bDh6DyN6biypmiiq2fEP1L7OVpHHJFUoAo45CkBKzVA0311MLE
	 AzjQIIxvShERw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5946439253F2;
	Mon, 10 Aug 2026 16:50:33 +0000 (UTC)
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
 <178638063176.3872609.6851883391416771455.git-patchwork-summary@kernel.org>
Date: Mon, 10 Aug 2026 16:50:31 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] More Qualcomm Arm64 DeviceTree updates for v7.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1142287
  Lore link: https://lore.kernel.org/r/20260807151711.601956-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v7.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1142308
  Lore link: https://lore.kernel.org/r/20260807155035.603563-1-andersson@kernel.org

Patch: Documentation/process: maintainer-soc: Mention expectation about dt-check-style
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1139230
  Lore link: https://lore.kernel.org/r/20260803091740.232536-2-krzysztof.kozlowski@oss.qualcomm.com

Patch: [GIT,PULL] RISC-V Sophgo Devicetrees for v7.3
  Submitter: Chen Wang <chen.wang@linux.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1140424
  Lore link: https://lore.kernel.org/r/1333a916-da71-432d-99ae-69cdb6061add@linux.dev

Patch: [GIT,PULL] ARM Sophgo Devicetrees for v7.3
  Submitter: Chen Wang <chen.wang@linux.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1140426
  Lore link: https://lore.kernel.org/r/c68193e7-4917-4941-a461-b70ff9521dc5@linux.dev

Series: [GIT,PULL,1/2] arm64: dts: cleanups for v7.3
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1141292
  Lore link: https://lore.kernel.org/r/20260806082549.349249-3-krzk@kernel.org
    Patches: [GIT,PULL,1/2] arm64: dts: cleanups for v7.3
             [GIT,PULL,2/2] ARM: dts: cleanups for v7.3

Series: [GIT,PULL,1/2] arm64: dts: ti: k3: DT updates for v7.3
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1141625
  Lore link: https://lore.kernel.org/r/42ae17e3-f40d-4825-a45c-5f046ef3159f@ti.com
    Patches: [GIT,PULL,1/2] arm64: dts: ti: k3: DT updates for v7.3

Patch: [GIT,PULL] arm64: AMD/Xilinx DT changes for v7.3
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1141496
  Lore link: https://lore.kernel.org/r/CAHTX3dJYaEKp_3WH6Xj_t6qHNGUP_nvRNcASA8hrToadsTeDQw@mail.gmail.com

Patch: [GIT,PULL] Rockchip dts64 changes for 7.3 #2
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1140958
  Lore link: https://lore.kernel.org/r/5318464.usQuhbGJ8B@diego

Patch: [GIT,PULL] Rockchip dts32 changes for 7.3 #2
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1140951
  Lore link: https://lore.kernel.org/r/6604532.5fSG56mABF@diego

Patch: [GIT,PULL] Apple SoC DTS changes for v7.3
  Submitter: Sven Peter <sven@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1142336
  Lore link: https://lore.kernel.org/r/20260807161840.6011-2-sven@kernel.org

Series: [GIT,PULL,1/3] arm64: dts: samsung: for v7.3, part two
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1141284
  Lore link: https://lore.kernel.org/r/20260806081903.165005-4-krzk@kernel.org
    Patches: [GIT,PULL,1/3] arm64: dts: samsung: for v7.3, part two
             [GIT,PULL,2/3] ARM: dts: samsung: dts for v7.3


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


