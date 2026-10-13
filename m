Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFD35172C2
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907819; cv=none; b=cPL6GUilL/ZMbybtOjMpyH+7Z4SgR1t9SpNXSTfdEDqYTrnzIG14QVJ1KmkywI5ptGkOh/wW+Zv9YoiwsIXVwzBLn0BhM+2D3qAizuWkhN5P6NlVqBpD7fjKiwu9C5nMdrRnxXuIwXI6N0H0uMEm1NVymjFyIzARiM4OW85UkUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907819; c=relaxed/simple;
	bh=MjefmMGTWdToCUm60ZzFvb6e/dCu6tFMaMb4xhS3LEA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=qB5PVZLWVxZ8PwB30gk22kIdKwL5LdQH6tG7RW0RaV5vmUV++O/zeBsQsWt7OnvJMRHIuS0aZEpwJxy5rUfQw0inTGc6tEe6G/XbL1Di4N1tro+uqoelJ2PB/ba8DOrNL1HpwmvRLijfdzwKRx8aqWNtndQG3XpL7S1E2zQ660Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbzaKF36; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbzaKF36"
Received: by smtp.kernel.org (Postfix)
	id 3CDEA1F0089F; Tue, 13 Oct 2026 16:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25EB61F0089E
	for <soc@kernel.org>; Tue, 13 Oct 2026 16:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907818;
	bh=kRHihTa2WcZ5Me6lPUOkTHN/gzA159OZ83U1JHkmmMs=;
	h=Subject:From:Date:To:Cc;
	b=NbzaKF36Fv/+PbEkrdPrvoLA4jWj64SX2erYnxRl6QDUYjSGC6P9bLyM21QYrxFyb
	 3U2YKOtOql1EvmtLI8R3kcA9TCSiX8kMEpJnV/9SV5gAnwWqPJjh0odGrU0TehE9dE
	 2LLHHJ5qFr3j5pK+Exfm2ljDnklW86e9Qp3CF11UdFY0PXt7zUR+ThQgmPw1/ceDL9
	 9M/HP03GsYXxrtcE/ghasiJ7PxE6GAkqzAP6XloYNiLk3POKJtseouQgVdQq8vTbwr
	 ne1dzDBlnlgI4U+36xSlvdM2tcFxKmx9FRMdsG87JNueS0EKPpnELp6s5zeEvyuvsQ
	 DjLz7LX0ZpHcg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F3AB339D5FD8;
	Tue, 13 Oct 2026 16:10:17 +0000 (UTC)
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
 <179190781647.417156.3715984063145775082.git-patchwork-summary@kernel.org>
Date: Tue, 13 Oct 2026 16:10:16 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Amlogic drivers updates for v7.4
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1180242/
  Lore link: https://lore.kernel.org/r/a1f0aa7d-be6b-4229-8345-66595a47be74@linaro.org

Patch: [GIT,PULL] More Qualcomm driver updates for v7.4
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1184143/
  Lore link: https://lore.kernel.org/r/20261012190332.10322-1-andersson@kernel.org

Patch: [GIT,PULL] Apple SoC driver changes for v7.4
  Submitter: Sven Peter <sven@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1178541/
  Lore link: https://lore.kernel.org/r/20261002190958.8205-1-sven@kernel.org

Patch: [GIT,PULL] ARM: mvebu: arm for v7.4 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1179274/
  Lore link: https://lore.kernel.org/r/87tsn16wqf.fsf@BLaptop.bootlin.com

Patch: [GIT,PULL] TEE QTEE update for v7.4
  Submitter: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1178860/
  Lore link: https://lore.kernel.org/r/20261003142421.GA928135@rayden

Patch: [GIT,PULL] Microchip AT91 SoC updates for v7.4
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1182112/
  Lore link: https://lore.kernel.org/r/20261009061202.29652-1-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] More Qualcomm Arm64 defconfig updates for v7.4
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1184151/
  Lore link: https://lore.kernel.org/r/20261012192301.13361-1-andersson@kernel.org

Patch: [v1] bus: arm-cci: Drop CPU node reference in cci_ace_init_ports()
  Submitter: Yuho Choi <oss.patchbox@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1172420/
  Lore link: https://lore.kernel.org/r/20260923163536.596107-1-oss.patchbox@gmail.com

Series: [GIT,PULL,1/4] samsung: drivers for v7.4
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1179533/
  Lore link: https://lore.kernel.org/r/20261005101845.34752-5-krzk@kernel.org
    Patches: [GIT,PULL,1/4] samsung: drivers for v7.4
             [GIT,PULL,4/4] ARM: samsung: mach for v7.4

Series: [GIT,PULL,1/5] soc: ti: Driver updates for v7.4
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1179635/
  Lore link: https://lore.kernel.org/r/20261005124915.e632elbacgr6nxgs@anyway
    Patches: [GIT,PULL,1/5] soc: ti: Driver updates for v7.4
             [GIT,PULL,2/5] arm64: defconfig: TI K3 config updates for v7.4

Series: Renesas SoC updates for v7.4 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1178282/
  Lore link: https://lore.kernel.org/r/cover.1790939711.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/2] Renesas driver updates for v7.4 (take two)

Patch: [GIT,PULL] memory: drivers for v7.4
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1179583/
  Lore link: https://lore.kernel.org/r/20261005110427.41458-2-krzk@kernel.org

Patch: [RESEND] arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms
  Submitter: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1173609/
  Lore link: https://lore.kernel.org/r/20260925-arm64-have-shared-gpios-v1-1-57fed3fae35c@oss.qualcomm.com

Series: coreboot CFR firmware attributes
  Submitter: Sean Rhodes <sean@starlabs.systems>
  Patchwork: https://patchwork.kernel.org/series/1155562/
  Lore link: https://lore.kernel.org/r/cover.1788284852.git.sean@starlabs.systems
    Patches: [v14,1/5] firmware: Move firmware attributes class helper
             [v14,5/5] arm64: defconfig: Update coreboot firmware symbols

Patch: [GIT,PULL] ARM: vexpress: Fixes for v7.4
  Submitter: Sudeep Holla <sudeep.holla@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1180969/
  Lore link: https://lore.kernel.org/r/20261007150034.624664-1-sudeep.holla@kernel.org

Patch: [GIT,PULL] arm: soc: OMAP fixes for v7.4
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1175471/
  Lore link: https://lore.kernel.org/r/7hzex19sxw.fsf@baylibre.com

Patch: [GIT,PULL] SOC FSL for 7.4
  Submitter: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1183694/
  Lore link: https://lore.kernel.org/r/53a2dd80-3d3e-4b6f-9419-c71434c41a82@kernel.org

Series: [GIT,PULL,1/7] Device tree bindings changes for v7.4-rc1
  Submitter: Thierry Reding <thierry.reding@kernel.org>
  Patchwork: https://patchwork.kernel.org/series/1178814/
  Lore link: https://lore.kernel.org/r/20261003095924.1370238-1-thierry.reding@kernel.org
    Patches: [GIT,PULL,1/7] Device tree bindings changes for v7.4-rc1
             [GIT,PULL,2/7] ARM: Core changes for v7.4-rc1
             [GIT,PULL,3/7] soc/tegra: Changes for v7.4-rc1
             [GIT,PULL,7/7] arm64: tegra: Default configuration changes for v7.4-rc1

Series: [GIT,PULL,1/2] SoCFPGA DTS updates for v7.4
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Patchwork: https://patchwork.kernel.org/series/1181759/
  Lore link: https://lore.kernel.org/r/20261008164735.566333-1-dinguyen@kernel.org
    Patches: [GIT,PULL,1/2] SoCFPGA DTS updates for v7.4
             [GIT,PULL,2/2] MAINTAINERS: socfpga: update for v7.4

Patch: [GIT,PULL] i.MX drivers change for 7.4
  Submitter: Frank Li <Frank.Li@oss.nxp.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1175525/
  Lore link: https://lore.kernel.org/r/20260928190055.1994853-1-Frank.Li@oss.nxp.com

Patch: [GIT,PULL] arm: defconfig: OMAP related updates for v7.4
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1175479/
  Lore link: https://lore.kernel.org/r/7htsn99sx1.fsf@baylibre.com

Patch: [GIT,PULL] Qualcomm driver updates for v7.4 (second attempt)
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1182848/
  Lore link: https://lore.kernel.org/r/20261010073609.3689061-1-andersson@kernel.org

Patch: [GIT,PULL] i.MX SoC Changes for v7.4
  Submitter: Frank Li <Frank.Li@oss.nxp.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1175514/
  Lore link: https://lore.kernel.org/r/20260928184508.1978455-1-Frank.Li@oss.nxp.com

Patch: [GIT,PULL] Visconti5 SoC Changes for v7.4
  Submitter: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1177343/
  Lore link: https://lore.kernel.org/r/TY7PR01MB14818E7E9984CE8F0B260CC73CD8A2@TY7PR01MB14818.jpnprd01.prod.outlook.com

Patch: [GIT,PULL] Qualcomm driver fixes for v7.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1171343/
  Lore link: https://lore.kernel.org/r/20260922130653.357615-1-andersson@kernel.org

Patch: [v1] bus: arm-cci: Drop cci-control-port node reference in __cci_ace_get_port()
  Submitter: Yuho Choi <oss.patchbox@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1172424/
  Lore link: https://lore.kernel.org/r/20260923164122.596910-1-oss.patchbox@gmail.com


Total patches: 33

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


