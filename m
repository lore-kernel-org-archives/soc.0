Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28CB199931
	for <soc@lists.linux.dev>; Thu,  7 May 2026 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159578; cv=none; b=JUOcKWF0ckdgxr3FOOuD7pIO+K85MnWzXoaxD/obwz15PYuF4of5cdPg07J8nT7gfE8wUoN3Ar0BZL7KBk4r5r42+ZvgIvnAD5vbrIAC3Z8i1RvPo8tcm5gIcfoV443f2qe8GEnJ3DTd4jTusCFtzNXV9eAs844yzuFsR3hJyjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159578; c=relaxed/simple;
	bh=WXDn7YzCcxa5J5+TNM0zKgQlAPpdndbiwPoOpIcgXrw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=K6fhumWZ2xXsohqQFjIMAASDFod7Qdlb216eNMdYlKQo7ECMgK321FhgygKbAtfNMiOQ5Lo9PCp25Pb31LD1rnYYyIyewcbIND9J1nA0zk9W+4QZoS0qnte0uaWh1a199KlogAFLLAmLnRgu2Zl09qB5+rZPiJht+c37I3FFHLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZbxWZvhh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZbxWZvhh"
Received: by smtp.kernel.org (Postfix)
	id 76838C2BCC4; Thu,  7 May 2026 13:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60741C2BCB2
	for <soc@kernel.org>; Thu,  7 May 2026 13:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778159578;
	bh=WXDn7YzCcxa5J5+TNM0zKgQlAPpdndbiwPoOpIcgXrw=;
	h=Subject:From:Date:To:Cc:From;
	b=ZbxWZvhhcEd3qRvWyg9lq9puBr4lXcfXgVrwBpzD146OfpDOGlWm9l3mwVmiWC4fP
	 HnJ/THDxOYZ1GJQlo+g9iBJZ6rCbSo5yqnQv68t1vq3O7nX6rbTLnzPJR+3N4w7eeo
	 dygs4PGwUXGXB0UZjdfIGksit2t4d4DeEdENspphE9J5U8a12YZsWvZ/D5s1/NFYGZ
	 y64u+iDHWoqTOHxt7ADy6nCRjfMAVBg4aXh61Q1zNumQug1k/hVFvtfiBY58V9MEdn
	 NPF1cNBvLznSh+aaqlB8T79QT9W4jqc27RyAl269RUxYFQZQ21F+Fmefj4kRT1zAj4
	 /9zCb9TH8MPAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BC77939308F7;
	Thu,  7 May 2026 13:12:08 +0000 (UTC)
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
 <177815952717.3933061.16075488045189716595.git-patchwork-summary@kernel.org>
Date: Thu, 07 May 2026 13:12:07 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: arm64: defconfig: Cleanup and change Ethernet drivers
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1087686
  Lore link: https://lore.kernel.org/r/20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com
    Patches: [v2,1/5] arm64: defconfig: Move entries to match savedefconfig
             [v2,2/5] arm64: defconfig: Drop unused legacy netfilter options
             [v2,3/5] arm64: defconfig: Drop default or selected drivers
             [v2,4/5] arm64: defconfig: Drop unused Ethernet vendors
             [v2,5/5] arm64: defconfig: Switch Ethernet drivers to modules

Series: ARM: configs: Cleanup redundant options
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1080390
  Lore link: https://lore.kernel.org/r/20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com
    Patches: [1/5] ARM: multi_v7_defconfig: Move entries to match savedefconfig
             [2/5] ARM: configs: Drop redundant I2C_DESIGNWARE_PLATFORM
             [3/5] ARM: configs: Drop redundant SND_ATMEL_SOC
             [4/5] ARM: multi_v7_defconfig: Cleanup redundant options
             [5/5] ARM: multi_v7_defconfig: Correct QCOM_RPMH and QCOM_RPMHPD

Patch: ARM: dts: ixp4xx: use phandle-based GPIOs in mi424wr
  Submitter: Linus Walleij <linusw@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1089758
  Lore link: https://lore.kernel.org/r/20260505-ixp4xx-dts-v1-1-02f4a92a9697@kernel.org

Patch: ARM: select legacy gpiolib interfaces where used
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1086993
  Lore link: https://lore.kernel.org/r/20260428162757.540823-1-arnd@kernel.org

Patch: [GIT,PULL] pinctrl qcom defconfg changes for v7.2
  Submitter: Linus Walleij <linusw@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1090656
  Lore link: https://lore.kernel.org/r/CAD++jLnf-3JivT-7MtCdnx9DRG2MMvvZWcsFdLxWM6416Nr=qg@mail.gmail.com

Patch: [GIT,PULL] firmware: arm_ffa: Fixes for v7.1-rc1(Round 2)
  Submitter: Sudeep Holla <sudeep.holla@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1090667
  Lore link: https://lore.kernel.org/r/20260506194602.3474096-1-sudeep.holla@kernel.org

Series: ARM/Realtek: Add maintainers and pinctrl support for RTD1625
  Submitter: Yu-Chun Lin <eleanor.lin@realtek.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1089830
  Lore link: https://lore.kernel.org/r/20260505103955.1010130-1-eleanor.lin@realtek.com
    Patches: [1/3] MAINTAINERS: Add maintainers for ARM/REALTEK ARCHITECTURE
             [2/3] arm64: dts: realtek: Add pinctrl support for RTD1625

Patch: [GIT,PULL] Renesas SoC fixes for v7.1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1089275
  Lore link: https://lore.kernel.org/r/cover.1777899408.git.geert+renesas@glider.be


Total patches: 17

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


