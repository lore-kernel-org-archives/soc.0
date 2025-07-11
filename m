Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572B32D239F
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 13:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752240695; cv=none; b=nsXC+2HIEMgh7ZyDMThlojdgGAZ/hvGrWf2n5WrDVq8AkTNZUUWrFeihIcbEKsIPXq1lkhxoaTZ6uT7uurrTXxoi82EGSvhA8oOfifB8r7u0Q6UA/68ZmODVeiXs7HBudR9BEdmpHxdpEhQeYAZPjr/hOPTbum8HzQe8rrL8QQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752240695; c=relaxed/simple;
	bh=63SOELCORMxrKVDUUIzKKFTRBqKDHRIy+LUddzrAvg4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WzdGSpaJEkZUZWGmMmvtAAdASQuWht4zffvSMOfKem+jOwOW1qpmcJ8v9gYy3gWsbBJE4ZFPEKf+SqgwfCa/Im0VdP/9dkHYmRUBehzlMSxv3oMayw78zT2CoGccy8aUf4OdwSfDL3Tb03ZhO9fNgn5YX+7F3j2EmroatZr10xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 56BDUhoV014685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Jul 2025 21:30:43 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Fri, 11 Jul 2025
 21:30:42 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To:
CC: <arnd@arndb.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <soc@lists.linux.dev>,
        <tim609@andestech.com>, Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH v2 7/9] riscv: dts: andes: add Voyager board device tree
Date: Fri, 11 Jul 2025 21:30:23 +0800
Message-ID: <20250711133025.2192404-8-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711133025.2192404-1-ben717@andestech.com>
References: <20250711133025.2192404-1-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 56BDUhoV014685

Introduce the device tree support for Voyager development board.

Currently only support booting into console with only uart,
other features will be added later.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 arch/riscv/boot/dts/Makefile                |  1 +
 arch/riscv/boot/dts/andes/Makefile          |  2 ++
 arch/riscv/boot/dts/andes/qilai-voyager.dts | 28 +++++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 arch/riscv/boot/dts/andes/Makefile
 create mode 100644 arch/riscv/boot/dts/andes/qilai-voyager.dts

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 64a898da9aee..3b99e91efa25 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += allwinner
+subdir-y += andes
 subdir-y += canaan
 subdir-y += microchip
 subdir-y += renesas
diff --git a/arch/riscv/boot/dts/andes/Makefile b/arch/riscv/boot/dts/andes/Makefile
new file mode 100644
index 000000000000..c545c668ef70
--- /dev/null
+++ b/arch/riscv/boot/dts/andes/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_ANDES) += qilai-voyager.dtb
diff --git a/arch/riscv/boot/dts/andes/qilai-voyager.dts b/arch/riscv/boot/dts/andes/qilai-voyager.dts
new file mode 100644
index 000000000000..fa7d2b32a9b4
--- /dev/null
+++ b/arch/riscv/boot/dts/andes/qilai-voyager.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2025 Andes Technology Corporation. All rights reserved.
+ */
+
+#include "qilai.dtsi"
+
+/ {
+	model = "Voyager";
+	compatible = "andestech,voyager", "andestech,qilai";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@400000000 {
+		device_type = "memory";
+		reg = <0x4 0x00000000 0x4 0x00000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.34.1

