Return-Path: <SRS0=xhsa=SW=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AB3C433F5
	for <soc@archiver.kernel.org>; Mon,  7 Feb 2022 17:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A8B3C004E1; Mon,  7 Feb 2022 17:56:05 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4474C340F1
	for <soc@kernel.org>; Mon,  7 Feb 2022 17:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C4474C340F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 41125402DD
	for <soc@kernel.org>; Mon,  7 Feb 2022 17:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644256555;
	bh=iL0LIepeQaRgfvOw682KQCC7APivisHIQkh+XV3XvQY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=s/R8Sngq+OaS6sh6NHe8zsUyuOQ8FKnmvari+FhDNC0VQPZW964d4ry4OYmgGkkLu
	 iMC8xa/lNA6eQE3RpmXyM1zYCqYrZs0SsWn9htTqTUfoSU8mCInW+QWi4IJ9lH3QzJ
	 t7Vgrb7RqrVJOB44MZkPyRs9AJ4K9/UWvLJfJylZMUFDg0wY8hHHZiKPdLEJl7Ouhf
	 wsHygPEH2h9DhpFaTV6tsivCfKCXmOX8airBhPCed/+jI8mKjMMZ1rT6FLJq8Kgg6/
	 qki9u2q+Z/O3IOmSZfRj/cxqMagUasOO7J3uiasVCaZmrgeRBxABjIir39+ps9tDrX
	 wf/pEMdgeVnbw==
Received: by mail-ed1-f71.google.com with SMTP id n8-20020a50cc48000000b0040f345d624aso4089705edi.6
        for <soc@kernel.org>; Mon, 07 Feb 2022 09:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iL0LIepeQaRgfvOw682KQCC7APivisHIQkh+XV3XvQY=;
        b=DZF4TaR1NB99w4ziLgvtZ0NSi+MIuJfUEIw5G1IjGT1IQpIFa7KwtUJdEvr4+SC6U5
         yjpPMvRLHlm/JkjlrHmwNS3KSzl0L3Zi4RTwZyyBsnCC/a+CULk2TT9WoH9zBDMZWvkO
         Kap8DUbbOJ8RhFidPCDplue5P3SoghYE6fYzVmqde/cDuzpiaLFFbrq25LOCBJKW/pn+
         TszCVmvdMQmIw/ewO+egp+SN3twM6DtZsFJj4cZMSCGD7XUUSbbKmgEzKp+oBgrLIIRg
         wFFgHzG8mmBiVpkTORK9NXZk+6NKjXduZenVtqVhA84lFklNxJx/+yKPiPvc8SGVKAsH
         O96Q==
X-Gm-Message-State: AOAM531V/bfg7bjp5o1sgLtjaYQZC5KAKIVXVRt8+Iq4Pg+HCPZEanjJ
	gAIfz1gSW/GNFrBEOPTmXlNRveWLVvIhV8p/0JZjnBcRJ229EDkv+IqyLP/1bke1aIR3wVGwIv2
	U+HdE4liCVYslVlBwT3FsB0E=
X-Received: by 2002:aa7:db01:: with SMTP id t1mr637167eds.394.1644256554746;
        Mon, 07 Feb 2022 09:55:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1G4vKpj2os6F6Z7fqUqCrdFZ65ttguW/jqIW3WbwlVZjZTC1cTnFdJkB82oG6+PYM+9UXHw==
X-Received: by 2002:aa7:db01:: with SMTP id t1mr637145eds.394.1644256554541;
        Mon, 07 Feb 2022 09:55:54 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id c20sm3765210edy.41.2022.02.07.09.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 09:55:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 2/2] MAINTAINERS: add IRC to ARM sub-architectures and Devicetree
Date: Mon,  7 Feb 2022 18:55:03 +0100
Message-Id: <20220207175503.425200-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220207175503.425200-1-krzysztof.kozlowski@canonical.com>
References: <20220207175503.425200-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mention the IRC channels used for discussions about ARM/ARM64
sub-architectures and Devicetree.  This documents purely existing state.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e219ba2c5ac9..95ecf8ac709b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1623,6 +1623,7 @@ M:	Olof Johansson <olof@lixom.net>
 M:	soc@kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+C:	irc://irc.libera.chat/armlinux
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 F:	arch/arm/boot/dts/Makefile
 F:	arch/arm64/boot/dts/Makefile
@@ -1630,6 +1631,7 @@ F:	arch/arm64/boot/dts/Makefile
 ARM SUB-ARCHITECTURES
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+C:	irc://irc.libera.chat/armlinux
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 F:	arch/arm/mach-*/
 F:	arch/arm/plat-*/
@@ -14443,6 +14445,7 @@ M:	Rob Herring <robh+dt@kernel.org>
 M:	Frank Rowand <frowand.list@gmail.com>
 L:	devicetree@vger.kernel.org
 S:	Maintained
+C:	irc://irc.libera.chat/devicetree
 W:	http://www.devicetree.org/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 F:	Documentation/ABI/testing/sysfs-firmware-ofw
@@ -14454,6 +14457,7 @@ OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 M:	Rob Herring <robh+dt@kernel.org>
 L:	devicetree@vger.kernel.org
 S:	Maintained
+C:	irc://irc.libera.chat/devicetree
 Q:	http://patchwork.ozlabs.org/project/devicetree-bindings/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 F:	Documentation/devicetree/
-- 
2.32.0

