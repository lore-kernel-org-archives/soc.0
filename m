Return-Path: <SRS0=HjUL=GX=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93C3C433DB
	for <soc@archiver.kernel.org>; Wed, 20 Jan 2021 19:40:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 77F5823433; Wed, 20 Jan 2021 19:40:47 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20A24233FC;
	Wed, 20 Jan 2021 19:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20A24233FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=michael@walle.cc
Received: from mwalle01.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 68A3822727;
	Wed, 20 Jan 2021 20:40:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1611171644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tlKQp8qtg7ZoARKjR0krCyCtHtuqS8eLJSkS8h5Iy+Q=;
	b=Hkmt4GpEE9/lMp95snLoV+wwqAyxIEbTWRW0zi6nwA+ZcjVqGKufBoel3qAQJd/qWrNZRQ
	csZv1jkZB1/uttJKjXEPLGk6VJK8Yf6AYMNl6TJ+OnTZqpysmQ/imYQdfjWwjtxbzzKjVX
	H223mRARsbIL8lqGNkZeAvN9nc0yCJ8=
From: Michael Walle <michael@walle.cc>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Michael Walle <michael@walle.cc>
Subject: [PATCH 0/3] add Ebang EBAZ4205 support
Date: Wed, 20 Jan 2021 20:40:30 +0100
Message-Id: <20210120194033.26970-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

Add support for the Ebang EBAZ4205 board. This board was once used as a
control board for a bitcoin mining device. Nowawdays it is sold as a cheap
Zynq-7000 eval board.

Michael Walle (3):
  dt-bindings: add ebang vendor prefix
  dt-bindings: arm: add Ebang EBAZ4205 board
  ARM: dts: add Ebang EBAZ4205 device tree

 .../devicetree/bindings/arm/xilinx.yaml       |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/zynq-ebaz4205.dts           | 109 ++++++++++++++++++
 4 files changed, 113 insertions(+)
 create mode 100644 arch/arm/boot/dts/zynq-ebaz4205.dts

-- 
2.20.1

