Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374D6FA374A
	for <soc@archiver.kernel.org>; Fri, 13 Sep 2024 12:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D8C2C4AF0C; Fri, 13 Sep 2024 12:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0EFAC4CEC0;
	Fri, 13 Sep 2024 12:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726230689;
	bh=Rc6RMX/Ou5vQp7oqz2smW7DcckK88yQnbulZKZl+wtY=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZUj6nRavIucWq7wl1EtyAWlxCabHbK6J6fEUdY4+e2VFF3uTgpOLRVgmDoXJcZtKD
	 jJLPOsK/iwWu5vtLasnjsA54kCGCHYPJz+t1T2MvYG0pNE1la8yE1z12HDfF9Qt8/r
	 9RCKSOGTjxzHZ561i0+Ref+Kktah22n8ne8mYB1ZgefXKv39uroDbkurEvSrxvnQJl
	 s8krhb0ibLmo1jvdK87Vx1VItqmfeP3C2RJmGy7EANVh34d6Da/heRj2Vsac+LOyfB
	 kykHQX2kntIgOeJHG3boLZIiLUZJxtFr8bzcAMwt8j9Cu4KyDNlamds20PJ43KKBQd
	 lhF1p1HmjoYlQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v3 05/11] dt-bindings: leds: cznic,turris-omnia-leds: Allow interrupts property
Date: Fri, 13 Sep 2024 14:30:57 +0200
Message-ID: <20240913123103.21226-6-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240913123103.21226-1-kabel@kernel.org>
References: <20240913123103.21226-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the cznic,turris-omnia-leds binding with interrupts property,
specifying the global LED brightness changed by button press interrupt.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../devicetree/bindings/leds/cznic,turris-omnia-leds.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
index 34ef5215c150..f52f6304c79e 100644
--- a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
+++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
@@ -23,6 +23,12 @@ properties:
     description: I2C slave address of the microcontroller.
     maxItems: 1
 
+  interrupts:
+    description:
+      Specifier for the global LED brightness changed by front button press
+      interrupt.
+    maxItems: 1
+
   "#address-cells":
     const: 1
 
@@ -56,6 +62,7 @@ additionalProperties: false
 examples:
   - |
 
+    #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/leds/common.h>
 
     i2c {
@@ -65,6 +72,7 @@ examples:
         led-controller@2b {
             compatible = "cznic,turris-omnia-leds";
             reg = <0x2b>;
+            interrupts-extended = <&mcu 11 IRQ_TYPE_NONE>;
             #address-cells = <1>;
             #size-cells = <0>;
 
-- 
2.44.2

