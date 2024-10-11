Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F406320FA9A
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644342; cv=none; b=P2pJzrn5ODi2inJcpvOSJeHQElPyPLPgP2MVAaE+B8PBLIbwCaE5AAwSusrbjwAkR7gUuPXQLc1b1s35unJ05CuZgLrXVTL4F7Hm6N6CMEt5V1X+seoY5NDRDJWyuqT84ZqN+WmiJXm5uwZj/plYp+u0c6ODd0oIjtLJiG0itBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644342; c=relaxed/simple;
	bh=nG3sH/udqWBuICidES3Xv39KY8zF3CEaMSCdGg5TpAY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=B8ceVtlO0dPKc7Fi9lLldyHAfD03hLIEAo/ET4ccQTxci/Fy/72IVIDH+l0bvEzTTnkAjLg6jM631qw287oyWxrUXG9IUPRxfvOuIi/eLTOsDVKfIGyQue7Le0W9JXPI5KHv7osDHQaflRrAksJnHimqu0L1aPqs4jqrGCXQhlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OlQ3q8b7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OlQ3q8b7"
Received: by smtp.kernel.org (Postfix)
	id A6D24C4CECD; Fri, 11 Oct 2024 10:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911C4C4CEC3
	for <soc@kernel.org>; Fri, 11 Oct 2024 10:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644341;
	bh=nG3sH/udqWBuICidES3Xv39KY8zF3CEaMSCdGg5TpAY=;
	h=Subject:From:Date:To:Cc:From;
	b=OlQ3q8b782TkH80eLn7ypannqzpOFK3TZsFmyf7PPlN/4ZWb9wO2BIVi3SVjsgZMk
	 cV0MdO/pE8a6zRgWREpKIKXXNAadOKqtSVKoAR2uTdVGN9x/LZJJbc1LuqwldXBSNb
	 8CPFCHv8gfinDsKuhjumUm87BcXreo3/uKUblmej8cvnOyyldmS2ERDqUG6BPNV9OI
	 CgrwblbrKySa546Tvlw7VvP701UWyXB0fuFwVT2YacYN5nlG9E5Iy+CLuvcdj4ToYd
	 CoQwlto4p9cQqOvZyb/9i70pTNkKAaWJ5ucHfJZIKVAPj9ItFs+98EXdaooAaC5y8k
	 FP6X65zB3T8kA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3AE723822E4C;
	Fri, 11 Oct 2024 10:59:07 +0000 (UTC)
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
 <172864434580.2676212.10667209783475884371.git-patchwork-summary@kernel.org>
Date: Fri, 11 Oct 2024 10:59:05 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: [GIT,PULL,1/4] Broadcom devicetree changes for 6.12
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=887863
  Lore link: https://lore.kernel.org/r/20240906180643.2275460-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/4] Broadcom devicetree changes for 6.12

Series: Updates for turris-mox-rwtm driver
  Submitter: Marek Behún <kabel@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=885436
  Lore link: https://lore.kernel.org/r/20240831092050.23093-1-kabel@kernel.org
    Patches: [v5,01/16] firmware: turris-mox-rwtm: Use macro constant instead of hardcoded 4096
             [v5,02/16] firmware: turris-mox-rwtm: Use ETH_ALEN instead of hardcoded 6
             [v5,03/16] firmware: turris-mox-rwtm: Use the boolean type where appropriate
             [v5,04/16] firmware: turris-mox-rwtm: Hide signature related constants behind macros
             [v5,05/16] firmware: turris-mox-rwtm: Fix driver includes
             [v5,06/16] firmware: turris-mox-rwtm: Use sysfs_emit() instead of sprintf()
             [v5,07/16] firmware: turris-mox-rwtm: Don't create own kobject type
             [v5,08/16] firmware: turris-mox-rwtm: Simplify debugfs code
             [v5,09/16] firmware: turris-mox-rwtm: Convert rest to devm_* and get rid of driver .remove()
             [v5,10/16] firmware: turris-mox-rwtm: Use dev_err_probe() where possible
             [v5,11/16] firmware: turris-mox-rwtm: Drop redundant device pointer
             [v5,12/16] firmware: turris-mox-rwtm: Use devm_mutex_init() instead of mutex_init()
             [v5,13/16] firmware: turris-mox-rwtm: Use container_of() instead of hwrng .priv member
             [v5,14/16] firmware: turris-mox-rwtm: Use EOPNOTSUPP instead of ENOSYS
             [v5,15/16] firmware: turris-mox-rwtm: Use ALIGN() instead of hardcoding
             [v5,16/16] firmware: turris-mox-rwtm: Deduplicate command execution code

Patch: dmaengine: cirrus: check that output may be truncated
  Submitter: Alexander Sverdlin <alexander.sverdlin@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=891793
  Lore link: https://lore.kernel.org/r/2bf9c37aad8f085839f9c63104f7275742f51945.camel@gmail.com

Patch: soc: ep93xx: drop reference to removed EP93XX_SOC_COMMON config
  Submitter: Lukas Bulwahn <lbulwahn@redhat.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=892367
  Lore link: https://lore.kernel.org/r/20240924092423.50734-1-lukas.bulwahn@redhat.com

Patch: [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v6.12
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=886942
  Lore link: https://lore.kernel.org/r/20240904193228.15466-1-andersson@kernel.org

Patch: [GIT,PULL] SOC FSL fixes for 6.12
  Submitter: Christophe Leroy <christophe.leroy@csgroup.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=895079
  Lore link: https://lore.kernel.org/r/c954bdb0-0c16-491a-8662-37e58f07208f@csgroup.eu

Series: [GIT,PULL,1/3] soc: ti: Driver updates for v6.12
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=886379
  Lore link: https://lore.kernel.org/r/20240903155632.525twuumykwnfkiz@subtitle
    Patches: [GIT,PULL,1/3] soc: ti: Driver updates for v6.12
             [GIT,PULL,2/3] arm64: defconfig: TI K3 platform updates for v6.12
             [GIT,PULL,3/3] arm64: dts: ti: K3 devicetree updates for v6.12

Patch: MAINTAINERS: Update EP93XX ARM ARCHITECTURE maintainer
  Submitter: Nikita Shubin <nikita.shubin@maquefel.me>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=890968
  Lore link: https://lore.kernel.org/r/20240917163401.6501-1-nikita.shubin@maquefel.me

Patch: dmaengine: cirrus: ERR_CAST() ioremap error
  Submitter: Alexander Sverdlin <alexander.sverdlin@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=891792
  Lore link: https://lore.kernel.org/r/d4b542f1d678796fbf094ebcc77295af3617bca0.camel@gmail.com

Patch: [GIT,PULL] Microchip AT91 device tree updates for v6.12
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=885553
  Lore link: https://lore.kernel.org/r/20240901133110.2038675-2-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v6.12
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=886980
  Lore link: https://lore.kernel.org/r/20240904215752.24465-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm Arm64 defconfig updates for v6.12
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=886951
  Lore link: https://lore.kernel.org/r/20240904194827.16766-1-andersson@kernel.org

Patch: [GIT,PULL] RISC-V Sophgo Devicetrees for v6.12
  Submitter: Chen Wang <unicorn_wang@outlook.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=886513
  Lore link: https://lore.kernel.org/r/MA0P287MB28228F4FC59B057DF57D9A11FE9C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM

Patch: [GIT,PULL] SOC FSL for 6.12 (retry)
  Submitter: Christophe Leroy <christophe.leroy@csgroup.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=886098
  Lore link: https://lore.kernel.org/r/326d9a7d-7674-4c28-aa40-dd2c190244dd@csgroup.eu

Patch: [GIT,PULL] RISC-V T-HEAD Devicetrees for v6.12
  Submitter: Drew Fustini <drew@pdp7.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=881669
  Lore link: https://lore.kernel.org/r/ZsWs8QiVruMXjzPc@x1

Series: [GIT,PULL,1/3] samsung: drivers for v6.12
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=883788
  Lore link: https://lore.kernel.org/r/20240827121638.29707-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/3] samsung: drivers for v6.12
             [GIT,PULL,2/3] arm64: dts: samsung: dt for v6.12

Series: MAINTAINERS: ensure that mailing lists are L: not M:
  Submitter: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=891692
  Lore link: https://lore.kernel.org/r/20240920-maintainers-m-to-l-tweak-v1-0-ea80b5cd3420@linuxfoundation.org
    Patches: [1/2] MAINTAINERS: fix PKTCDVD DRIVER to use L: for the list address
             [2/2] MAINTAINERS: use the canonical soc mailing list address and mark it as L:

Patch: net: cirrus: use u8 for addr to calm down sparse
  Submitter: Nikita Shubin <nikita.shubin@maquefel.me>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=891882
  Lore link: https://lore.kernel.org/r/20240922065212.7483-1-nikita.shubin@maquefel.me

Patch: [GIT,PULL,1/1] Broadcom devicetree fixes for 6.12
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=896885
  Lore link: https://lore.kernel.org/r/20241008220440.23182-1-florian.fainelli@broadcom.com

Patch: [GIT,PULL] Microchip AT91 defconfig updates for v6.12
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=885552
  Lore link: https://lore.kernel.org/r/20240901133110.2038675-1-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] memory: drivers for v6.12
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=883800
  Lore link: https://lore.kernel.org/r/20240827122926.30794-1-krzysztof.kozlowski@linaro.org

Patch: [v2] Documentation/process: maintainer-soc: clarify submitting patches
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=892731
  Lore link: https://lore.kernel.org/r/20240925095635.30452-1-krzysztof.kozlowski@linaro.org


Total patches: 41

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


