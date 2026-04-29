Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD5D42316F
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 19:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777490051; cv=none; b=c2diJNNxlIuJxzsmuCb+ovFiX2yZlbsRzeB4ntSP6WozlEvUirphwnYFu4e88ICnms/NfYs5FcwkLziZ8GKnuAueCAbbh4oIQaE81PXUlHdDQ96vC3kuigEN0uruaWqh+ndjKCaDfbSVZ2dB/0ZLbKG+Swb6283yi0sW8jTtCGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777490051; c=relaxed/simple;
	bh=+GtKlk1K7hr83CoqJ8aTYEzO+TXa3ITFJyZ/GejNafo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p6nTAKocZhcUxwXxHBBGMn6NFTYFAsc2PpSaCJgoKAuSayuJNb7UPZOUVLIh6LIEwiFKBPtg12Y4AZf1e6JvxNevzlHrDcunYu5vZUbC8osBg/RICPsN7Rv/Kj/BM1BMjDyyBuRkCOfu34UlcgFg3B5lVYNgMenBfa4SCXj6dog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9svNFHR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9svNFHR"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso515635e9.1
        for <soc@lists.linux.dev>; Wed, 29 Apr 2026 12:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777490048; x=1778094848; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lu2q2P2n5BrSSlxeogaqEBxGB98cpNlogETzW0AQwM=;
        b=Z9svNFHRQxqmYB9OHBvjR4UTC0Ds5bLtjaqwFC1O1Z5o5JNBfGpwisqnfaHHKY/m6C
         FWsSRmUgLmomkByDg3ntw5Xehg2Gn1c8w0jPrsJsbBRTBC8yZCFYNgcU4qFPAVGtSfrV
         76y1UXBlT1tYzzAFTiw5f9kzpWMv61ijip696nkEKBrEVZpjxXUzSITDuX3ADWQM2XKR
         7yGGAWqQaPs2Ra1J26BJA8I1aIDHWHgNABzZqzZT5ohYPlkUel3tyopniktGLn9+uWyj
         iVZqgiPwGxm1uRu2pIT1BPTUxLY05QS3LMvhECbVazhLGTwtkTdNtxXzuE3oZTY0NaXC
         m7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490048; x=1778094848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9lu2q2P2n5BrSSlxeogaqEBxGB98cpNlogETzW0AQwM=;
        b=XHuNZgHHlF2dr94lpOCrNCETgsXY16p8ovknQVNAcUTZ5SvJWsx7ueODJCVWQSWhKP
         V1fvhJW4C0SFwKjVMl8kP0R+QtOVAEF0zFxaCS97ps7+F3jAq+Dhhnw/UeTF/84ncnlH
         yRgQZdIaiCDp0lvNTYpkQ9fxkKv7C40lJ1xUHPLKS/Io4fH6zk+UZtbdqItxWBIHYOhj
         /xvyr1KDfX+7EaaREQoj1UtwSXfdvSe62gdTJMJkfLbHqG+QMwI50WTMxEJzk2HNSg6Q
         fDSjJAp4w6XEYoYEIJyT5eNLjQXFECklt4fCtoyyyC5sUZM0ZINM9M/MgUJ51vXW9Q7p
         GcbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9fTcYGFGdSr353uU8sSXTqBYQB3DxT/xc1B3rB5pT4X/yWLECO1B5f07XE363vttYH1M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQuD2qPIQl/iEjN38dzBOSKqQvlSd+6tKdzku5EfS+ZVicXWSF
	kO9sfmI2J5WBHvBSr7mpJtMBxBWJhNtkDCd50qBgqvssSU9Sul8JXH99
X-Gm-Gg: AeBDievGDJA7cDzzKzoYLhetk4ae/aLnaaiH/d1sGXpXSipPzcqRGd1HhIY181gaMRs
	8FxxWKi2/gHP64dfF/8xccNeWeWgPMn5Totu6gQfa7sTQnIWX0O6my3MZpqFJK16PDBxBuALEuO
	TaQ+rASZ0xB6IDeuKz72uQaJlMvwj/dA53hiqi7exkqV6jQflphKsHBq/D7rn6muBLzMG5o0qep
	/LY3fHVgl/093lRmzgfx7OAL1ZghaWPulGjykTgO5Dq+dR0wYCvBMnEHlEw4pDy4B43eCZpJ1+v
	hn4wAb2abn9gNTy+N4a5qVbNIHk12zTJ3XKIh+FpPZ4Q7RXty9/92S1U6iEp94FalBW2I8S7Kse
	d5/B6QOb67j7eGnj2XqkUPml3Lq+ih7QxApuny3Fqh6MK/BZm4J4tT02BKzPO9TZ+CnHksIVSxb
	YNYinhhilZjHQK0IMIh1Z0zFlOW/rIAVFLqaRiS97MmeQ=
X-Received: by 2002:a05:600c:1f0f:b0:48a:563c:c8d6 with SMTP id 5b1f17b1804b1-48a77ae9a99mr137026655e9.7.1777490048153;
        Wed, 29 Apr 2026 12:14:08 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c316d7esm23315005e9.24.2026.04.29.12.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:14:07 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 29 Apr 2026 22:13:12 +0300
Subject: [PATCH v7 1/6] dt-bindings: arm: zte: Add D-Link DWR932M board
 based on zx297520v3 SoC
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-send-v7-1-b432e00d2db8@gmail.com>
References: <20260429-send-v7-0-b432e00d2db8@gmail.com>
In-Reply-To: <20260429-send-v7-0-b432e00d2db8@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2213;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=+GtKlk1K7hr83CoqJ8aTYEzO+TXa3ITFJyZ/GejNafo=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp8lh1ccK4jzlaeTCnzQ+mj6nz3CojfOm46bCo2
 SlLMeZ1902JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafJYdRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKr4xAAr6MvXLGyj+fH1KeLch7jR81J65FCi6C
 l0TmjwzEsMksZfwqtNijUjfJWJdg1Kry38lnOM29zkWAZjojfpLli9SCljOJw0H1V+Ph24fr5XL
 SDbh/ODZ19cxLCbkZ5k2MUeLQXbh6z/X7ZTULTAp4GOhKS+YNWmBUjJAM+griHEM81EK3D/KL7D
 +tRUF0fZeZMeZthhFRJHA5ZLUA5TCp+QIlkf9rAWyBjb+8vu4s4fQWD4Hb97MDgdcE0q1IPA369
 058ElZn/gYW6rsHUfTSJAxg5IuVQEV+qkKMSrJe3WaqEnovqsNOGWnKarDfmwgupTVpC2QYOhJC
 m3GYVfj6YklJYH1cCQqaOgsOHHTxWRk84Moi+3+5z29CXdut8UkKVHcGBUAL8qibx/LCz9YDhzQ
 mLxHuD050T1+0k3FOsDJ4lTmXPs1STuwpqS7exviIjsAG/U/wC2Jyi8YImbQPlraF4hUzL7Pcwu
 Pu5lkMEyUo8ZHrtBff8Dh4z0p4ihnigz4bCkK+ZCTNyi5Am5dcvfG2lCY+jRDeWcLNTnM67dvUB
 5tMErwPDEdKFUF+JGNmEPMmL/lT6jcNfJ5qxnZRTT+0eFpzq2ZcNKy5sGGtQtyxYV7RBIgERW6t
 J2p6MB2yb8w/q4x9Y8aE05PvDdYzm2keQdwVFd9zwzvUss5r8dL4=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This adds a new binding file for ZTE, containing their zx297520v3 SoC
and one board (D-Link DWR-932M) based on it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Changelog:

v6:
Removed extra boards, I'll add them when submitting their individual
DTS files. Rephrase the subject to add "zte" and remove the redundant
use of "binding".

Moved the devicetree bindings patch ahead of the implementation patches.

Moved the MAINTAINERS section from "ZX29" to "ARM/ZTE".
---
 Documentation/devicetree/bindings/arm/zte.yaml | 26 ++++++++++++++++++++++++++
 MAINTAINERS                                    |  4 ++++
 2 files changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/zte.yaml b/Documentation/devicetree/bindings/arm/zte.yaml
new file mode 100644
index 000000000000..f028d2cec7ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/zte.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/zte.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx platforms
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  ARM platforms using SoCs designed by ZTE. Currently this supports devices
+  based on the zx297520v3 SoC which is found in LTE routers.
+
+properties:
+  $nodename:
+    const: "/"
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - dlink,dwr932m
+          - const: zte,zx297520v3
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index d1cc0e12fe1f..b768b9da37a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3772,6 +3772,10 @@ F:	drivers/video/fbdev/vt8500lcdfb.*
 F:	drivers/video/fbdev/wm8505fb*
 F:	drivers/video/fbdev/wmt_ge_rops.*
 
+ARM/ZTE ZX29 SOC SUPPORT
+M:	Stefan Dösinger <stefandoesinger@gmail.com>
+F:	Documentation/devicetree/bindings/arm/zte.yaml
+
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.53.0

