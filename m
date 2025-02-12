Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365B12066FD
	for <soc@lists.linux.dev>; Wed, 12 Feb 2025 22:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739400242; cv=none; b=r362ZstLKvyMN0hVL1LREa4Y2iZDLM2QLe60VOQsgQFraYQM9a4uXcolggTdZJyqbaIQxUI1fZR5Tap2bAmZ7edYnf0b2qQG4julDJfJyhu+rLq1jfc8clvBwXC4ZQ6QE1KPfOhTc57TIhS7wm8h45cj4wtokgd7NxnEKcbf9iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739400242; c=relaxed/simple;
	bh=//HBoUthAeeT6PrSozHevLWbDPnUTHYOQLL9FkxNksc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DQ5XIUhM0SxgviGbQcSUhKDAtu2JEvgpWgWLng/ky1oxuVmcfnK+NmEIDDpKP/VPcZtmip8jOW70aazuTWdt2kgMu6OInjroYX4AT18QbyagEDIhmiiWLF8My2s77zpNGiJBnInBETr5FhPCdC6NvDffPA3jTMrwvOLtgCQknMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ja5xNr7Y; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ja5xNr7Y"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5deb1b8e1bcso358891a12.0
        for <soc@lists.linux.dev>; Wed, 12 Feb 2025 14:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739400239; x=1740005039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7ID8a2waLPqEy758YEiSSOlOf5nB14uzjzhQ1m474o=;
        b=Ja5xNr7YD5MDOliNlxPXIVBUuugIlznaLvu8vP1u5zoIT9vakQzL7GJSr1AXjQvkSk
         sr4rqPyHsFVddkCKYlRkp3QLvQsWwpXKYDo3DQFdgQPviD8DEi/lcAwFKvIHzj2SBk4k
         xdSErdxc98730hL6hxoSwDvSh31VdF+YqJaMC/QEDB+KaHmptHNsaD8OV6/T4395JXW9
         pbMK6jxbOAbXY7NegQfUL+WJGleZr1jS0dZuJrQiFfnerjwvuEOVnKH2yNMdCdQQaXXr
         HCftFij8yK4haE17N0dYNxV900utC70BL6MnPxuMOccanXdM+qBsrzcH/uglD//WGOx3
         Y8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400239; x=1740005039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7ID8a2waLPqEy758YEiSSOlOf5nB14uzjzhQ1m474o=;
        b=qoZLhHXV2xWfXKfKzG8FHsGDI7RYwAPyuFaxxTtr3cgNEdA9jAsNxLbHyCufAkTiyE
         R/TmOAGKMze2stN8heK/glalpxsivE1i11HMRYrYxS/meTZ+OkkSVUSgpvCxdIIGR01D
         2JKT8a+Ko5NnLpeRnlU83Er5XHpFar9nInUe/o9bCQ1ENcO/DZMNfZkeBYRBOOEmaatt
         kIgPGkvlqeJnE+X1niLxpXoPsB7IerXdpx9xWOinhQWP0WNdryCaJrl20TxxY111Svjm
         csK5tG8cYypiTPgxBwS6cMVqmOsTEdOb+q2Otkj2jIKlHnmaXZy6GspGzwxAuZ5jVrKd
         ZEhw==
X-Gm-Message-State: AOJu0YzMOqRA9vIiNWkbbyGyuQmsyBhqdAawECUn5lzdOQzATfZp/5v/
	Tw1P4Ja9nQAXukXByrmF5pdrenFNuPkwG/m8i4T5dPrqkpBZVcKhuQa9Ydh4
X-Gm-Gg: ASbGncv3RZV8tqYjOcStc7CRTfGmLY5+84JIMCzLXLyT+RKaKb8FVhFZpZ7sSOgxiad
	bTpyEXGndGJR6pDL3JG+FVcH9kwUgoVeSvsUAguG9lw+cq8itnXVHcteJRDieUxUJjaSqQn6jGv
	sM+rXBfJUADvWJpr0Gqa0P0i9hw17aDsQt82cvyb8dV1MDqqaDdClfDtQZrPXQM5/aCXXFvjzo6
	kQN6kiTlEb5C62RwyHE67wPayBuCOIXEes5nGB/L3qnXIvTVKUdO3x/M08jtcE+VnMdavfZlH0u
	ZV4ZbHSaNP5Iyo+RNomL3OvyLgh1
X-Google-Smtp-Source: AGHT+IGSZ+5NVRXUnv/KzOU2x9ad+Bw0QjOj1aATkZqQoNCOlf3IOiqReQ6AqDastAbMsLDHFKzucQ==
X-Received: by 2002:a05:6402:43c9:b0:5dc:db1e:ab4e with SMTP id 4fb4d7f45d1cf-5dec9d58e89mr699583a12.19.1739400239363;
        Wed, 12 Feb 2025 14:43:59 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e02sm119914a12.3.2025.02.12.14.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:43:59 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 5/7] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
Date: Wed, 12 Feb 2025 23:43:37 +0100
Message-ID: <20250212224347.1767819-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
References: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Duo Module 01 Evaluation Board contains Sophgo Duo Module 01
SMD SoM, Ethernet+USB switch, microSD slot, etc...
Add only support for UART0 (console) and microSD slot.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v3:
v2:
- sorted all nodes according to DT coding style;
- added "compatible" property;
- renamed the new .dts not to use underscores;
- added status = "okay" instead of deleting it;

 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  2 ++
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 79b73a21ddc2..3a32b157ac8c 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -28,6 +28,7 @@ subdir-y += realtek
 subdir-y += renesas
 subdir-y += rockchip
 subdir-y += socionext
+subdir-y += sophgo
 subdir-y += sprd
 subdir-y += st
 subdir-y += synaptics
diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
new file mode 100644
index 000000000000..94f52cd7d994
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
new file mode 100644
index 000000000000..b1f8a5787861
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000-milkv-duo-module-01.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01 Evaluation Board";
+	compatible = "milkv,duo-module-01-evb", "milkv,duo-module-01", "sophgo,sg2000";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.48.1

