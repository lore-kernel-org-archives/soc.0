Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B57E34A3D8
	for <soc@lists.linux.dev>; Mon, 26 Jan 2026 17:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769447334; cv=none; b=Y4I91GeKe1Qtn7K0ZXFm+w6otXHh5Wqkp05VM7sRPoW1fUu/3BOo9WPKuA+j4SgFAksEHm+cM0oF4/K0Do0OzfIZZZ1YR1w9Zq8ZOFLsKwQrDAXHERluY52qVOyHsX4giYyA70uRybPIoZuvGU7+OAoLmSZW5TYxjPi3XoH35o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769447334; c=relaxed/simple;
	bh=W1xB9QU6spPHwpQnnPIfHmKuNeLN3ovlyTFgI/TQU+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HXtTOYdoq7pwqlgeq/RYNa+8cAIqjKpYgYk/fuMZgSzGfJEKZxQVQjfrkjC8pjVjpoAqF81wi3HhHzXPQ2DuGpF0ov46CwTvv9VVqJhnAfOA0YwZISkOIOwct0YMUgnCbklv6DmyNWpgm7KHSSizEhwGlpOQxO9bngGeLCf91lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=A+qF168u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="A+qF168u"
Received: by smtp.kernel.org (Postfix)
	id BD702C2BCAF; Mon, 26 Jan 2026 17:08:53 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3091EC16AAE;
	Mon, 26 Jan 2026 17:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3091EC16AAE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=KLkm2SXxYAqywK7J66VoIRSl6/ndSOtBJAmzzNChgmQ=; b=A+qF168uNc0We3BIlPN2S902p+
	WBur0Py/hf1/tlYzh6ydr5dLyr5FX4+nDan64FPARlaaE639uTfLR26GPBZrbdEImi6FDb7sTlkbd
	L4xPOxcVUKqNyoGqmXik8vFVYPiT8yYR79aFOhsaFyCFYpbGH2/SQxPdXWWG5BiGa1nmrws+h9AmW
	MV0wsoSlQwDxnpl2PPjyg+zYNkVqIZ74CDJKafUHw2QtgidSMSd0XaRY7ITq4fI2/SX3m5cBygAOd
	LxatpjfY/3vVqeYRUL2wq3Yvyowo+cs2GfVHjaMXiZMcy5A8cxwsmN4UZha1sstJVcFeoQTbHmMXL
	RStyPFDw==;
Received: from i53875a0f.versanet.de ([83.135.90.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vkQ53-004eOe-Ll; Mon, 26 Jan 2026 18:08:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 6.20 #1
Date: Mon, 26 Jan 2026 18:08:49 +0100
Message-ID: <7385436.MhkbZ0Pkbq@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.20-rockchip-drivers1

for you to fetch changes up to 75fb63ae031211e9264ac888fabc2ca9cd3fcccf:

  soc: rockchip: grf: Support multiple grf to be handled (2026-01-16 11:33:50 +0100)

----------------------------------------------------------------
Two fixes for the default-settings code for the General-Register-Files,
which sets system defaults for some settings like disabling the automatic
jtag/sdmmc switching.

One is a corrected register-offset and the other makes the code actually
look for all matched GRF instances, which it didn't do before.

----------------------------------------------------------------
Shawn Lin (2):
      soc: rockchip: grf: Fix wrong RK3576_IOCGRF_MISC_CON definition
      soc: rockchip: grf: Support multiple grf to be handled

 drivers/soc/rockchip/grf.c | 57 +++++++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 29 deletions(-)



