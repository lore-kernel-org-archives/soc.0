Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD424189BBB
	for <soc@lists.linux.dev>; Mon, 11 Nov 2024 10:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731321602; cv=none; b=ZVe3I3Phb6REEGAmCpKmy5A758YqBWo4aLWl3nbxN+h/wHi3mIAXKuYMWx3OLjR9eY8WHb76cKmD4ByNWMx9u9k5XA5SW8/yOB2MmB5PDGCXvbLhwxT5QVo3LXYj1UZWlOW0xODa0YKg4PUDE/NYEJFzz1k36/KpBqc56RAVHNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731321602; c=relaxed/simple;
	bh=fgV3wHpPsnG3Iw9H67A7L4x4LKjKfqlLhARNaYwt+AM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U0YqgzZqUAuSW9kWkOTM1sCxykHtBMRaCRPHpyDtllcODB/TJz929YToGTyW0f4uJeEdMkjmV6FGQ5vh6KLN+DC6+sQDSBt2Fx4EnOD4EYmpgdUIUZ4h98vZ6vlr5Yt172rJ8HqBntxDL3PxVHEzaS/LpR51a8t/ty8pRv8UjG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vs5sTlUQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vs5sTlUQ"
Received: by smtp.kernel.org (Postfix)
	id 58AFCC4AF0B; Mon, 11 Nov 2024 10:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7291EC4CED5;
	Mon, 11 Nov 2024 10:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731321602;
	bh=fgV3wHpPsnG3Iw9H67A7L4x4LKjKfqlLhARNaYwt+AM=;
	h=From:To:Cc:Subject:Date:From;
	b=Vs5sTlUQATYoikvRct6SEYjHABT4tk5vMqlKJHZlzh18sOd2kKrJlimSPnznpoIS4
	 JY9tD2+P1+mXZx0mMBREjrtV8H29DW0p/D52QV0cEMPcCsvyJ1rb1ngCLILaWdfJH1
	 wPIAviorAtHlaJw0dqqlyUwS0ecnIMc3QqFj8BkZT93ZYBQ7wLlGFO6NMT9X3aUlcn
	 2CP4niEZwCify1kwk/fh6xRgjQKFcs4anw9hAPrcbX5T0co7TEYzEcHheZFBZeKY0e
	 n8Jn6Ki9TTIxt4CoDCWihbwuNrJBr4mFDZmVnpvPfKlFYyuLe6w2sWpVUyy59/fDdP
	 RC6iggWqZJchQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH] platform: cznic: turris-omnia-mcu: Document the driver private data structure
Date: Mon, 11 Nov 2024 11:39:57 +0100
Message-ID: <20241111103957.15899-1-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add more comprehensive documentation for the driver private data
structure, `struct omnia_mcu`.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/platform/cznic/turris-omnia-mcu.h | 42 +++++++++++++++++++----
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform/cznic/turris-omnia-mcu.h
index b36f9626e660..088541be3f4c 100644
--- a/drivers/platform/cznic/turris-omnia-mcu.h
+++ b/drivers/platform/cznic/turris-omnia-mcu.h
@@ -20,41 +20,71 @@
 struct i2c_client;
 struct rtc_device;
 
+/**
+ * struct omnia_mcu - driver private data structure
+ * @client:			I2C client
+ * @type:			MCU type (STM32, GD32, MKL, or unknown)
+ * @features:			bitmap of features supported by the MCU firmware
+ * @board_serial_number:	board serial number, if stored in MCU
+ * @board_first_mac:		board first MAC address, if stored in MCU
+ * @board_revision:		board revision, if stored in MCU
+ * @gc:				GPIO chip
+ * @lock:			mutex to protect internal GPIO chip state
+ * @mask:			bitmap of masked IRQs
+ * @rising:			bitmap of rising edge IRQs
+ * @falling:			bitmap of falling edge IRQs
+ * @both:			bitmap of both edges IRQs
+ * @cached:			bitmap of cached IRQ line values (when an IRQ line is configured for
+ *				both edges, we cache the corresponding GPIO values in the IRQ
+ *				handler)
+ * @is_cached:			bitmap of which IRQ line values are cached
+ * @button_release_emul_work:	front button release emulation work, used with old MCU firmware
+ *				versions which did not send button release events, only button press
+ *				events
+ * @last_status:		cached value of the status word, to be compared with new value to
+ *				determine which interrupt events occurred, used with old MCU
+ *				firmware versions which only informed that the status word changed,
+ *				but not which bits of the status word changed
+ * @button_pressed_emul:	the front button is still emulated to be pressed
+ * @rtcdev:			RTC device, does not actually count real-time, the device is only
+ *				used for the RTC alarm mechanism, so that the board can be
+ *				configured to wake up from poweroff state at a specific time
+ * @rtc_alarm:			RTC alarm that was set for the board to wake up on, in MCU time
+ *				(seconds since last MCU reset)
+ * @front_button_poweron:	the front button should power on the device after it is powered off
+ * @wdt:			watchdog driver structure
+ * @trng:			RNG driver structure
+ * @trng_entropy_ready:		RNG entropy ready completion
+ */
 struct omnia_mcu {
 	struct i2c_client *client;
 	const char *type;
 	u32 features;
 
-	/* board information */
 	u64 board_serial_number;
 	u8 board_first_mac[ETH_ALEN];
 	u8 board_revision;
 
 #ifdef CONFIG_TURRIS_OMNIA_MCU_GPIO
-	/* GPIO chip */
 	struct gpio_chip gc;
 	struct mutex lock;
 	unsigned long mask, rising, falling, both, cached, is_cached;
-	/* Old MCU firmware handling needs the following */
 	struct delayed_work button_release_emul_work;
 	unsigned long last_status;
 	bool button_pressed_emul;
 #endif
 
 #ifdef CONFIG_TURRIS_OMNIA_MCU_SYSOFF_WAKEUP
-	/* RTC device for configuring wake-up */
 	struct rtc_device *rtcdev;
 	u32 rtc_alarm;
 	bool front_button_poweron;
 #endif
 
 #ifdef CONFIG_TURRIS_OMNIA_MCU_WATCHDOG
-	/* MCU watchdog */
 	struct watchdog_device wdt;
 #endif
 
 #ifdef CONFIG_TURRIS_OMNIA_MCU_TRNG
-	/* true random number generator */
 	struct hwrng trng;
 	struct completion trng_entropy_ready;
 #endif
-- 
2.45.2

