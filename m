Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9E1C2BD09
	for <soc@archiver.kernel.org>; Mon, 24 Jun 2024 14:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59800C32786; Mon, 24 Jun 2024 14:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF17C2BBFC;
	Mon, 24 Jun 2024 14:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719240857;
	bh=BC9yarDnJyUOHbaY84weYpK/EoEfY2Ipnz1RqePlCGI=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=DVtos7LJBETNThO8XJAg/pAKk5j5ZIVhTDud+EVzKBNYVFSPPZFq5VnNu1/NGmaEC
	 wOcvKd4XTN+ZJnM6O30DABxpWVU1SpJvpht+Dvd+h3uD+2IJUFpsd6U6xsQzS9n6gd
	 SGk/TeObk8uu2fnG88SRX52qxV1zVzxNmdIO0uNGx9vDJrnraHxKAED0bXbq5bQGWZ
	 7DOGqe7vCDLjg7PmW5bKN43gOqj3V9pFStXoddTKU58bnANb50AEVhUfyix+8t4LpR
	 AJwvQ43uo/UYhxGLhyRkmuBdL2y7RMysev9eIN51YWo6tzHugl93g9txstC9yB5LxU
	 dJJwUglSpuWQQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	soc@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v2 0/2] armada-370 irqchip DT changes
Date: Mon, 24 Jun 2024 16:53:53 +0200
Message-ID: <20240624145355.8034-1-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Gregory, Thomas et al.

this small series coverts the marvell,mpic irqchip binding to YAML.
The conversion patch is preceded by a fix of 4 device-trees, removing
the #size-cells property from the marvell,mpic node.

v1 at:
  https://patchwork.kernel.org/project/linux-soc/list/?seriestreba%20za=864184

Changes since v1:
- #interrupt-cells property is also required

Marek Behún (2):
  ARM: dts: armada-{370-xp,375,38x,39x}: Drop #size-cells from mpic node
  dt-bindings: interrupt-controller: convert marvell,mpic binding to
    YAML

 .../marvell,armada-370-xp-mpic.txt            | 38 -----------
 .../interrupt-controller/marvell,mpic.yaml    | 63 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 arch/arm/boot/dts/marvell/armada-370-xp.dtsi  |  1 -
 arch/arm/boot/dts/marvell/armada-375.dtsi     |  1 -
 arch/arm/boot/dts/marvell/armada-38x.dtsi     |  1 -
 arch/arm/boot/dts/marvell/armada-39x.dtsi     |  1 -
 7 files changed, 64 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,armada-370-xp-mpic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,mpic.yaml

-- 
2.44.2

