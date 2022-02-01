Return-Path: <SRS0=mQ6W=SQ=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E520C433EF
	for <soc@archiver.kernel.org>; Tue,  1 Feb 2022 17:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C97E3C340EE; Tue,  1 Feb 2022 17:28:24 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3258AC340ED;
	Tue,  1 Feb 2022 17:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3258AC340ED
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=i2se.com
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MowbA-1mS6zq0FAM-00qPtn; Tue, 01 Feb 2022 18:28:12 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
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
	linux-rpi-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 1/3] dt-bindings: arm: bcm2835: Add Raspberry Pi Zero 2 W
Date: Tue,  1 Feb 2022 18:27:45 +0100
Message-Id: <1643736467-17764-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643736467-17764-1-git-send-email-stefan.wahren@i2se.com>
References: <1643736467-17764-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:qr6V6I+2EcTePhk4gEKDRcYEC4ApGXxDQy+o63pmeAZeoLnxISW
 BpAhXfpNW5BB95xLHD/BUYh/OoQdGARATNCjw6XOHXKQs+DuyejUTwcjc7sIDeWU7jH7cQl
 laGMXXOGBD5zUriyJ2wNwh2xKy6xlQcShRi6FaZDNvDvw0OKmohot/fYomO6DqRML+KixUB
 3Jx0bsaGlDrpQuTfbj1Ow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jdKjzavzWBI=:kcGe48fEQ+Q5DhWuFggG19
 Mln3O/VIiQ9YUJx+wcvIGmQVHRfqWWle9WndSSXvBfo8K8FeV6ng9iH5E9BZP+tsg6/vhLwVn
 c/QBT7FrMaff8buvwMdAC1RTe6URmJGhTmw2SS5h1edfLCv5XyJ9zF5bQlg+cQm2RgYNLx84K
 e7xWNDzKpnWVUeUhQzO9x7vOry1Fs3guN5rPtxLHD96ahw5h1zrai5RBkFKoKB927XVJkXYd9
 96VxTmOETnqGEqWKTt5VuUoPMy//wcLNOFJLBXP9PxHnEjBZs5Tr9fUC1VmqWx2YqZNJZLEux
 mh7AvgQOBe9c2ELvHgkO2/f4skYwtjfwrL6bRr7uJ+PGJqgKrIDlkHXxlaYdhlTfaTHTEYVTr
 XtNbB9YhMLrKCgzu96EgijhTIb/146MxXjj+QyaDjT5tPeCzfFs0PtkVYWzgnKc7YXrbBMm9+
 HGcvdNhvWRpPK3+Wsxl6EjEZ9U9o/0AcA5wI3HX2IlvAZCAsWBC4AQJ4OhxBWAaXLCtabo7Br
 2/LuhWov9NYoU+81vmbdrEHD8XKnvvpx3j7lRBbme0uLZd8BkECkMqUfft7szhAmWsmxEa4Il
 LNzpTvfxd1Ikh+NY0AFLBYD0uWVpkXLy5xyzpO4NGq+ol0kiqz9qUcBbglhuKgheYdJL6RiLZ
 lUA1/uUAj9zyzVZ4ihB3zi97u268HqxbxHo6nKpEvbMpLXiQRfbwLhHR1rq/b4HcOd5CJe7z0
 T6YQ6yv4uzUhMCip

Add the Raspberry Pi Zero 2 W to DT schema.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Acked-by: Rob Herring <robh@kernel.org>
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

