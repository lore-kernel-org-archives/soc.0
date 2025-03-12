Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE8C1F4189
	for <soc@lists.linux.dev>; Wed, 12 Mar 2025 07:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741765243; cv=none; b=cUOHSumSupTEcIlFC+6uIXMePmYVG2KRfmZd3Aqx+a05ZnjsB+TfEGixXineleqnARQb8HBq2PofZiT/Xo/HjwxMsi+Q8WJT8mw8L3+ZScEl2xMCPYHLWo+mvsyRDvLV6BIZe3l8Iwy0vIr+3Fg/zD8r2Vrzl0o1XLmCTGCwrB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741765243; c=relaxed/simple;
	bh=Ll0u4SL2ekYYJZhxDteT/U6jFtv7SYneFXCAknm1IR0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uJs9HjrjkD338cl2DwkkQldJeVX8hZit8YTxDsLnPbLLH2bgFhWEof/dF5ujQsu39ZGpsWdszsPrmh0lMkMCm2xXZyEfxylMJQ1wBoFksRu25B/5e1tGqtDHy3Y7plPIlPL0PiLOaLtgzIdbr0bmZzHFhaw2BYoP2OeOcbW+TVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=njprxXF8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="njprxXF8"
Received: by smtp.kernel.org (Postfix)
	id 2C1AAC4AF09; Wed, 12 Mar 2025 07:40:43 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.kernel.org (Postfix) with ESMTP id 300A7C4CEEE;
	Wed, 12 Mar 2025 07:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 300A7C4CEEE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=hDg8L
	yTwf6Z5RZfJ2WcwAVMbQDI394/OUmNQpCPItl0=; b=njprxXF8Bppm24AkPfqjN
	7EbCLpa0AuOG4Tt3D0lIHuDbeLNw+8LwzM79+7v1ZO8IoTrBIsxF1gmmuulOYCLP
	PVjXPZdTED09GZ73BsP6G8IxFARi9vzPCf77mOeDq+hIhFShhO2fwqXPy1nNzkIm
	8SD78swPiSAUFtVl1pm5d0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAnwdRtOtFnQ6_FAA--.2767S3;
	Wed, 12 Mar 2025 15:40:31 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] i.MX SoC changes for 6.15
Date: Wed, 12 Mar 2025 15:40:02 +0800
Message-Id: <20250312074005.663165-2-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312074005.663165-1-shawnguo2@yeah.net>
References: <20250312074005.663165-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgAnwdRtOtFnQ6_FAA--.2767S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryrAF1DCrW5uFW5ur45KFg_yoWfGFX_GF
	9rJF4xJr1UJr13Aw15Gr10qr1UJw1kGFyUur18tr4Utr1Iq3W5Jwnrtr48Xr1DXF18GrWU
	Gr1UWw1kJw1IkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8xgA7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhEOZWfRL8cyTQAAsJ

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-6.15

for you to fetch changes up to 4f8ec94af325d501904d7e86363bd162004161bd:

  ARM: imx: mark imx53_suspend_sz as unused (2025-03-11 10:57:51 +0800)

----------------------------------------------------------------
i.MX SoC changes for 6.15:

- Mark imx53_suspend_sz as __maybe_unused to fix a possible build warning

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: imx: mark imx53_suspend_sz as unused

 arch/arm/mach-imx/common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

