Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A377A328B78
	for <soc@lists.linux.dev>; Wed, 28 Jan 2026 20:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632512; cv=none; b=P9Pn9///ttLnlgSD0YflGF3n79FaP2hhdEny1POiOoTBBCehhel81Hl93AoWc+huPvdtsL79lSs8O5Spa8c03vm/K5GP2uBEDodh9iVzCwJ9HS0dJgxJXUhD9zxPliy+oltS31LVXmBTE6CiEXxbo6hLU/Eg3J6sIABSJWCsx9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632512; c=relaxed/simple;
	bh=iggV8d3WfXjkrrA3RmwCsZVXRL+qAt5H1IqZAqIoNXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VaFdCo5I1ZYe9nk9BmD/W37d8JUxL+WD0qOpB75fE4e4eVt46CRzCK4Vjbjt2xNeYRF9nDr1lFnQcipTyYr6eDCX/8//kgtRdEl63hK5hotuBcePbSiRiTa4M96DCA2O/tq3eeexajECGw78+RAdCzrGWGdMGhSvnsbM2+6K5qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b57UR10W; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b57UR10W"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so216205f8f.0
        for <soc@lists.linux.dev>; Wed, 28 Jan 2026 12:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632509; x=1770237309; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lnap5JnTI2lL7PQO4YFS2y5PBzrQWIZi66+sIvKDZrg=;
        b=b57UR10WmEg6O2mtHus+MylgSNN6XkyBMq9wnKjdyw3Bcw4qIVFDUIMUANdEznTgDD
         h8OEmW14tWx0HFMFta4TwpO6JuI/tFojnvbueUJOmRYRd1Cdb26KzZAivnElpVZoGv6m
         yCkfvQWvMVtLZEfuMqeWLFhULNM22ovIQoORrtm2DWNEkxsFjzHCqKf3MKG63J8ttStq
         +V3q96zksXu9iOySB5GMFY4LpeFmLgn81+VTexHjklNKc4wRaaDKeDvS3iSHixuUT1xW
         Ivl0OcG4Fc2agh/QJdlT1mVpegkH0rm/xy6686zlQjrRn03ezz5S3MddXwQ/SQ+PL2M1
         tP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632509; x=1770237309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lnap5JnTI2lL7PQO4YFS2y5PBzrQWIZi66+sIvKDZrg=;
        b=Bkc3z5PzuyjPAadEFZimRFjQv8nltqBzVITZNjzWOw2VC/QfQv/femRSI81lZFQbT4
         yjcbDXFBApDoR1j7i78yCSK7jF0AszAmO8Sdwt9mo/Hx8XXB3WgDQ3xwArx4YA3TbkyN
         7sYiG73bFHPUcWpegRzmSGpXajqwkcd7DrXhhs/V6CKBVZ/h+GraKjLJDCgRopl5dqeo
         K2rUycK17u2DZ+JidbIzWSXALLrTDxgvYmg2yyMbIfp2XglGslT+jVDbNoY4MINDm/kY
         Zza9NCpOTHIcJi65rvnDg6M0pR+BEqimUnX+b68y429KhYytKYQN6Ys8lC44Dd9Q4nMR
         lu9g==
X-Gm-Message-State: AOJu0Ywz4CAaW/5lAp/tOZcdqdX1ovQ3lncJfTTmBA6QjxUEhv40XNfS
	H0C03ZZfL+dAY8oV4Fdc9s3eZFocrKzyOxAwwFDjM6lD6e2ZJe7s92ru
X-Gm-Gg: AZuq6aJrT8hH+KfDEsJ9edz1uwKbjeTd2lNeJ+s6K4hmn0Dhdi1Ii3FYF8XK3DXqJ/h
	JPpNlUci1SThSFKSEHdSCP/Gid2ou2HK6DB16Nk3NY3HJg1NsjXIjNhb8QrlnPLcvFO1WWaVZ7x
	/ITpx7AFq5j9N/GqaNVJW8BA0iaJ8EtzToaVdvyhZSnlAhg85M261hlHej7BP4AcyNmjwphhWRW
	YmS04a/bUPe65B2MGAY9T9f3mF+Ei37BVUIDAZ2Y8S7Mrcks5fvqtlI6bmXhY6k9SOPwRJo0mZq
	EwzsJ91mQT8/OPY8ZJXodaMEqfMB9AcMgc5f+kCldu1+26jPtisuKtkmeInxZUtWHshwqPR9dFX
	Ql51JvkNO97nO6hHYgCUYJGn+TT/QImovGx6fekvmHsRMSojgpuQwJf0pE8hJLVMV2rDRMi0Xxr
	4KBJW9d4QWaNE9j6/EjhaxjLn0
X-Received: by 2002:a05:6000:2310:b0:435:db95:c2ce with SMTP id ffacd0b85a97d-435dd1cd844mr8572847f8f.55.1769632508761;
        Wed, 28 Jan 2026 12:35:08 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee04csm9577644f8f.12.2026.01.28.12.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:35:08 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev,
	linus.walleij@linaro.org,
	Jun Nie <jun.nie@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Drew Fustini <fustini@kernel.org>
Subject: [RFC PATCH v2 3/7] ARM: dts: Add D-Link DWR-932M support.
Date: Wed, 28 Jan 2026 23:34:51 +0300
Message-ID: <20260128203455.38569-4-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128203455.38569-1-stefandoesinger@gmail.com>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This adds DT bindings for zx297520v3 and one board that consumes it.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 MAINTAINERS                              |  1 +
 arch/arm/boot/dts/Makefile               |  1 +
 arch/arm/boot/dts/zte/Makefile           |  3 ++
 arch/arm/boot/dts/zte/dlink-dwr-932m.dts | 21 ++++++++++++++
 arch/arm/boot/dts/zte/zx297520v3.dtsi    | 37 ++++++++++++++++++++++++
 5 files changed, 63 insertions(+)
 create mode 100644 arch/arm/boot/dts/zte/Makefile
 create mode 100644 arch/arm/boot/dts/zte/dlink-dwr-932m.dts
 create mode 100644 arch/arm/boot/dts/zte/zx297520v3.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 0989b2c6c157..2682ad06a0f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28395,6 +28395,7 @@ K:	zstd
 ZX29
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
 F:	Documentation/devicetree/bindings/arm/zx29.yaml
+F:	arch/arm/boot/dts/zte
 F:	arch/arm/mach-zte/
 
 ZSWAP COMPRESSED SWAP CACHING
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
index 000000000000..b38b0f2bee8b
--- /dev/null
+++ b/arch/arm/boot/dts/zte/dlink-dwr-932m.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
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
+	compatible = "zte,zx297520v3";
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

