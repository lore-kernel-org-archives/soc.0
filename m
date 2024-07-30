Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFBDC3DA49
	for <soc@archiver.kernel.org>; Tue, 30 Jul 2024 14:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97E3DC4AF0E; Tue, 30 Jul 2024 14:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4477EC4AF0A;
	Tue, 30 Jul 2024 14:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722350972;
	bh=3d8j4dhdq9fPcHi3miO1nqzDG+1nOqdZLHAFzQJKU9w=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=or0Xeo7ncIiuM3+UihqW7OHVnpJdjXyNa3kXZOusnrS4dnIFTW59aMJjoGvO7i/v3
	 nP28yMM1/r+QO5SzxeksrnLbgft3c/GSVoOtOLZerv4IwmHs18MxoZCO7p+j/J2kVI
	 M9H5VwoE8rQYlbKQxXSqXlaM8uYupZgMSxopR+7DtBoqtD3gChzyifqVoC6vs6bUvN
	 yyyiY3DC0KOifHBhaiGp8d78lkbzHVpfwxfwkjrFNmmODJrIKPF0bR3SoiMmJP2RQi
	 SGMZQbKKkfHOJUcM8Mntb7MUAJjYgbmdW9NHzbYOPzrX6UPnyxBWI27XfCVLgapfeA
	 z3O7CaSTdgPog==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org
Cc: arm@kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 2/2] doc: platform: cznic: turris-omnia-mcu: Use double backticks for attribute value
Date: Tue, 30 Jul 2024 16:49:24 +0200
Message-ID: <20240730144924.25552-3-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240730144924.25552-1-kabel@kernel.org>
References: <20240730144924.25552-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use double backticks instead of quotes for sysfs attribute value.
This makes sphinx generate the "mcu" and "cpu" values in monospace when
rendering to HTML.

Fixes: dfa556e45ae9 ("platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs")
Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
index 210a39043dc1..35a8f6dae5bf 100644
--- a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
@@ -32,9 +32,9 @@ Description:	(RW) The front button on the Turris Omnia router can be
 		interrupt.
 
 		This file switches between these two modes:
-		 - "mcu" makes the button press event be handled by the MCU to
+		 - ``mcu`` makes the button press event be handled by the MCU to
 		   change the LEDs panel intensity.
-		 - "cpu" makes the button press event be handled by the CPU.
+		 - ``cpu`` makes the button press event be handled by the CPU.
 
 		Format: %s.
 
-- 
2.44.2

