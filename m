Return-Path: <SRS0=8GTC=VF=aurel32.net=aurelien@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F885C433FE
	for <soc@archiver.kernel.org>; Wed, 27 Apr 2022 23:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31F18C385A9; Wed, 27 Apr 2022 23:36:33 +0000 (UTC)
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E21AC385AE;
	Wed, 27 Apr 2022 23:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6E21AC385AE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=qCQFpGDXcWaxT67TAwZ3Urxcm7whCpD3bNnns8sGRG8=; b=vl3p3vmhUQxAFE2Gg61wE/u9GT
	UaEChsC+K5wApK03r06SNYC/ZvHMro7pGug7r9UGbQrqF47zPOUu+3YRyCNLkML9vwUzyt6Y1aERE
	Nbb6w04l4lXU6uvBM64Ku/yj3Sb1brjUuOqYZO7SY9M9cmd8HEvc3uVh1VZHv61BXpgIgd3NkqAlE
	B5LznhLOUFZ61AML4fofNfAonlAULPcRGQwmdz4B82ORxLDrF26aJdLEjFKolF8SptxKv1YLcG0h7
	1G5anBy0inAzs+HdDTZ27RFPXKs8EDC0vrrlpi0qmis5punOS8lYVwZog0ct1AnmAw1k3yKTx7udf
	oBqAyZmQ==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1njrCe-006YNS-F9; Thu, 28 Apr 2022 01:36:12 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.95)
	(envelope-from <aurelien@aurel32.net>)
	id 1njrCd-0058nC-25;
	Thu, 28 Apr 2022 01:36:11 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com
List-Id: <soc.lore.kernel.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org,
	Phil Elwell <phil@raspberrypi.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	soc@kernel.org,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH RESEND 0/2] arm/arm64: dts: Enable device-tree overlay support for RPi devices
Date: Thu, 28 Apr 2022 01:36:05 +0200
Message-Id: <20220427233607.1225419-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset changes the generation of the Raspberry Pi devices DTB
files to improve the support for out-of-tree device-tree overlays, like
it has recently been done for the Nvidia SoCs.

I personally only need that for arm64, but I have added a similar patch
to do the same on arm.

Aurelien Jarno (2):
  arm64: dts: broadcom: Enable device-tree overlay support for RPi
    devices
  arm: dts: Enable device-tree overlay support for RPi devices

 arch/arm/boot/dts/Makefile            | 18 ++++++++++++++++++
 arch/arm64/boot/dts/broadcom/Makefile | 11 +++++++++++
 2 files changed, 29 insertions(+)

-- 
2.35.1

