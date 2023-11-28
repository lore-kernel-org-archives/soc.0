Return-Path: <SRS0=Yuoh=HJ=rnplus.nl=renze@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72E4C4167B
	for <soc@archiver.kernel.org>; Tue, 28 Nov 2023 01:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 74835C433C8; Tue, 28 Nov 2023 01:32:23 +0000 (UTC)
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5811BC433C9
	for <soc@kernel.org>; Tue, 28 Nov 2023 01:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5811BC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=rnplus.nl
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=rnplus.nl
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id F0BD937943E
	for <soc@kernel.org>; Tue, 28 Nov 2023 01:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y24qi7AgyfUN for <soc@kernel.org>;
	Tue, 28 Nov 2023 02:33:47 +0100 (CET)
Received: from werkpc.lan (87-101-2-254.dsl.cambrium.nl [87.101.2.254])
	by mail.rnplus.nl (Postfix) with ESMTPSA id 16404379432;
	Tue, 28 Nov 2023 02:33:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1701135224; bh=81KwltVxZAuMaWLnYPGe+jkgwQiKXhiV7pP19DaDTdw=;
	h=From:To:Cc:Subject:Date;
	b=i3198qmdu53X0lp5Stk2jvnw9k2rIjPPev7I0lZAzFHXk9+mVKhYtr3FKe+HNRAkW
	 I/L/bghaqwsLHnpp5gMKNBEb6/jvwprHj0w4GAcb9SNQFuuH1SPCi4umFQdKDJdpGC
	 GVDOwWS1/3IrJ/ZS58HmQewCJaeu0oUNIAGjSTyY=
From: Renze Nicolai <renze@rnplus.nl>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au
Cc: Renze Nicolai <renze@rnplus.nl>
Subject: [PATCH 0/2] ARM: dts: aspeed: asrock: Add ASRock X570D4U BMC
Date: Tue, 28 Nov 2023 02:30:15 +0100
Message-ID: <20231128013136.2699317-1-renze@rnplus.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

These patches add a device-tree (and a bindings update) for the
Aspeed BMC on the ASRock X570D4U, so that it can be added as a
supported OpenBMC platform.

Greetings,
Renze Nicolai

Renze Nicolai (2):
  dt-bindings: arm: aspeed: add Asrock X570D4U board
  ARM: dts: aspeed: asrock: Add ASRock X570D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-x570d4u.dts  | 344 ++++++++++++++++++
 3 files changed, 346 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts

-- 
2.43.0

