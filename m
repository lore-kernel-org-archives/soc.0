Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000582F0C7E
	for <soc@lists.linux.dev>; Sat,  8 Aug 2026 20:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220497; cv=none; b=KMxapuejj++9tyz/X7EhX9/vO3SH5T9ifMyaflHbCvMmqZ7SMmJt+ld3+NwfE6w53BG6qSt8O9SZpxqQ436CvBE0IFqb+AUMW0krTc04+uhG/s8Fp0PTUpVhs8FRjl+zHC+31J5hlUwewmk9PjN0Td7FBhxBiinS7l2oF5+Wt2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220497; c=relaxed/simple;
	bh=g682/K/XVlGT9IzfZFdZL05poohMAAfyw6THDT1dUtc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=dZetw4elqUxApvlD+Nu9BjoUYWd5mk4UsoIeUWjLvhm4j3PLOTHO7A1IFuNyuzKl1nzzlR8hJiYRBjv33R1jKge7DM8VsjuDb3cjLwxmZCJZcUpIRvm4CN4KNpOZyV4xHVfI66LgB3kzG5rSWwW541KPyGeCz2Rez39m5P/krr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5W4RI9V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5W4RI9V"
Received: by smtp.kernel.org (Postfix)
	id A242E1F00A3A; Sat,  8 Aug 2026 20:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C14D1F000E9
	for <soc@kernel.org>; Sat,  8 Aug 2026 20:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786220495;
	bh=tSS6XisiLgZ4PBXJtFUZFTjvx1ntQc8boFQNiCZWFKo=;
	h=Subject:From:Date:To:Cc;
	b=M5W4RI9VQnWOyM6gOt2d4sQuliRQahPyG0SGUB66DAUEU0AQo7WWgc3Rvu5wC5N5Y
	 ZvXEI3I3Py/JS5A7pkLk6ySGculqXCTY5DWtVZIFxfLu80jaZMU7zM0bsNeMNYcxWI
	 k3nJAhcADdKBINOpD3uSasWnkloWGH+qrSZyhxo3uIhRSdEqwVbR9b0P1eWUZGtJK7
	 jEl0ybMyi6RgsGi3EESi+DaricJxqub/3s9QuAVXSPfcRBE98s8GOetvJnv0bJ+5Xk
	 Sjfm5R2XUWyq4ER2FSjjk3AAhV6mousXod+Ksgzv4O9z/uSuplKLdvCwRQyFLf6Lmo
	 xT8ShsFBMau9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 96433380CFFA;
	Sat,  8 Aug 2026 20:20:54 +0000 (UTC)
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
 <178622045302.2748994.5303309546951810824.git-patchwork-summary@kernel.org>
Date: Sat, 08 Aug 2026 20:20:53 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] RISC-V SpacemiT Devicetrees for v7.3
  Submitter: Yixun Lan <dlan@kernel.org>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1138811
  Lore link: https://lore.kernel.org/r/20260802024052-KYC1424545@kernel.org

Patch: [GIT,PULL] ARM: dts: OMAP updates for v7.3
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1139519
  Lore link: https://lore.kernel.org/r/7hbjbjjj7k.fsf@baylibre.com

Patch: [GIT,PULL] aspeed: First batch of ARM devicetree changes for 7.3
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1139815
  Lore link: https://lore.kernel.org/r/a0dbb1b1642b5d30f01adb5f48c51e426414dc90.camel@codeconstruct.com.au

Patch: [GIT,PULL] amlogic ARM64 DT updates for v7.3
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1138260
  Lore link: https://lore.kernel.org/r/7db3a138-facb-4132-aed8-8e8dcd3bdf60@linaro.org

Patch: [GIT,PULL] nuvoton: first batch of arm devicetree changes for 7.3
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1139804
  Lore link: https://lore.kernel.org/r/47b845574cb6242d0ef08de910943775f150f67e.camel@codeconstruct.com.au

Patch: [GIT,PULL] Rockchip dts64 changes for 7.3 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1138448
  Lore link: https://lore.kernel.org/r/2742274.XQYqjrCR6X@diego

Patch: [GIT,PULL] nuvoton: first batch of arm64 devicetree changes for 7.3
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1139808
  Lore link: https://lore.kernel.org/r/6343db5cb38990a58320ba85899f1b5253cad112.camel@codeconstruct.com.au

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v7.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1137606
  Lore link: https://lore.kernel.org/r/20260730164337.177159-1-andersson@kernel.org

Patch: [GIT,PULL] Allwinner DT Changes for 7.3
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1139536
  Lore link: https://lore.kernel.org/r/anC-91INc6lOHrg1@home.wens.tw

Patch: [GIT,PULL] arm64: dts: hisilicon dts updates for v7.3
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1137972
  Lore link: https://lore.kernel.org/r/6A6C59A0.4070501@hisilicon.com


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


