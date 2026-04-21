Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207B83DE428
	for <soc@lists.linux.dev>; Tue, 21 Apr 2026 20:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776803064; cv=none; b=QxKQ6qifJuIVz8pDbFQBv8O0G2XVVU/w/NRsJT550aqekvsXVt8YlBfpwbOVxDSjiGvKlZKY3Vb0bbb0r7bvHFUqrq928f+tAhh6roV3wr9RYlmsolTj1QFIRUhyCqqNbE0r4onaLW1X1QEgQzrrkujE5pVvpDIUbS1g6RbL5oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776803064; c=relaxed/simple;
	bh=CEUKetRzVzn2Xnwq6XKvSjU6QTqMzQIFYZ7UZd5Gyq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CDk9w5cBSVoFj7xrYp57G4+dHHfNnLIWz4jH9Tba3irLp9d+KyA5kxqFPTpzDyDDFVcm6qhxw0am2ue0HGJxhHzNWVmvWbzyMgBAmLbqXSKugZhtc1xaBDhkO1tYijEYtkVzCT7rfXegFIvzzJByjsG5V2UP6MhkACaGRl0L290=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQFkOkZe; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQFkOkZe"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488d2079582so54612345e9.2
        for <soc@lists.linux.dev>; Tue, 21 Apr 2026 13:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776803060; x=1777407860; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBJ+hPnmdJzo3k/g70RHgYIGur+PsmZcEVdmZLkZuHg=;
        b=nQFkOkZe5G2xcvHfLoZ+eTB8dVEd+OoTCTxGtY0DpSJNZ9DN/ojDzvZbB3oHIcjKVO
         ML6VLHRvda/Dq4MVSyQnHt65Vi2u6sf8iY5VoVDpQTr5FT8Ts6XYDruVCSQ1ZYO5MTsh
         6ZfuZLcZeaMe5ywB95yKk/GVes6WiHjGju5cddETSKMJKR1jHdlk4qOXdosxoUuuwZS2
         CdCXC31ASuhNemklw3BI/eLyb+8/wAaisFchFSnAeASAgDlpzVMHhkHUEFCr/9CBoRx/
         o6VHxTJHQvvgZ6An94D07BxKxBVxO43sBcMG5PfjIwbuFW/f95oimu1izBnGmVRSv4RR
         nMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776803060; x=1777407860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EBJ+hPnmdJzo3k/g70RHgYIGur+PsmZcEVdmZLkZuHg=;
        b=X8FfmAenbj8Hr0GxBltwOZUeUn3zeUzSe7f+d7o5aTtDNZp3j49Dl7PbhdoOscYk48
         JTRRteZWo2z5QMxgOfRfgLYEeLmcKJvV24pEgL+Qi9Y9JFarUiGdK6pu/VE8uugUktuv
         Y8U2dNLIWVAtd9EjS26KYl4o1T3OfUgjXm4qAbv4fQ3EHzkI9VHGu+Z1uUE0Jv4vA69F
         dMksPRKcxJMdVrjjFxo7uYkHnq6K6fR2Qd+UphzxqhnSa77IN/G2F2egGOS4KY5p19yx
         V6nfO0GZn9jwng2kuAULDXJikvJ2n2pfZ8AHiVWVj33s1NLepiq5oglI+xVtPsiw+559
         5zZw==
X-Forwarded-Encrypted: i=1; AFNElJ8g3t4b15V//9Mx8ut1U9dn7aQOsEMWroBaQSK8TURrY2macOtIexkl7tv/rEpT0wmDBPo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQfKzhFDQHRJxTwWChkD7GXZawsWQkHdPHZP9GdcKz2aktiCZx
	ADpZoxYkWiclq8d2UjkcUObMi77Z+w2cLPfgOlRPA2JOeRChtYtNhgXt
X-Gm-Gg: AeBDiesTdH8v2Kex/jwed9Ba9ozZWEBRFPs2EO5pwL9DnGDxN4DcQHSQMA6OgoUTk+j
	9aEf1Zdjsop05T5m6ztOdDzAi6pdBKlGJbPlv3Fiu9YXC4p9hxEsPhSKz2KmqhTtAbt5wllXuTT
	oh/R9Xa5xaDBuJGpjSGbf5yUps1/n2b4ngZT7bmVDJsJNxK/7TfGlk84xDQgHYeqCeCxGfAvKWh
	z6VySPYKESHpm0+GrH4wDjTq+nTz2965qHUTQYwu3YfGk/FdYnNmTCykKvwrcsO5UjCWSvwBVne
	0GdjPcgZYbmYWzASYlJvKLKGFfIRtCtO345UhKzSzFuMg6esBPmk7ssU0gncZ+2RfBjneLgy6xd
	tW9Q0WbY1e8d/7p40N5mxNVYkq0V3LK7+++VKKR/r5+kGDmdVC0dDLgoiJ0slnBvMQ7AZW8OEbp
	iS5iMUGWODGU/o4MwK7Fozf8TW0xsD7ydoX5HsdufvwWr9
X-Received: by 2002:a05:600c:308a:b0:489:6c22:e081 with SMTP id 5b1f17b1804b1-4896c22e217mr83386305e9.0.1776803060488;
        Tue, 21 Apr 2026 13:24:20 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm655989805e9.3.2026.04.21.13.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:24:20 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 21 Apr 2026 23:23:13 +0300
Subject: [PATCH v5 5/8] ARM: dts: Add an armv7 timer for zx297520v3
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260421-send-v5-5-ace038e63515@gmail.com>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
In-Reply-To: <20260421-send-v5-0-ace038e63515@gmail.com>
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
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2135;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=CEUKetRzVzn2Xnwq6XKvSjU6QTqMzQIFYZ7UZd5Gyq8=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp59zXF6GMMLpNkq4WwPjAfftYcRTaZJtkuzLOe
 KXRFnrgIfeJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaefc1xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiK8xhAAldsqjYe8+3h/X86yla+u17rfI//QK+v
 +A4g3kwBFOtoQ4YkoXtFlmKNU60WhO3ldAyJruXz0oONJCiUGJVhQdevJ6gJgTGtbFxWrFd62OG
 TpeCV0pwDt69klMWhqnis/g8QTr1XydLXrExyn59UcGmkzMiT+namcriwxgM7xXxZKeDxQ9w6S/
 A9+oVVuDBIfCc7ZwisT03KEmHMnhWy/mTY/9Ggzwgu23EHu63ztG+sePZ/nAI5Vqml31qmTpgox
 18zynyLmwOSAvGMPGpnfI3bq2ldQwf+JsbyS1qRvI/lNXPTEG1AgIIlXgX0qF2r4ZRtV5GqByR0
 QZzbBYy7jO4f6n3dEE/T+hrPGJpdv8edlkFOYbEv3Pu3+2tmCIa6dup5VjLjkLMS89ERRnvvW62
 c7eWCocyYyWgow/ptUwWJ5NLIhY4XsYe67F35wFukL0irgRrfDYLaKVYNS90fEPjULHLhpYpgSn
 wwnlChwvKoS9BJLqY8a3cJszrQdI03ujbootk6HZVjuE15Jx7a/P470qo6sviolSF+rmWsA0iuG
 7qWOhsm2ToVSrk5f47Fm0rI56oD9QDQLiJFXq2IIDYNSIol8ez7QWvqlvfiPZKeCHNVVGMQYcCt
 fEy9cxesmM3Pq2mT5aNKIPDB79epR6RVMymRSpe3VxKmldcfrKLU=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The stock kernel does not use this timer, but it seems to work fine. The
board has other board-specific timers that would need a driver and I see
no reason to bother with them since the arm standard timer works.

The caveat is the non-standard GIC setup needed to handle the timer's
level-low PPI. This is the responsibility of the boot loader and
documented in Documentation/arch/arm/zte/zx297520v3.rst.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index 0fff00f910d6..903050c684cb 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -20,6 +20,21 @@ cpu@0 {
 		};
 	};
 
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+		clock-frequency = <26000000>;
+		interrupt-parent = <&gic>;
+		/* I don't think uboot sets CNTVOFF and the stock kernel doesn't use the
+		 * arm timer at all. Since this is a single CPU system I don't think it
+		 * really matters that the offset is random though.
+		 */
+		arm,cpu-registers-not-fw-configured;
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -27,6 +42,15 @@ soc {
 		interrupt-parent = <&gic>;
 		ranges;
 
+		/* The GIC has a non-standard way of configuring ints between level-low/level
+		 * high or rising edge/falling edge at 0xf2202070 and onwards. See AP_INT_MODE_BASE
+		 * and AP_PPI_MODE_REG in the ZTE kernel, although the offsets in the kernel source
+		 * seem wrong.
+		 *
+		 * Everything defaults to active-high/rising edge, but the timer is active-low. We
+		 * currently rely on the boot loader to change timer IRQs to active-low for us for
+		 * now.
+		 */
 		gic: interrupt-controller@f2000000 {
 			compatible = "arm,gic-v3";
 			interrupt-controller;

-- 
2.53.0

