Return-Path: <SRS0=rV2K=SW=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C96C4332F
	for <soc@archiver.kernel.org>; Mon,  7 Feb 2022 18:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44929C340EE; Mon,  7 Feb 2022 18:47:10 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C630FC004E1
	for <soc@kernel.org>; Mon,  7 Feb 2022 18:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C630FC004E1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from apollo.. (unknown [IPv6:2a02:810b:4340:43bf:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 909EB22239;
	Mon,  7 Feb 2022 19:47:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1644259624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GSEvHFnULQv/IzdQQUd+TGASCzwSK/pi2J8B80qzsvo=;
	b=GUL29nJQXjfU40722IVcv9BU22uXsKynU+6OvtJTQlQkxIkJ5cEAq1Q1hSwMlBCza37eYX
	j2VBFc7Z9e9tz/vhRKtr7WL2hxtk9FrUy1ksrrNAxwd/3MoMOOOAFWjxfM0Z6ZwLodm16A
	uLxBGPqXFOaG0QSK0mnGkcKBf7u4TQg=
From: Michael Walle <michael@walle.cc>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH] MAINTAINERS: add myself as a maintainer for the sl28cpld
Date: Mon,  7 Feb 2022 19:46:52 +0100
Message-Id: <20220207184652.1218447-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sl28cpld is a management controller found on the Kontron SMARC-sAL28
board for now. Support for it was added by me quite a while ago, but I
didn't add a MAINTAINERS entry. Add it now.

Signed-off-by: Michael Walle <michael@walle.cc>
---
Hi,

since this affects so many subsystems, I'm not sure through which tree this
should go. I'm sending this to the arm soc maintainers because it's an
aarch64 board where this driver is used as well as Lee as the MFD
maintainer.

 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ddcee331dc09..c14209168ce6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17762,6 +17762,21 @@ S:	Maintained
 W:	http://www.winischhofer.at/linuxsisusbvga.shtml
 F:	drivers/usb/misc/sisusbvga/
 
+SL28 CPLD MFD DRIVER
+M:	Michael Walle <michael@walle.cc>
+S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml
+F:	Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
+F:	Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml
+F:	Documentation/devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml
+F:	Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
+F:	drivers/gpio/gpio-sl28cpld.c
+F:	drivers/hwmon/sl28cpld-hwmon.c
+F:	drivers/irqchip/irq-sl28cpld.c
+F:	drivers/pwm/pwm-sl28cpld.c
+F:	drivers/watchdog/sl28cpld_wdt.c
+
 SLAB ALLOCATOR
 M:	Christoph Lameter <cl@linux.com>
 M:	Pekka Enberg <penberg@kernel.org>
-- 
2.30.2

