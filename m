Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5706636F8FE
	for <soc@lists.linux.dev>; Wed, 10 Jun 2026 04:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781067426; cv=pass; b=uBSjhy6IGaXgg/U0MeYh1NBnOP/+oag8Uqaol0YlMjPUR9YnswqzkO+9qIqe2SWno/kfy80fN+3pODZ2CCaO6TZLIHT7YkQ5RBxQGw1mlKtsM4QJ4+/iXAHFYo2osrSOfa3XxWiQO7yjgHbUOYIkUIp34pxETTQyc5LBhrzMAAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781067426; c=relaxed/simple;
	bh=DFfhHio2stg7Owp/K89LqNRuKupdAZGfcTq6GOKJWxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d8dpqC/TB/a1dTQSkjMpnhKRNTwj3RRrA1itCN1BxzNCqycZXYraw7/F9TBXY9M3Xkag322DSLm/xUTSPV+lP/Hvi75twCWX/ew3KcIE8LLVxKeEz8EGtM46PEYJ5x4b16/30yMxQAM3zhGRqYyqbQOA+XO8gllmLzt7hjgRksU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cue83mix; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cue83mix"
Received: by smtp.kernel.org (Postfix)
	id 029C71F00898; Wed, 10 Jun 2026 04:57:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.82.68
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781067424;
	b=Flg2OvmcTPee00rgZr1lBtgZmXJDy6iItfFwP5VVjf7sKXTHYOv/wwlXy3nVG73a5Kmk
	 4tvSlEyHKWbppJLITs14Rpcg4dYaK1sF/aiJ2ge5jWUx6qvpZKbRNdWVzHs76mHFg12wp
	 zcaWD7LpM6oGMHL12GuowO6T1DSW80H2iIqJmglMucP9tqtlZ/uYrus1qEbRP4AnBpqY0
	 5QJ0aqi/XSVJc2draPGu14TEUoKU6ejthvisbujrzpgF9IwUfhkqGw9dX4KuE2xyEo/YP
	 mdw3ADAeygbxD03D16CHGbU5mBs40U79iNOwm+l+yYtveHEsseT2+sWzE+HD1ck3bYw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781067424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZkVweKMoSdI85cubZOQgniTBESiwe3e+6vJ5f2S/Hv4=;
	b=C2EaUETzYDYx2lhuRzN69qMF0Tdcodl4l5Pa+C3/9c3kUZfTdLHc8zMWMSzPfJnfd0NN
	 qR3XXN5+SAiHZ5TzhZHKAYv3enbQrKKVEkeKcxFPMuni9ziY7wVLWW4Q/1O/cdCOISDvb
	 oTBWVqyDFnYmWc6ky8y0GXCCOWLm5yEsmrou1x2N0rWNHbX1pZbQ16+qk6KPhkcY2a35x
	 a5SUxhRLxWbKDNq0KF6rVS40RmiywzHTnz+yjbesz3MZkDHF4nQj9cuJIhertN2rdsFSQ
	 DiskGOw+Z9j/m1UehMJR2gYpQukbl+MaljwMusUN3P1mhY1p/D9sigbzxvqYzHF3uBg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Cue83mix;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.68
Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5FB2C1F00893
	for <soc@kernel.org>; Wed, 10 Jun 2026 04:57:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Cue83mix
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5FB2C1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-138129a622dso4425847c88.0
        for <soc@kernel.org>; Tue, 09 Jun 2026 21:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781067423; x=1781672223; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkVweKMoSdI85cubZOQgniTBESiwe3e+6vJ5f2S/Hv4=;
        b=Cue83mixciEC0Y3JmY5WpWKbseSHJBWP629sKGZ3+EiCx7qcEPVdWKtElJGnSJeJGA
         78m7P38IaskY824re93Kv5OZNO73PNzwcFoa64y93GJUTqXqippVU/WkfUXnt3XgbAId
         TDshKZPl3/H0CyDa8psh4ukUsyUJzJAD4I2qnyEY2d1UPwl9LXPirgahZGe73xXaVywR
         0vZ3AylOhj29YSLzFHuQHd7IMbDChDasg16eK8rXr3AixCeEDZw6WJNNz5Ie/2l6m0V9
         2HV2/F+k3tp/tnZWkm5Yj/Kz7ulrfiVLQBypJacLcBn8zxUXS0X9vDGxgBX8WFZo2WP+
         OYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781067423; x=1781672223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkVweKMoSdI85cubZOQgniTBESiwe3e+6vJ5f2S/Hv4=;
        b=mL89PGv8i3tkj7FwKh4lqAuh0dUXJI542SOTMCCDIeP/3p1B9HQM/CSDD07Is3uLri
         Jb1E4Ia0ye+ODi55JmmVRMYA4aFnZtTOu/3seu3d1tm0QrOBK7NoRfWNf2i+CuI/b8NL
         PbpISM/IeajjaMXifvwmvbQpn+ztnLGj5IZQYFrHPushbWPLgBTXdVvAutzrhFxMU9Q4
         NZpFqIAbD/+nhOqfJ69iFW3dI8TBqYHjYminwO0k2Yawc4DxkX0dE0BeaVjcE60/0xvz
         lCsg+Awz6Q5GPmTpxYhWkJ7Dr4+xFA16E050xT3mexhdJzjLpKFY/8qzqx504N4UWE05
         FM9A==
X-Gm-Message-State: AOJu0Yy7cUKNVCejN3tpRWugr1ZJKSN1ONaLY51ql4EBvghrtqSrEAyO
	fIh0O8wXl90eyi4kgp5WtzMgr81l8W/jfzYUoN8a1gF3qr9KARTzMNRgjjRgD/lG
X-Gm-Gg: Acq92OEuHGAQTWdATFGlQMNpSdCrFUULDgi0f+zR9Vbhx9RTO8A/xeFAiA8gCciZhPh
	kiTlUb3ZNARAnKU+aq/dmCGeRpsCJ9+5DqDV/7qsNJwTanKSfQ1Mm9WKQNAc0XtVfDkogfvSCXn
	Ldioah58TgkCav1vJzHU048jotIRnuA8Mx+Y136P8BkxpeBnMQGEpaSssF3h0H9L8GW/qSkJQAm
	p2IvUeWyL3MbPMfImJ9TJtOrYNpEfVQQfAM9u5LBa1TE32CGT1VS1QgNb2hIy31lPEn/sSnuJ0+
	rLee7JzRyz745ZKbyctN0X7C/XQOCnH1b9ex6TxQyK0s+D2KBz9+4Qc9jYRIaxrqCN1XITvL8VX
	j21Q3oYYNPmdxT7F/3KLkXb52JHWYkKrhrl5ZS8Yw7Q/4ctHEVIX9rCjijKHhQogITzDGhlT0SP
	U/fU4IZxs3F/LKqqYv322uOxDomekq51KSxPIH3NWx0tFHfPhthWiDLmcfXoH77yCCj9jmp5EKt
	Nqg2MS90af6tgpeejXuxxTaKbDBw4nwjkfTbW8FoWItHnDrbLgSoLo3/uwfdQPzXZtq9FXtKVTQ
	ExDPA75nSkEfrEWuDebDYx3oO3t8dhawu3euSUw=
X-Received: by 2002:a05:7022:1b0a:b0:137:8921:4fe1 with SMTP id a92af1059eb24-13831bdae38mr4359368c88.37.1781067423232;
        Tue, 09 Jun 2026 21:57:03 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539432sm20862701c88.9.2026.06.09.21.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 21:57:02 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: soc@kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Subject: [PATCH] ARM: remove the last few uses of do_bad_IRQ()
Date: Tue,  9 Jun 2026 21:56:26 -0700
Message-ID: <20260610045626.248643-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The do_bad_IRQ() macro simply calls handle_bad_irq() with a lock around
it. It also carries a comment stating that uses of it should be
replaced. According to commit aec0095653cd ("irqchip: gic: Call
handle_bad_irq() directly"), which replaced another use of
do_bad_IRQ(), locking the IRQ descriptor is not necessary for error
reporting. Therefore, replace all uses of do_bad_IRQ() with calls to
handle_bad_irq() and remove do_bad_IRQ().

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/common/sa1111.c             |  2 +-
 arch/arm/include/asm/mach/irq.h      | 10 ----------
 arch/arm/mach-footbridge/isa-irq.c   |  2 +-
 drivers/irqchip/irq-versatile-fpga.c |  2 +-
 4 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
index 449c8bb86453..a0f854cf4748 100644
--- a/arch/arm/common/sa1111.c
+++ b/arch/arm/common/sa1111.c
@@ -221,7 +221,7 @@ static void sa1111_irq_handler(struct irq_desc *desc)
 	writel_relaxed(stat1, mapbase + SA1111_INTSTATCLR1);
 
 	if (stat0 == 0 && stat1 == 0) {
-		do_bad_IRQ(desc);
+		handle_bad_irq(desc);
 		return;
 	}
 
diff --git a/arch/arm/include/asm/mach/irq.h b/arch/arm/include/asm/mach/irq.h
index dfe832a3bfc7..fdcd8388977d 100644
--- a/arch/arm/include/asm/mach/irq.h
+++ b/arch/arm/include/asm/mach/irq.h
@@ -17,14 +17,4 @@ struct seq_file;
 extern void init_FIQ(int);
 extern int show_fiq_list(struct seq_file *, int);
 
-/*
- * This is for easy migration, but should be changed in the source
- */
-#define do_bad_IRQ(desc)				\
-do {							\
-	raw_spin_lock(&desc->lock);			\
-	handle_bad_irq(desc);				\
-	raw_spin_unlock(&desc->lock);			\
-} while(0)
-
 #endif
diff --git a/arch/arm/mach-footbridge/isa-irq.c b/arch/arm/mach-footbridge/isa-irq.c
index 842ddb4121ef..48c7b3efd555 100644
--- a/arch/arm/mach-footbridge/isa-irq.c
+++ b/arch/arm/mach-footbridge/isa-irq.c
@@ -89,7 +89,7 @@ static void isa_irq_handler(struct irq_desc *desc)
 	unsigned int isa_irq = *(unsigned char *)PCIIACK_BASE;
 
 	if (isa_irq < _ISA_IRQ(0) || isa_irq >= _ISA_IRQ(16)) {
-		do_bad_IRQ(desc);
+		handle_bad_irq(desc);
 		return;
 	}
 
diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-versatile-fpga.c
index 034ce6afe170..6eaad836d9ff 100644
--- a/drivers/irqchip/irq-versatile-fpga.c
+++ b/drivers/irqchip/irq-versatile-fpga.c
@@ -89,7 +89,7 @@ static void fpga_irq_handle(struct irq_desc *desc)
 
 	status = readl(f->base + IRQ_STATUS);
 	if (status == 0) {
-		do_bad_IRQ(desc);
+		handle_bad_irq(desc);
 		goto out;
 	}
 
-- 
2.43.0

