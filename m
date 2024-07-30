Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B38C3DA70
	for <soc@archiver.kernel.org>; Tue, 30 Jul 2024 14:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF1D2C4AF11; Tue, 30 Jul 2024 14:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C35C4AF10;
	Tue, 30 Jul 2024 14:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722350970;
	bh=+FGsIkkToaGugUy415swqKr01ztdr6PyifGgJ1SpdBI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=seBRNO66oDVmcPZMkbCiz3nXwbICXmnAzwHYqVD4E95xQ6a2w+QocmMBXKqbpQORW
	 chAQO4MqzrtgDvm3UusYGTzGZUsLfHlhdf7zPg486WNEzO6sMLloDnRdicpQsid0AO
	 kn/W3YdlOdjLLh/dxs6Wk5k1JZ18LoMQrx/v/gkuhhgkoxjk48GdkrTOYlklqE0/27
	 7pfKoIKViyHhn0Mntir37bZfoo7q0ZunqDP/skfBhHHxLizvdGqoNUsgXzKp4K9psp
	 /b0Lwljx+lnRKjTyNt3C262vjv2q1WDnQstoW6c0Pp9utxahfZL20hMf3syxyaJnU5
	 bgaIzZWgsrLbw==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org
Cc: arm@kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 1/2] doc: platform: cznic: turris-omnia-mcu: Fix sphinx-build warning
Date: Tue, 30 Jul 2024 16:49:23 +0200
Message-ID: <20240730144924.25552-2-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240730144924.25552-1-kabel@kernel.org>
References: <20240730144924.25552-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix sphinx-build warnings
  ERROR: Unexpected indentation.
  WARNING: Block quote ends without a blank line; unexpected unindent
in Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Link: https://lore.kernel.org/all/20240702174938.04c12aab@canb.auug.org.au/
Fixes: dfa556e45ae9 ("platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs")
Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
index 307a55f599cb..210a39043dc1 100644
--- a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
@@ -32,9 +32,9 @@ Description:	(RW) The front button on the Turris Omnia router can be
 		interrupt.
 
 		This file switches between these two modes:
-		- "mcu" makes the button press event be handled by the MCU to
-		  change the LEDs panel intensity.
-		- "cpu" makes the button press event be handled by the CPU.
+		 - "mcu" makes the button press event be handled by the MCU to
+		   change the LEDs panel intensity.
+		 - "cpu" makes the button press event be handled by the CPU.
 
 		Format: %s.
 
-- 
2.44.2

