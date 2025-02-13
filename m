Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D6B24502A
	for <soc@lists.linux.dev>; Thu, 13 Feb 2025 18:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739470943; cv=none; b=Luptp5wolZHPQhgE/Qh8SJjUPSEOb7jYVApIuYZ8JNjMb10E3OC20yDxiTNN/rigtiHLTr6srjlRpWiK0sA8AbvvN7xgLq4cC1F5xrL6YR6miIg/VyuNbv82kCW2IzNm8QcUgBTHhL+tZFNa2228P4D1B2PPfFQQ3MDP8xrI9p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739470943; c=relaxed/simple;
	bh=6X3OK3wPGUXeLIYb+T5aPxe5dcHUnny6vLjCVjPlNRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B5NuWW8fpjbagDbrXbUf4nINeOtwVyNuyaHOgwjPzvd9Dv43PLpfMcJier6u1ECRf9H7RHhytVNHqMaeg8BxAfii4vpk6EiUBVWWOAXUsZXrOergbLO5qwig54V8ihQn0aTLS+jap8ROIfE93ynIB6qnJdniSd1kGBzvDVpvxqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxOI64JN; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxOI64JN"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5de6c708315so1774183a12.0
        for <soc@lists.linux.dev>; Thu, 13 Feb 2025 10:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739470940; x=1740075740; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/kT84H5qLfmytF8BSF9mlL2QfF0LoMNAWpygrqKleE=;
        b=RxOI64JNftEREQKQoPXhNSfa3jfeLefo6s9elsH53z332VFLTysNOM3igvoARSeQtc
         6J+3c2iefynL+flq1DwWhbYB1ny5CKIuxkqPPEfCytmVsuV1EgKe/jcCxMU65kzbLrux
         IzzY/KsHaLJo4MhA/b9BjQHokKIayUx1hPOpIh+oR2HCtINwwew2mJXNNdye2i9etcBI
         UGthlwSKsCD0YWezmrioLyn++BfYqADp+8nuqaUJ/YjLAqbX4jcpt1m7WUp9P12GM5XL
         FP60EtJ3WmQ0GgIBQv5ajUCX9SxTkKm6IlPYgjtSCiE1khfIZkpXhpsn6mvMuimis9jh
         Pd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739470940; x=1740075740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/kT84H5qLfmytF8BSF9mlL2QfF0LoMNAWpygrqKleE=;
        b=ge4CRjHkZkhmPYTSfQCg4WVS+yyMmLdAlfCcgiR0HCgPJZdXExdF/x39WaBt4IoxEr
         atEK6nXAAnRqr7qcvPER46BQ8ZFKnYpqlvAtsqHJMeAH6Zz1exRKTf6/MuFnJXyVhkTg
         YxQipf0oRZ4n2Bnq3YDKseyatYpf0p0dhjgm1973XahlpoCvw9TaC94aKpCtKVQZ7wwv
         5nKvCnT0GA2FtG/kuWzrfz5Z/DkeRpph0eM3FdSzOE58Qwa7XkP3HQ0KKHwgC5Hy8Y9X
         xGHGYLKc3wHFUdmzhfjCKUyBwg7yZlmORx+t3EcHQOesmEpAfqLWBYIIr60EgvQc3oDC
         JZ0A==
X-Gm-Message-State: AOJu0Yyh79j4fCwmxivSnXF+TZirbYVVvL91zLF0jkq9wv4G9qzFGrpa
	gHppsHkkuOVMpYHevR+RoD3OyvsRo+mTv38k+UoppYAqMNxaXyUCWwGS4Y63
X-Gm-Gg: ASbGncsbcNB3BCxj4lVbgvk3WSKre+TmSzImdiG/Zkv6haRf/MsS63b+Dlf2/kJXPOM
	y+X1+PKFNFl7CuVZBZvVl9g488Qq9PVB/BwHh5fFxMguACx4OMkrrDe5iyrXooGNh+NEMfsRc0G
	kTss3fH0PmaaJwt4FlDogS1EnfXu2QNxJ+pr+Belc8Z/9yJa4vUFx4OeZ8WXEll9/Xyn7DXvUqk
	jYnIqi0UTeY7pCbGCtLN8UMEqydhDTyk4b5oaBqy9nuQfJRpkNMzF2MG+PdCAj4CI1i/NhVL4r/
	xT80duYMgkw7ntUhHjleSxCfwpvK
X-Google-Smtp-Source: AGHT+IGGrGvhErjvZtc60pickMx2DJtsHlYMmMxo5AoPGkhiDOh+yM3BqjtVUmG4xl6q+XzV1ek+KA==
X-Received: by 2002:a05:6402:4316:b0:5cf:e9d6:cc8a with SMTP id 4fb4d7f45d1cf-5deade00a52mr7137331a12.20.1739470939543;
        Thu, 13 Feb 2025 10:22:19 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a66sm1559230a12.52.2025.02.13.10.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:22:19 -0800 (PST)
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
Subject: [PATCH v4 5/7] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
Date: Thu, 13 Feb 2025 19:22:06 +0100
Message-ID: <20250213182210.2098718-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
References: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
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
v4:
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

