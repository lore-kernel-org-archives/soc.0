Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4464C24503F
	for <soc@lists.linux.dev>; Mon, 17 Nov 2025 12:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763382880; cv=none; b=cNrgeyphA46mZ4GZ+weANy1hc2UwGr2yBEvqGQ/wVKEVlgr1RIV1nIBoqzkr+gJVTSCT5MB0+JBLIq2ZoU3A4C4LhCaKA/bf+J16ibRV4Fy8+XBKspiX5u28kW9IdjZaTrRerrMSQOwi/5ZmQ5yLVgAhWXUKjkW0+HOPMcoG4w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763382880; c=relaxed/simple;
	bh=ihWPvKdltszURRn7Ntwu/TDU4oo/GXyaeUWJQgTkeUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oprctiMolr4s4d/cV0avecBbsIYz4BPiW7BqU3vopvPLIt3euNfvhoy9ZzQwobe19+gPeK4+llI7FIZT/ySX1f5Tkf9JWUYQ5/xgu4TwWRHgYFJdvayZwKptyKnDkD+nUjR6UrnzY274slO69SdccHWQ8uv7v2Y7LpH/ZeJN220=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=WjnNfwFn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="WjnNfwFn"
Received: by smtp.kernel.org (Postfix)
	id 2AFB5C2BCB0; Mon, 17 Nov 2025 12:34:40 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A84DC4CEF1;
	Mon, 17 Nov 2025 12:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2A84DC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=naTwKwkQnYFzqZyCikeGygRj63Lux4gIlwTJQV8nJm0=;
	b=WjnNfwFndIKdqVehx3z8CY9GQ9ej3LwotXmcwWcZmFnt5xRMBAdlPip9AouiKI
	/y7wkJPBx0eRIvxwKIvDoP7K5AYUCe6WkHwYwBtBYw9HzV6IT9dicgrSvWmRBhut
	0dTMai0zJ4JJR8BO+Yo1nOdAaI95DE7Xj7wNtSaAm+Ijs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnXIhOFhtpoZUoAg--.8347S3;
	Mon, 17 Nov 2025 20:34:25 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] i.MX dt-bindings update for 6.19
Date: Mon, 17 Nov 2025 20:33:48 +0800
Message-ID: <20251117123358.2009662-2-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123358.2009662-1-shawnguo2@yeah.net>
References: <20251117123358.2009662-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgAnXIhOFhtpoZUoAg--.8347S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykCw43AFy5uF1DAF43KFg_yoW8KFyfpF
	sxuFn3GF1ktF17tr43Kw1kCw1rXr18Ar47Jrs3Jw18Ja98C3WqqFyYywn5Zr9xAFyIqF17
	ZF1UWr42g347Aw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j-R6rUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNxG6IGkbFlFk4wAA3O

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.19

for you to fetch changes up to 5ffac985b5f4272c8fccb0ef58369724bd10cd8d:

  dt-bindings: arm: fsl: add Toradex SMARC iMX95 (2025-11-17 16:37:55 +0800)

----------------------------------------------------------------
i.MX dt-bindings update for 6.19:

- New board support: Protonic PRT8ML, Toradex SMARC iMX95, Skov Rev.C
  HDMI, i.MX 95 Verdin Evaluation KitPHYTEC phyBOARD-Segin-i.MX91 board,
  Skov i.MX8MP variant
- One imx-iomuxc-gpr update from Fabio Estevam to document CSI mux
- A couple of fpga-qixis bindings updates from Ioana Ciornei
- One embedded-controller update from Mathew McBride to add Traverse
  Ten64 board controller

----------------------------------------------------------------
Fabio Estevam (1):
      dt-bindings: soc: imx-iomuxc-gpr: Document the CSI mux

Ioana Ciornei (2):
      dt-bindings: fsl,fpga-qixis-i2c: add support for LX2160ARDB FPGA
      dt-bindings: fsl,fpga-qixis: describe the gpio child node found on LS1046AQDS

Jonas Rebmann (1):
      dt-bindings: arm: fsl: Add Protonic PRT8ML

João Paulo Gonçalves (1):
      dt-bindings: arm: fsl: add Toradex SMARC iMX95

Marco Felsch (1):
      dt-bindings: arm: fsl: add Skov Rev.C HDMI support

Marek Vasut (1):
      dt-bindings: arm: imx: document i.MX 95 Verdin Evaluation Kit (EVK)

Mathew McBride (1):
      dt-bindings: embedded-controller: add Traverse Ten64 board controller

Primoz Fiser (1):
      dt-bindings: arm: fsl: Add PHYTEC phyBOARD-Segin-i.MX91 board

Steffen Trumtrar (1):
      dt-bindings: arm: fsl: add compatible for Skov i.MX8MP variant

 Documentation/devicetree/bindings/arm/fsl.yaml     | 17 +++++++
 .../bindings/board/fsl,fpga-qixis-i2c.yaml         | 58 ++++++++++++++++++++++
 .../devicetree/bindings/board/fsl,fpga-qixis.yaml  | 10 ++++
 .../traverse,ten64-controller.yaml                 | 40 +++++++++++++++
 .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml       | 16 ++++++
 5 files changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/traverse,ten64-controller.yaml

