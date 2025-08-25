Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098101F4CAF
	for <soc@lists.linux.dev>; Mon, 25 Aug 2025 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756128283; cv=none; b=POjlLGFtp4+Se81nrw0wa5EBe+tFAeQ/wi/TYpKnjjA5/hVN7FQZ8B1loLueK6BU7OQtFcgm4eMWLbqhUkJ2YkQQn+FcZ3kkP/3zX9KulJrbMnQ/6Wyf4ZGj+fQjrpYk62CJfNd/aaV9MdfF9oA8ctig6evujpIZsXwud0vhhBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756128283; c=relaxed/simple;
	bh=cIsPPo32+JNGFi7K3uRYrlV5xTx7cAqZHA6trNjUbTM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oE5Iwy4TFUs8bS+bzXx4za1WD2nd3y3LmypWkjymm6u/H3AestDwV6lReOGrlbzMf5i2CgxhMr8SBZeo0076VfDtRWoE5zfZPdyIID9BZvutnNWUKoaN5wkHWc2wJH0SGX2D/uKC1WGpt2O/4WnzZtg9rYjA6NvQR6rjAZ8pnqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=oLeOUBJb; arc=none smtp.client-ip=216.150.161.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="oLeOUBJb"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=2339; q=dns/txt;
  s=NAESA-Selector1; t=1756128279; x=1787664279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cIsPPo32+JNGFi7K3uRYrlV5xTx7cAqZHA6trNjUbTM=;
  b=oLeOUBJbJZULv08uvE5UXoRjsA6XJBKOFxHZI2GPDUveIfu92WchdCvZ
   jJbnTAb8TPpBa9fLjgYbGLNiRE0gUXKpy5YEKJAQG6HAJqIlBxbfiVqBs
   BbA2p5r4CXVJWJQ799P5aKmAql5kf699Z3Fr62DXAAAoCYSszyxYPHaOt
   amb9HrWsXEC4y4vGtxOR+QQwFtvUwqhG73KTDYML3GoO5d8x2M8YcfmDL
   urRPWPhu5omANknFsYya8Q94GQywAOGUut8qlFP+inC2H7nSLxFXFBu3y
   bpJk7qQAB+Nln/vwn8l877+NBQTpilRZIdh6zBo3mi9xruK5R+YM8uNA4
   w==;
X-CSE-ConnectionGUID: QdzYSJlzRCmHcjRHOnm40Q==
X-CSE-MsgGUID: PdK9JlvwSoGaeUiq9bmlGQ==
X-IronPort-AV: E=Sophos;i="6.18,213,1751263200"; 
   d="scan'208";a="31950019"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa06out.arrow.com with ESMTP; 25 Aug 2025 07:24:35 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 25 Aug 2025 18:54:28 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH v5 6/6] riscv: dts: eswin: add HiFive Premier P550 board device tree
Date: Mon, 25 Aug 2025 18:54:27 +0530
Message-Id: <20250825132427.1618089-7-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
References: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Aug 2025 13:24:28.0156 (UTC) FILETIME=[95475BC0:01DC15C3]

From: Min Lin <linmin@eswincomputing.com>

Add minimal device tree for HiFive Premier P550 Development board

Currently the data populated in this DT file is for UART.

Signed-off-by: Min Lin <linmin@eswincomputing.com>
Co-developed-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 arch/riscv/boot/dts/Makefile                  |  1 +
 arch/riscv/boot/dts/eswin/Makefile            |  2 ++
 .../dts/eswin/eic7700-hifive-premier-p550.dts | 29 +++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 arch/riscv/boot/dts/eswin/Makefile
 create mode 100644 arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 3b99e91efa25..3763d199c70a 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -2,6 +2,7 @@
 subdir-y += allwinner
 subdir-y += andes
 subdir-y += canaan
+subdir-y += eswin
 subdir-y += microchip
 subdir-y += renesas
 subdir-y += sifive
diff --git a/arch/riscv/boot/dts/eswin/Makefile b/arch/riscv/boot/dts/eswin/Makefile
new file mode 100644
index 000000000000..224101ae471e
--- /dev/null
+++ b/arch/riscv/boot/dts/eswin/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_ESWIN) += eic7700-hifive-premier-p550.dtb
diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
new file mode 100644
index 000000000000..131ed1fc6b2e
--- /dev/null
+++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2024, Beijing ESWIN Computing Technology Co., Ltd.
+ */
+
+/dts-v1/;
+
+#include "eic7700.dtsi"
+
+/ {
+	compatible = "sifive,hifive-premier-p550", "eswin,eic7700";
+	model = "SiFive HiFive Premier P550";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
-- 
2.25.1

