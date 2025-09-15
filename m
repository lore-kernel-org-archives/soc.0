Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D59315E5DC
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944241; cv=none; b=i3SGPV72udsGKBGh7MgSnom4rF4mbgA2iTOctVya+Deu210jWYrG0PI48ZDNWvgIdbV0xzRaOOu9w4cKfZrtD7FzngHOi79itja4CMJ5RwiX4HgJtAH76u8nMwTwpDxLXpe7Cn8qCKxe1NdPXqeojtVGvup3Svcjajwo/F1LecI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944241; c=relaxed/simple;
	bh=ffyhxoG4HPVSBxOnbTidT8PwKXOxe0ey0wdquTKuwRQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=axXMQjaKQdGZ0Qquhe1VjVgu71rDbusbcF00FM17MIgbMaeQDppknLjmo1pYgkaqv2DJnFL7gEvzEAEcmHYjHhuH/aEM0oJD/meuaz8yN3gcF1HOG0hY4hUwqg3t87Z8lQIxfYy8iaylBqrbWxYGfxmvK2AiLmGEqSvKuGyZl6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iK+tImuL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iK+tImuL"
Received: by smtp.kernel.org (Postfix)
	id E2497C4CEF7; Mon, 15 Sep 2025 13:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC999C4CEF1
	for <soc@kernel.org>; Mon, 15 Sep 2025 13:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944240;
	bh=ffyhxoG4HPVSBxOnbTidT8PwKXOxe0ey0wdquTKuwRQ=;
	h=Subject:From:Date:To:Cc:From;
	b=iK+tImuLohnMSBCuopnyPsuuWbRRykmExXOglLTIHTG4u1GIY/Vo5uUPayG+LccZM
	 B0mJEwUKT8IYzReQfG2XwbxoJXwHPh/YWjNA0FVV8qkkUqlEgpvgHbpZBZYuFrkmIS
	 kd6WWqItsAZML/ilMnk0vJ+Ek2+hN/BuA5xICIKI63UKzmWaK0VFQwPh4CnLsOl17a
	 t/GxQxBZkpafCkYn7W0DYF6ex77oXEGDTSCI3imVEsizELHpZ48pthzquJ753RT6a/
	 uGIccvV1PvssC43tzOAHdShUpXMxLjgJl5eRjSa5m+f2An30ZnpuraFMU5ne0JYnUL
	 0lfNoprIEkWzg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 748B939D0C18;
	Mon, 15 Sep 2025 13:50:42 +0000 (UTC)
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
 <175794424096.4179625.8992770904970946021.git-patchwork-summary@kernel.org>
Date: Mon, 15 Sep 2025 13:50:40 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/4] Broadcom defconfig-arm64 changes for 6.18
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001054
  Lore link: https://lore.kernel.org/r/20250910171910.666401-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/4] Broadcom defconfig-arm64 changes for 6.18
             [GIT,PULL,3/4] Broadcom devicetree-arm64 changes for 6.18

Patch: [GIT,PULL] STi DT changes for v6.18 #2
  Submitter: Patrice CHOTARD <patrice.chotard@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001873
  Lore link: https://lore.kernel.org/r/4a710c05-aeeb-4421-b3a1-5bfb8230d51d@foss.st.com

Patch: arm64: dts: apm: Clean-up clock bindings
  Submitter: Rob Herring (Arm) <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001132
  Lore link: https://lore.kernel.org/r/20250910223020.612244-2-robh@kernel.org

Patch: [PULL,REQUEST,RESEND] i2c-gpio-fixes-for-6.18
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=998791
  Lore link: https://lore.kernel.org/r/aLlgGdrFEjh26knK@shikoro

Patch: [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v6.18
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001530
  Lore link: https://lore.kernel.org/r/20250911220940.3023575-1-andersson@kernel.org

Patch: [GIT,PULL] Rockchip dts32 changes for 6.18 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=999778
  Lore link: https://lore.kernel.org/r/12138356.VV5PYv0bhD@phil

Patch: [GIT,PULL] RISC-V T-HEAD Devicetrees for v6.18
  Submitter: Drew Fustini <fustini@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=999658
  Lore link: https://lore.kernel.org/r/aLyIXR1G9DUzwGWc@x1

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v6.18
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001550
  Lore link: https://lore.kernel.org/r/20250911233600.3033675-1-andersson@kernel.org

Series: Renesas SoC updates for v6.18 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001732
  Lore link: https://lore.kernel.org/r/cover.1757669912.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas driver updates for v6.18 (take two)
             [GIT,PULL,2/3] Renesas DT binding updates for v6.18
             [GIT,PULL,3/3] Renesas DTS updates for v6.18 (take two)

Series: [GIT,PULL,1/4] dt-bindings: Changes for v6.18-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1002132
  Lore link: https://lore.kernel.org/r/20250914063927.89981-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/4] dt-bindings: Changes for v6.18-rc1
             [GIT,PULL,3/4] ARM: tegra: Device tree changes for v6.18-rc1
             [GIT,PULL,4/4] arm64: tegra: Device tree changes for v6.18-rc1

Patch: arm64: dts: socionext: Drop "linux,spdif-dit" port node unit-address
  Submitter: Rob Herring (Arm) <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001150
  Lore link: https://lore.kernel.org/r/20250910233923.778992-2-robh@kernel.org

Patch: [GIT,PULL] aspeed: further devicetree changes for v6.18
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1002274
  Lore link: https://lore.kernel.org/r/5793039afcedeb28179a3c9909631d8251abc73e.camel@codeconstruct.com.au

Patch: [GIT,PULL,RESEND] arm64: ZynqMP DT changes for v6.18
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001746
  Lore link: https://lore.kernel.org/r/CAHTX3dK6if9f+-DW5ZEnfSO4=K_Zje-WH-fwysTY77farsSS9g@mail.gmail.com

Patch: ARM: mach-hpe: Rework support and directory structure
  Submitter: Andrew Davis <afd@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=991153
  Lore link: https://lore.kernel.org/r/20250813170308.290349-1-afd@ti.com

Patch: arm64: dts: apm: Move slimpro nodes out of "simple-bus" node
  Submitter: Rob Herring (Arm) <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001128
  Lore link: https://lore.kernel.org/r/20250910214822.508317-2-robh@kernel.org

Patch: [GIT,PULL] MediaTek ARM64 DTS updates for v6.18
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001017
  Lore link: https://lore.kernel.org/r/46756067-ca2f-4053-b9e9-bc6e66170b21@gmail.com

Patch: [GIT,PULL] NXP LPC device tree changes for v6.18
  Submitter: Vladimir Zapolskiy <vz@mleia.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001346
  Lore link: https://lore.kernel.org/r/20250911130642.41958-1-vz@mleia.com

Patch: [GIT,PULL] ARM: mvebu: dt64 for v6.18 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001863
  Lore link: https://lore.kernel.org/r/87frcrn1o0.fsf@BLaptop.bootlin.com

Patch: [GIT,PULL] Rockchip dts64 changes for 6.18 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=999777
  Lore link: https://lore.kernel.org/r/5241735.C4sosBPzcN@phil

Patch: [GIT,PULL] ARM: dts: samsung: dts for v6.18
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1000682
  Lore link: https://lore.kernel.org/r/20250909184559.105777-2-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] arm64: dts: socfpga: agilex5: updates for v6.18
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=999851
  Lore link: https://lore.kernel.org/r/20250908040718.187857-1-dinguyen@kernel.org

Series: [GIT,PULL,1/2] arm/arm64: defconfig for v6.18
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1000654
  Lore link: https://lore.kernel.org/r/20250909180127.99783-3-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] arm/arm64: defconfig for v6.18
             [GIT,PULL,2/2] arm64: dts: samsung: dts for v6.18

Patch: [GIT,PULL] arm64: dts: cleanups for v6.18
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1000672
  Lore link: https://lore.kernel.org/r/20250909182256.102840-2-krzysztof.kozlowski@linaro.org


Total patches: 29

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


