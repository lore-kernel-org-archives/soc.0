Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4D83370EB
	for <soc@lists.linux.dev>; Thu, 16 Apr 2026 20:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776370790; cv=none; b=c7l548ylzuvsQZeCeh3euaMInZC6YY1tySPyGoniYb8m3vsOsjQrvAKulqf+MWrda/yi+6Mnnn/EpUhFwrNLkpCz+ajrNYvs9SHBjSwTlcnyfMuqea3Gf+icrnDk8RL2BDovIcGqKzZ1/np7RbfNZ4aGqBg7BA/1MXbj7tPobhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776370790; c=relaxed/simple;
	bh=DfFTCD7dR9UzG1/YZiQHT6WP9Ms5CofApjF0auiCUpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FwwWVrUp5L1SIwTABDl3/tjuf64+ZFt9j1sQ6EwjclwRz3bdqqOrjkLEv3oIqLsPKM3YBjysmnqQviNjU7EyMLyUpdGqk7uEMD89sVojZjoOPNvqHeP7o6uScI+AoVq/juYTjAJl7DzEH45b7uBspXa+h3JNTAuG5rS0pRa71DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qyYIWXKe; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qyYIWXKe"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so58292425e9.1
        for <soc@lists.linux.dev>; Thu, 16 Apr 2026 13:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776370783; x=1776975583; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKL1UApwli0vBwJCTHGaBiJ+JuL3QPXRKM4vGc8erbQ=;
        b=qyYIWXKeKOUCFOgAkq8BL7c0BR707xzhPXfnxbQewZYIJUeElynSu392mjsTdNvKgX
         xE9D8W7Z+nnSPtaY+zOwU0FDsBnmQ/xLkraPPybQ6vcuC39/yw7PVE7H2grhLvk385qm
         h2e6/A+t8CEgdBg03V4flNtWZd4QUvv3AbGxhY4U4Tf36RUUxPgQL846yPvR8cyx/kGg
         XuoTB7M5k5W2mBE9DF3uppWSR6zMHW/8nE8zxpOJQmKEuLjVjhZcmDww7sze9y0Jxezl
         98fJxU3RZMrrpVydSoWzveJ4JY5naewjO7xl1Jecrl2M/p53ujFaUpBHdtgTm2aolpGq
         YMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370783; x=1776975583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKL1UApwli0vBwJCTHGaBiJ+JuL3QPXRKM4vGc8erbQ=;
        b=FCqRI8cHTfFrdspuQ/YWFNmke9h1JkLpPVX+pay/ZsEX/qCyt2Qh7ezqCtDlWKxUzw
         wkn+TN+p7ib/B6SAaxQwurhRCkuICxeRNr9l/6QSiDpaoXL0kY9XfK2+vZ46C87ApmmD
         4fWEy/K0E8h1s/Ko04Tu2znz3A4rTSj0N9uiGS+VrpbKMUGhyntiOLNhDl1qQBvNs3RQ
         1LmLh3yp50u1e4LkvJZ8ATib34cLrLCJpNtXRMuvdryFaYtwpbqWVvrUS0qVpF0RblPH
         sT+DHcCnclUb6HyfS36MDIHDuklNfcDNIB93ipaZxzPvYnVr5KmJm6dRdB7NpFOKnXr8
         cxeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uOCUKzlD86DvVtBDpGHcZloFN2E6mEKXxfG13WxB5+LXrovc6PN20n2GSOQfunlWGYSY=@lists.linux.dev
X-Gm-Message-State: AOJu0YydxtrP8J/DVstWB4nFK7a4hwlypwmov1jUxu/rzd/IV9xos4st
	5iG04+RlrXNEv+23FNof3oda1mxCq+FRKf97tsYVVaqWqJOiqFR7is4Y
X-Gm-Gg: AeBDiesKCo7PoSNylYXwgUzATNs9mrJB5bs2w4yGWUb/v4kbSs6dH3yE+5tOO5rbIYK
	oFTnnqv42oKpwbNPgYqT4AX3zO6QjM41oUxomf/BrZZS3yxGQm3vzM42B5krPqTUJQPUfr3mKkJ
	NdsNdNCEDkoWh2/LVItxD5zaEMLG3JvPmfUu/embZZHWvEqCzfS3uf1X4d80QqKpj1e7iH+kG/C
	A6jN69Tf8ZeHywKvO1P31o+iTc1BOvJJYlJB/gsMwjPRYnSaQIRtEHyOU6SuztpoWhIP2/yE69G
	/q48L56tJQzaipKHpSfQb/ENJh4VqoGckh5wrqbY4GWuGJSkmy+SKF4m+R8Vw3DbZARJt+ZzDZS
	FMx6pgeR3apx8ht1NPyOMjCcK9KdM7iOVvT7QXPD99d3o2C2dVqssPQ+WqFfCzrQ5CNuAdKin48
	KyvM+9jvwSRbXQ/xMh46aB6TveluIhdRLpg+a9D7K/K8CvYg==
X-Received: by 2002:a05:600c:c0c8:b0:488:ab1d:dcc5 with SMTP id 5b1f17b1804b1-488fb787ba3mr732015e9.27.1776370783286;
        Thu, 16 Apr 2026 13:19:43 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35c026sm16180624f8f.15.2026.04.16.13.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:19:42 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 16 Apr 2026 23:19:11 +0300
Subject: [PATCH v4 3/8] ARM: dts: Add D-Link DWR-932M support
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-send-v4-3-e19d02b944ec@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
In-Reply-To: <20260416-send-v4-0-e19d02b944ec@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3027;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=DfFTCD7dR9UzG1/YZiQHT6WP9Ms5CofApjF0auiCUpM=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp4URKMjgP0rIgBZerMAS04qD7fxmmvb4Dtqzzl
 qq0lJcpsFeJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaeFEShsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKSgRAAhITFO+PosbwvE3BtTizQCM5HaxtoiNN
 PcknQEsqTA0dbu2+zLAYugjmebCwIo0Gd6QwM4l1TWj0iW9ti9QM9G+SQQBXFxrohZyh+U9ouIm
 gVclMgJnT86r4gWMVEf/f/VCzxERJsNXencypr3FPpTorY2YrTYv98MPNEHMAlEdmeCiLImCzqG
 LP+2Yf4fi8t3ki97W6CjCRgTbUL7vFRFhBn5IHugKznpqcXqnFsc0qqn+NIyaEzS7DGYgCjFz1a
 D9BujFr3Ghcugdx9NxwyQBFxKk3EtnYdakq8lYFVTRKRj/ux7Ga4R1WgybucAHe3a2lz3n9ZVUd
 kH7JDkBMMTCHQV0KNSQsg71IFEB2ERUsQhzrHMtqDTFc1D6bWOYYCO4+TtNBi0y7ysD1da4bR1S
 kPd+om15RV4vPr6mUec3rPMmOPE2fvcp58LRYTqgErhXquMJAWt0+vq9N2EIATPyH/4a+oAZsxJ
 XWi7/qA1mdWYbZ59qWN90uayMpSsOkB1xEPoCBo5N7zYwR0K7aHwqW6QyfTRuvrKumb/CRN3I5i
 xf1YgbgpQrElLCF8kX8qy+Np61GmIS2MelINW+r34WUPytspWVh//Z7/Y/zPEzNGLuFRLxuVD37
 5P2OFcYy1ygGF8H2pGUny4dT3RJT9+e+JDpnItIQnI3U28+fPFSg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This adds DT bindings for zx297520v3 and one board that consumes it.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 MAINTAINERS                              |  1 +
 arch/arm/boot/dts/Makefile               |  1 +
 arch/arm/boot/dts/zte/Makefile           |  3 +++
 arch/arm/boot/dts/zte/dlink-dwr-932m.dts | 21 ++++++++++++++++++
 arch/arm/boot/dts/zte/zx297520v3.dtsi    | 37 ++++++++++++++++++++++++++++++++
 5 files changed, 63 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bcade90ca14e..f7ca0d478e81 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29203,6 +29203,7 @@ F:	tools/testing/selftests/cgroup/test_zswap.c
 ZX29
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	arch/arm/boot/dts/zte
 F:	arch/arm/mach-zte/
 
 SENARYTECH AUDIO CODEC DRIVER
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index efe38eb25301..28fba538d552 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -39,3 +39,4 @@ subdir-y += unisoc
 subdir-y += vt8500
 subdir-y += xen
 subdir-y += xilinx
+subdir-y += zte
diff --git a/arch/arm/boot/dts/zte/Makefile b/arch/arm/boot/dts/zte/Makefile
new file mode 100644
index 000000000000..416c24a489cd
--- /dev/null
+++ b/arch/arm/boot/dts/zte/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_SOC_ZX297520V3) += \
+	dlink-dwr-932m.dtb
diff --git a/arch/arm/boot/dts/zte/dlink-dwr-932m.dts b/arch/arm/boot/dts/zte/dlink-dwr-932m.dts
new file mode 100644
index 000000000000..7b2a26aaaecb
--- /dev/null
+++ b/arch/arm/boot/dts/zte/dlink-dwr-932m.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * D-Link DWR-932M Board
+ *
+ * (C) Copyright 2026 Stefan Dösinger
+ *
+ */
+
+/dts-v1/;
+
+#include "zx297520v3.dtsi"
+
+/ {
+	model = "D-Link DWR-932M";
+	compatible = "dlink,dwr932m", "zte,zx297520v3";
+
+	memory@20000000 {
+		device_type = "memory";
+		reg = <0x20000000 0x04000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
new file mode 100644
index 000000000000..d6c71d52b26c
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0>;
+		};
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		gic: interrupt-controller@f2000000 {
+			compatible = "arm,gic-v3";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0xf2000000 0x10000>,
+			      <0xf2040000 0x20000>;
+		};
+	};
+};

-- 
2.52.0

