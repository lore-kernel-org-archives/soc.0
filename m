Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662B0EE4996
	for <soc@archiver.kernel.org>; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08D24C433CA; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1EC1C433C8
	for <soc@kernel.org>; Tue, 22 Aug 2023 02:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692671475;
	bh=P/UaP4UA+7iWn6afEcDTQu2068xKe3cEr+b9mZCsk90=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=dROcKkD2v9422kMX4VUeFaD9Vor13NnsRlY8vfW0DBfZuAkUOnIkKoLxGiYJVrVpd
	 i74SMbv5PuBZHGRaYEZu+g17+7wHxEYMstMCCZfGhdKNn7GNe67o9ZJlYllOqT7Spo
	 Luzgk/FU9y+7GBKHSXSvLqsv1Tb1sp2hHGdmov1+J99oj5ALKyTEfACS6CBBkaMM00
	 02wiAqRAp73vgIh/cp8sg7dG3Sh8KW6iAxgkYYMSls//YBlrqg1fu74cCGScFxc0q7
	 S3MAU/TglBgcdG0Pe7EVBOZXNxXrzpdNm70cWnNtaw0iSLqIDt6GM4eZzvSAW1ySu8
	 eY/gIifhGKCDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BEB82E4EAFB;
	Tue, 22 Aug 2023 02:31:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169267147569.32531.11632636092554031232.git-patchwork-summary@kernel.org>
Date: Tue, 22 Aug 2023 02:31:15 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: soc: loongson2_pm: add power management support
  Submitter: Yinbo Zhu <zhuyinbo@loongson.cn>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=772442
  Lore link: https://lore.kernel.org/r/20230803063703.5659-1-zhuyinbo@loongson.cn
    Patches: [v6,1/2] soc: dt-bindings: add loongson-2 pm
             [v6,2/2] soc: loongson2_pm: add power management support

Patch: [GIT,PULL] Rockchip arm64 defconfig changes for 6.6 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=776798
  Lore link: https://lore.kernel.org/r/5353918.Isy0gbHreE@phil

Series: [GIT,PULL,1/4] Broadcom devicetree changes for 6.6
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=777464
  Lore link: https://lore.kernel.org/r/20230818164539.2871539-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/4] Broadcom devicetree changes for 6.6
             [GIT,PULL,2/4] Broadcom devicetree-arm64 changes for 6.6
             [GIT,PULL,3/4] Broadcom drivers changes for 6.6
             [GIT,PULL,4/4] Broadcom soc changes for 6.6

Patch: [GIT,PULL] Rockchip driver changes for 6.6 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=776797
  Lore link: https://lore.kernel.org/r/40318909.XM6RcZxFsP@phil

Patch: [GIT,PULL] Qualcomm ARM64 defconfig updates for v6.6
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=777248
  Lore link: https://lore.kernel.org/r/20230818023651.2484774-1-andersson@kernel.org

Patch: [GIT,PULL] Rockchip dts64 changes for 6.6 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=776795
  Lore link: https://lore.kernel.org/r/7414564.rnE6jSC6OK@phil

Patch: ARM: multi_v7_defconfig: Add SCMI regulator support
  Submitter: Alexandre Torgue <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=776632
  Lore link: https://lore.kernel.org/r/20230816123055.12636-1-alexandre.torgue@foss.st.com

Patch: [GIT,PULL] Rockchip dts32 changes for 6.6 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=776796
  Lore link: https://lore.kernel.org/r/6299163.hdfAi7Kttb@phil

Patch: [GIT,PULL] Qualcomm driver updates for v6.6
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=777246
  Lore link: https://lore.kernel.org/r/20230818023338.2484467-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm ARM32 DeviceTree updates for v6.6
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=777253
  Lore link: https://lore.kernel.org/r/20230818024928.2485173-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm ARM64 DeviceTree updates for v6.6
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=777585
  Lore link: https://lore.kernel.org/r/20230819034551.2537866-1-andersson@kernel.org

Patch: [GIT,PULL] RISC-V Devicetrees for v6.6-pt2
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=777604
  Lore link: https://lore.kernel.org/r/20230819-unwieldy-railing-9bba2b176aa7@spud

Patch: [GIT,PULL] arm64: dts: socfpga: updates for v6.6
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=777646
  Lore link: https://lore.kernel.org/r/20230819161418.931258-1-dinguyen@kernel.org

Patch: [GIT,PULL] Driver changes for omaps for v6.6
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=777263
  Lore link: https://lore.kernel.org/r/pull-1692158857-597450@atomide.com

Patch: [GIT,PULL] STM32 DT changes for v6.6 #1
  Submitter: Alexandre Torgue <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=776631
  Lore link: https://lore.kernel.org/r/c0524a16-ab27-0cb5-8e7b-c12f7bde7e0d@foss.st.com

Patch: [v2] soc: kunpeng_hccs: fix some sparse warnings about incorrect type
  Submitter: lihuisong (C) <lihuisong@huawei.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=776523
  Lore link: https://lore.kernel.org/r/20230816073706.33297-1-lihuisong@huawei.com


Total patches: 20

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


