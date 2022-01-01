Return-Path: <SRS0=LxC5=RR=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93296C4332F
	for <soc@archiver.kernel.org>; Sat,  1 Jan 2022 20:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56CB7C36AED; Sat,  1 Jan 2022 20:27:31 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EEC9BC36AE9;
	Sat,  1 Jan 2022 20:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EEC9BC36AE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=i2se.com
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MfZDK-1mSCEf2Wfw-00g13p; Sat, 01 Jan 2022 21:27:17 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Arend van Spriel <aspriel@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Chi-hsien Lin <chi-hsien.lin@infineon.com>,
	Wright Feng <wright.feng@infineon.com>,
	Chung-hsien Hsu <chung-hsien.hsu@infineon.com>,
	Kalle Valo <kvalo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 2/4] dt-bindings: arm: bcm2835: Add Raspberry Pi Zero 2 W
Date: Sat,  1 Jan 2022 21:26:50 +0100
Message-Id: <1641068812-5851-3-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1641068812-5851-1-git-send-email-stefan.wahren@i2se.com>
References: <1641068812-5851-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:/F4aUJqeYItmMr5Xkbt5w/NV6TF/mg6jj6khyL26kHagOjvPDzP
 67MAt3RXnAhWGKDz2F5r+Mumr6w6YWmsjPENlkHL0oZeaJ4/vLM46hrTuhGs/FlkavSH9RS
 VypmT7/GMis7HiXHC8JpNcpevy0NY+Sc2460HfzvH7axSkTfQIBI6PzDEubck6CQMBFlFWr
 YNrM7uqzvnfIUTyiJ1U7w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sENR6rDv6vs=:KM0QArLvRm8xCG/YV5DJ+j
 WKvsTzR1GhriCC9RkdoecD9EiPduo/yLxOuQ6WxZhBWiybf5QJmrsIKzJ4RIRq47lWHKJ6q9p
 24sblnP9bAnruQHYhx+QzBw9e7MEZ7VbCR6gG0DH5rAXU6OXoQOjqlxjptk68KS0eDPjlkV4w
 /XsHd6anhRI5q17homEATDxgAwMgoY2Xmav5l7c62/Tn16TVrtzEM9Aiavp1zw62OLQCvcR5q
 dfKrGQcYF6rBMzPU2glQPuhyCN0ZK2cZih4pD1Tnsoq63CfVwAHTyIDO8/bsJYGtE+sqdxDG+
 6zLS1fvqb5q/Xs1Trqt9mdc1T0xMh425g2CaRQR3AhHioVhXc2fhaEeQVqq0iNMjUs1m2PMmZ
 rnkW42j8nGjgXVJAU2hGI9LU32Ifnxzh1W2CrGDTKow+4VZ2kiHZ1xQIEgfiTS7r1oK99FakH
 zDoCu1R4hctbpmNstz8sCmUvOMmgjoTZIqoFv9Nj7jGuNIf2nY1c9HCrVEHcYsEXJQEb5dNQG
 /Gq3vav6vapnii76U83wr5cfJf/teStStkLN69dgzyu5REL1BqiREIQX8+56gPcPKcUM9gj3w
 9Lix466O+nOLnCIkMvuP7O82LL+oR05Z7e5+loJcBveMRbqyKh1c7FBFGI7HWjeW7yg0AqbrJ
 AdtamXem5DsSButYJs8zksLnqfysPgkzfCp8z2/qHnaIm8SMZaJGMLu2a672hGax11UeWcNcl
 6TaFHZQgiVnLg47d

Add the Raspberry Pi Zero 2 W to DT schema.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
index 5dc4824..8051a75 100644
--- a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
@@ -51,6 +51,7 @@ properties:
               - raspberrypi,3-model-b-plus
               - raspberrypi,3-compute-module
               - raspberrypi,3-compute-module-lite
+              - raspberrypi,model-zero-2-w
           - const: brcm,bcm2837
 
 additionalProperties: true
-- 
2.7.4

