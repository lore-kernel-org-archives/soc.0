Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DA2C46467
	for <soc@archiver.kernel.org>; Mon, 26 Dec 2022 12:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B06B1C433F0; Mon, 26 Dec 2022 12:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745BEC433F2;
	Mon, 26 Dec 2022 12:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672059007;
	bh=7/N4YIZhZubazKHjeckRsmjdQbBIBlpeTV0c+tJDTcE=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=IWX724E1qoYmsHLVBCgPIYH2WzbmTaT+71Pph/cuLGnh+tK72EHD1uz03zR8q8Sup
	 v5SyNfNWVUrTqbq+KfWoWsXDJxCs0eKuLe5dTgBVghHToes6rcmU4xSIyRrpIaBJSZ
	 3FXEf7iLNh2YNY+r3NV/rxl2ZRswvyqkYzHjGPNs67ncYCUZmRZEGpdW55zL3EVu70
	 iaq+FVJhTCzU54I58o6Vtq+ucmaU6YasORwEBnAz3Rnyh7lkzSdRmVq2Yj3MA+CO/M
	 I+Gz4Qv7vQL/kGz6Xog7w87Q4RpMCHFhat6NB8xnxImZtcp8Z6eoi2PUe36zOzGkl7
	 VOf8b6xDybHFQ==
Received: by pali.im (Postfix)
	id 09B959E4; Mon, 26 Dec 2022 13:50:05 +0100 (CET)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/8] dt-bindings: leds: register-bit-led: Add active-low property
Date: Mon, 26 Dec 2022 13:36:23 +0100
Message-Id: <20221226123630.6515-2-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221226123630.6515-1-pali@kernel.org>
References: <20221226123630.6515-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow to define inverted logic (0 - enable LED, 1 - disable LED) via
active-low property.

Signed-off-by: Pali Rohár <pali@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/leds/register-bit-led.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/register-bit-led.yaml b/Documentation/devicetree/bindings/leds/register-bit-led.yaml
index ed26ec19ecbd..418130b29caa 100644
--- a/Documentation/devicetree/bindings/leds/register-bit-led.yaml
+++ b/Documentation/devicetree/bindings/leds/register-bit-led.yaml
@@ -43,6 +43,11 @@ properties:
         0x100000, 0x200000, 0x400000, 0x800000, 0x1000000, 0x2000000, 0x4000000,
         0x8000000, 0x10000000, 0x20000000, 0x40000000, 0x80000000 ]
 
+  active-low:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      LED is ON when bit in register is not set
+
   offset:
     description:
       register offset to the register controlling this LED
-- 
2.20.1

