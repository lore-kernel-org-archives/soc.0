Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78105BA3D
	for <soc@lists.linux.dev>; Fri, 16 Oct 2026 01:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792114764; cv=none; b=fhKtFY+PjgZt6vx5UZY5H1hX87d8OPC/4O/5Y6u37pTLxmMi/IJpltaCOi2CmUUxufaJw04+SLSf+dqhYs5zPw5OEBMhT+OUBQhw/Rbf/gCbKm4JSTQIgxv+wSKsNp87zyJ2R7lKEBFkwwCaxZ2wXTOmcK4RSRHZOQj1Cphp43s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792114764; c=relaxed/simple;
	bh=VH/sJji9MaAJtXetVMAL0kmvwh0rIDcGnsVGqynD0Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W8cLqUyuYEUs/ON0MKxlVIvaQc0B7OTlaUJDn4Zd3elTwITjPnLAWOp355xOQt9zP+oGjLeiu7ettlyKUIGDZXiQHb9Eirrx6IUl8X/U4mN3eCy0dDbIOEluNAWOgoB6r63gg7Pp2eO6k9Nz5QWNkx7lTWO315CfJKTBa+epuQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDG8JgJJ; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDG8JgJJ"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-535853983f0so55416491cf.2
        for <soc@lists.linux.dev>; Thu, 15 Oct 2026 18:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792114761; x=1792719561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z1IfMfNgxmNnTVwhoMZ/I9bCV5F2hA5W5b2zHBAEC4U=;
        b=QDG8JgJJpeJfiW0CeqitiPXwtiEUklD1RQCcziCNxoxU4dIzZv2uR4SCq9SrTmJCPK
         P2tInotDjaiozi/A2iNtVcNY0L2aUirxp76CIGE7tXosTLTW6mtWl/6YoJdci19PZHq6
         LaKF5FINWHAmjsovPgWQdMdDEkn0Wb5hWC0GT5bcvjeRwybV8v4eC0CncBVSXuxp1Q/p
         ZsLUb9RxW2Z875xRTVJLKcbGYqtoD83lP4VwSye7w6JeohjFm2Df69HyqwS57mNCjsT3
         L6FGLu71mkGf5yjQwqlA9ebY4YvN95zh16fYsRVqJE7v6MFJnwwQn5w2kYgx8we8y68A
         Z98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792114761; x=1792719561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1IfMfNgxmNnTVwhoMZ/I9bCV5F2hA5W5b2zHBAEC4U=;
        b=U7HX6nReKbHGktuDzyRytEhAWwG44Y04KIpYxVRjxRLoCvL+uvkH3zUg8GeYl+WUmW
         IeyTYGowdFpO9vHSadlTF7qTvylro6U73ov387107oUW5Vg7UcJKtChbd8mkvZGU/a7k
         E4K/OfJ2EBA87uuGWRqtbYFaW8sx4bEW5S0Ub/b/SoPvY84xZ9gE4fFdqIGRCffuqYh5
         LOQAk/yahkt6zA3ICicNGh5VlNOjjxStebjdHF64J46flViJn/TAhJ30dmmqh6WB+Jhx
         YKwDelUjMdP5fCTvx+baK4VfI4aqPtC8RmcynRJ8ztLFIP3tQfV7JTz/JLaZTPVqY1Sd
         GYQg==
X-Forwarded-Encrypted: i=1; AKwUvBwrp1VezsiKgQc84EEa9aMekLKOJM/QatcyhdF8QbdiXpJNgRaDlEynBmUljTC7Crmy9Dc=@lists.linux.dev
X-Gm-Message-State: AFq9FYLkhbtaDGf0Cim76cvgA4wpqHglQVU8jPKzhuiFnbdVOwkPBHqV
	4F+qTIRgvtTn3wzmfsWetHuIqBW59VV0HFQDEgbu5jMr32JMe0cNDTw=
X-Gm-Gg: AYBFou1YL4fVt9cwXTLAXKBK2q8Kq3QAkGB55L+Ll3B48arkKA8hu77tADw1nExHgsD
	u0xYZUZbGoJP3GYncqZnBQ+9CzgxixMS5brlwsfkOnC09m60P9PyFkEP2PpV45lrGRV3n3NGwzt
	SWHWmkFfvhH9tq0E8F8AhbVO73hB5hodsZrF687ZZ9ERBwRwLxypSipVPwd24jVHgtI16+eo1uU
	gOKUS2k+btn2RZdr+lsrxr1D8A7yJFkF3qcRq2q0h87J6Kh83RhtQGjlMRXJz1DmgUY83IDUJD8
	wXMZQxAmYZ+2MJOLDrxmp39iOjs3Kc+0dTAGlhxM9hPU1SMFxjJa4wc/pus+1hUdQ/Vjb0bcNbT
	f31nKWtnVgimfVeqM/U8WO4p3OZGOkiKzdvgAMgntK4U4w8bHqPJ+HZNffxvKQAUcypk9AUGJCf
	6ecDJ3j58NtvwldXKJqOcd1jSTc8bEO0q4YiN55/LVqaHRTGi5hv8UPdFng1P2oXhn3B7rdweL3
	RPdgvIy1WZ1KqlGJMmnLUV/68mpq2R94RsLhgLiqJ2iecXe/mU+R2Qn5ifJOHMrsOWtke2j0gBq
	+6iIWs4RPlNM4ax9UHMbck8zP5O0KA==
X-Received: by 2002:a05:622a:1441:b0:535:864d:b821 with SMTP id d75a77b69052e-5359fac48aamr342803671cf.17.1792114761291;
        Thu, 15 Oct 2026 18:39:21 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a9c273esm8981861cf.20.2026.10.15.18.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 18:39:20 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] platform: cznic: turris-omnia-mcu: stop button emulation producers
Date: Thu, 15 Oct 2026 21:39:18 -0400
Message-ID: <20261016013918.3492835-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The legacy MCU IRQ thread can requeue button-release emulation work
after its managed cleanup has canceled it. Since the IRQ is still active
at that point, the newly queued work can outlive device teardown and
access freed MCU state.

Use disable_delayed_work_sync() to prevent further queueing and drain
the worker before the IRQ action is released. Keep the parent IRQ active
while the worker completes. devm_add_action_or_reset() also drains the
work if action registration fails.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: dfa556e45ae9 ("platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 31 +++++++++----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
index 4e430d6c3fc4..8f43bfa92373 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
@@ -11,7 +11,6 @@
 #include <linux/bug.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
-#include <linux/devm-helpers.h>
 #include <linux/errno.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
@@ -841,6 +840,18 @@ static void button_release_emul_fn(struct work_struct *work)
 	generic_handle_irq_safe(mcu->client->irq);
 }
 
+static void omnia_disable_button_release_work(void *data)
+{
+	struct delayed_work *work = data;
+
+	/*
+	 * The IRQ thread may requeue this work while the IRQ remains active.
+	 * Disable and drain it before releasing the IRQ action and the MCU
+	 * state used by the worker.
+	 */
+	disable_delayed_work_sync(work);
+}
+
 static void
 fill_int_from_sts(unsigned long *rising, unsigned long *falling,
 		  unsigned long rising_sts, unsigned long falling_sts,
@@ -1082,21 +1093,9 @@ int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu)
 		return dev_err_probe(dev, err, "Cannot request IRQ\n");
 
 	if (!new_api) {
-		/*
-		 * The button_release_emul_work has to be initialized before the
-		 * thread is requested, and on driver remove it needs to be
-		 * canceled before the thread is freed. Therefore we can't use
-		 * devm_delayed_work_autocancel() directly, because the order
-		 *   devm_delayed_work_autocancel();
-		 *   devm_request_threaded_irq();
-		 * would cause improper release order:
-		 *   free_irq();
-		 *   cancel_delayed_work_sync();
-		 * Instead we first initialize the work above, and only now
-		 * after IRQ is requested we add the work devm action.
-		 */
-		err = devm_add_action(dev, devm_delayed_work_drop,
-				      &mcu->button_release_emul_work);
+		err = devm_add_action_or_reset(dev,
+					       omnia_disable_button_release_work,
+					       &mcu->button_release_emul_work);
 		if (err)
 			return err;
 	}
