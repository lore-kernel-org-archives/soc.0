Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF2C42AF8D
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874862; cv=none; b=JO6ZAEUrKy3wMhFfNNzl83wLwfSOLykt8FwDe2QVApjYEDsbBpURFggNsEUz4W52lDNv8ys566IQaREGsBi3vJIZAZ9vPsCKSGOm6L42/cg9K58XjLIEO0Nr+jTX5ZmT+uN8CTidEJKEDxU9NbjoXZlNGt86aPF17ZWwv7fMkKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874862; c=relaxed/simple;
	bh=9+eX8iH9DFaBWdkztVG+5Bjc6OCjMJFVQ7KK3sO1rx4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=hQX0dAeaUrGBAdpYsVA+X03UorTG6iAumbsqa3pJVHksuBAQz6WSTgJ7Njg2wgkyQ5K/TdAnXFuBTQRDZIPgzDGRj6MBXjvYE1PFXC3hULnsvNyGCW79qpORMsu8ecUAu391D824h/g9z7sRSNj1yRZTNSuf4fz1wqNk6n8RapM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJALoqJ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJALoqJ9"
Received: by smtp.kernel.org (Postfix)
	id 425891F00A3A; Tue,  4 Aug 2026 20:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC8C1F000E9
	for <soc@kernel.org>; Tue,  4 Aug 2026 20:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874859;
	bh=Fshc/C4X1vyQQrgA+Ivb7qL8VVlsfF6OvytYPvvO1oE=;
	h=Subject:From:Date:To:Cc;
	b=iJALoqJ9pEjXwqtTwMhHCfnlI8GXgOg3A+UqaJL+vLLg1oiOyrN9yikmjegJfUod2
	 PypIQHuGYxHS0Jvqh0k4qvotRlkDywy+s9A6dSnCOMGqU7LF9KUe5Vn9slgRb5fdTT
	 mM70i+EthJSKAKovO2m273w7ON/khJPA9h/tQsWfPh2QJ1NEoL7L4MCyNrwsFwEmCz
	 DFAxaa4r/vOYl+8CbCy+pSrIPbR+c0ZKjGwWvYPfGIQFps+PPeixXVVrYwOZzwgF0M
	 Ex4wNU6BO4XDt2K3AJZRa+J7w+HhM2GxsVolVEOKfwvaq5m5flnmNPHXLmkwvxqG96
	 NFhrUjjwyVUYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D091739263B9;
	Tue,  4 Aug 2026 20:20:20 +0000 (UTC)
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
 <178587481936.3769923.7473115483233622265.git-patchwork-summary@kernel.org>
Date: Tue, 04 Aug 2026 20:20:19 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/4] dt-bindings: Changes for v7.3-rc1
  Submitter: Thierry Reding <thierry.reding@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1138963
  Lore link: https://lore.kernel.org/r/20260802165148.1259649-1-thierry.reding@kernel.org
    Patches: [GIT,PULL,1/4] dt-bindings: Changes for v7.3-rc1
             [GIT,PULL,2/4] ARM: Core Tegra changes for v7.3-rc1
             [GIT,PULL,3/4] soc/tegra: Changes for v7.3-rc1

Patch: [GIT,PULL] Qualcomm Arm64 defconfig updates for v7.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1137611
  Lore link: https://lore.kernel.org/r/20260730164947.177468-1-andersson@kernel.org

Patch: [GIT,PULL] Allwinner Defconfig Changes for 7.3
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1139539
  Lore link: https://lore.kernel.org/r/anC_IPRrMwKHzc0e@home.wens.tw

Patch: [GIT,PULL] aspeed: First batch of driver changes for 7.3
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1139834
  Lore link: https://lore.kernel.org/r/7028fd175c1cab44bc7696b5cb92282180e1f0dc.camel@codeconstruct.com.au

Patch: [GIT,PULL,v2] Broadcom devicetree fixes for 7.2
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1137737
  Lore link: https://lore.kernel.org/r/20260730232519.2706487-1-florian.fainelli@broadcom.com

Patch: [GIT,PULL] aspeed: First batch of driver fixes for 7.2
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1139850
  Lore link: https://lore.kernel.org/r/3da63bea367b3490b041c909a4503cc2b5e9c394.camel@codeconstruct.com.au

Patch: [GIT,PULL] Amlogic drivers updates for v7.3
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1138261
  Lore link: https://lore.kernel.org/r/41698506-1585-4b8d-930e-91a79b58b833@linaro.org

Patch: [GIT,PULL] Qualcomm driver updates for v7.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1137605
  Lore link: https://lore.kernel.org/r/20260730164052.176832-1-andersson@kernel.org

Patch: [GIT,PULL] soc: drivers: omap updates for v7.3
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1139524
  Lore link: https://lore.kernel.org/r/7hzez3i4le.fsf@baylibre.com

Patch: [GIT,PULL] nuvoton: First batch of ARM arch fixes for 7.2
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1139867
  Lore link: https://lore.kernel.org/r/7e2b04791c00f37d2cda5fb63b10ab41f9e682d2.camel@codeconstruct.com.au

Patch: [GIT,PULL] aspeed: Update MAINTAINERS for 7.3
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1139844
  Lore link: https://lore.kernel.org/r/cc2b296319ac4b52602c891ab04807bd18a32bd1.camel@codeconstruct.com.au

Patch: [GIT,PULL] arm/omap: defconfig updates for v7.3
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1139518
  Lore link: https://lore.kernel.org/r/7hh5lbjj8o.fsf@baylibre.com


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


