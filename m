Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C93D2003CA
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424972; cv=none; b=InjSvhis6gF8L8fsWaem3b+MFPLpdjsRnXoOxm9HkQEHX47LM+qsv7FRu/3EwZv+oqIXycY7DRLhFXBSdfq/JZWa3c4YkHPELShWv5eMS/RcobzYGjxdTgcxO1cMH09cuByOlGIC/CbU17SLmz7Qy2VM7XLuNRChnGa47s4nwdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424972; c=relaxed/simple;
	bh=N5Dbhq+PyIA1qi/ISuAqOqDQKEtDYv/8OBTM/I6YXOo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=E6i5aRtmGg6WVRFSNdRhVEbTRLAz+HpdX3JHe6Sj4jDeapCA9/jTmoXQw/A1L02i8sSKK1ULxMIz3VSOlpUr77Ivg7+78j/3l5NTEVR8oHlM7Y/ixv+mUmU+Yd/8NPYeMYWJ+JlEalKvvJBYM8w+o8PwBzOioK82irCjxBzm8Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i6AWcDUa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i6AWcDUa"
Received: by smtp.kernel.org (Postfix)
	id 2F1AEC4CED5; Tue, 12 Nov 2024 15:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F08C4CECD
	for <soc@kernel.org>; Tue, 12 Nov 2024 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424972;
	bh=N5Dbhq+PyIA1qi/ISuAqOqDQKEtDYv/8OBTM/I6YXOo=;
	h=Subject:From:Date:To:Cc:From;
	b=i6AWcDUaNreQzIEGnNYqD/2stxDhHJDkWnYAaPPNgwP/4CeWSLw8lQf3gF9AV15mP
	 d4xhBGCA7X36zhKRDo3XjTgORR3hzoCO3j6hn44rnmpAklLbHbFg7RVWinsCPhhc/N
	 VUZ/ucMTXoqqCYENtnufDDjaON8xf5KHVg96VsTBXU1pEVwckTSMT5Zb7YjZbws5Hm
	 grnjPAz6Exoc9gxHVHUejpybObwi45iC5PIIrW28pBU7AGwsUmKSY/HkPziEzaNdq9
	 uNja9Xjp6SOgX1vQzk5zuldjHf0unxwIfAocrNfrp9vreOLX0+BHiu0PKyej5PcZ5i
	 ZjbZxTTC5vaNQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CA23809A80;
	Tue, 12 Nov 2024 15:23:03 +0000 (UTC)
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
 <173142498188.562452.9411508861729338319.git-patchwork-summary@kernel.org>
Date: Tue, 12 Nov 2024 15:23:01 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: soc: Switch back to struct platform_driver::remove()
  Submitter: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=904094
  Lore link: https://lore.kernel.org/r/20241029074859.509587-2-u.kleine-koenig@baylibre.com

Patch: [GIT,PULL] soc: ti: Driver updates for v6.13
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=906911
  Lore link: https://lore.kernel.org/r/20241106121708.rso5wvc7wbhfi6xk@maverick

Patch: [GIT,PULL] arm64: dts: ZynqMP SOC changes for 6.13
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=905396
  Lore link: https://lore.kernel.org/r/CAHTX3dK9PKmG_UG4MW=x5KmZCrd5PkcAZiNVgPFQ_zsPRgu+dg@mail.gmail.com

Patch: [GIT,PULL] Allwinner fixes for 6.12
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=907013
  Lore link: https://lore.kernel.org/r/ZyuRCalH2vhHXm0Q@wens.tw

Patch: platform: cznic: turris-omnia-mcu: Rename variable holding GPIO line names
  Submitter: Marek Behún <kabel@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=908388
  Lore link: https://lore.kernel.org/r/20241111121945.14217-1-kabel@kernel.org

Patch: platform: cznic: turris-omnia-mcu: Document the driver private data structure
  Submitter: Marek Behún <kabel@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=908350
  Lore link: https://lore.kernel.org/r/20241111103957.15899-1-kabel@kernel.org

Patch: [GIT,PULL] Qualcomm driver updates for v6.13
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=905725
  Lore link: https://lore.kernel.org/r/20241102231953.871067-1-andersson@kernel.org

Patch: [GIT,PULL] hisilicon: driver updates for v6.13
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=902982
  Lore link: https://lore.kernel.org/r/671B3FBD.8050905@hisilicon.com

Patch: bus: Switch back to struct platform_driver::remove()
  Submitter: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=908745
  Lore link: https://lore.kernel.org/r/77ef3031ad2d27f4ae695245cf7f62b3f9dda859.1731397206.git.u.kleine-koenig@baylibre.com

Patch: firmware: turris-mox-rwtm: Document the driver private data structure
  Submitter: Marek Behún <kabel@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=908327
  Lore link: https://lore.kernel.org/r/20241111095357.31932-1-kabel@kernel.org

Patch: [GIT,PULL] memory: drivers for v6.13
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=904102
  Lore link: https://lore.kernel.org/r/20241029075348.19580-1-krzysztof.kozlowski@linaro.org

Series: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.13
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=906009
  Lore link: https://lore.kernel.org/r/20241104112625.161365-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.13
             [GIT,PULL,2/2] MediaTek driver updates for v6.13

Patch: [GIT,PULL] Reset controller updates for v6.13
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=906455
  Lore link: https://lore.kernel.org/r/20241105105229.3729474-1-p.zabel@pengutronix.de


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


