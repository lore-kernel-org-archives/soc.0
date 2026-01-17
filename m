Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72DB27713
	for <soc@lists.linux.dev>; Sat, 17 Jan 2026 18:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768674189; cv=none; b=T2Wt+UaA1IC7FNzUNxB5Dq4I6sPkeQs66ekfC5kCc5rwJfJhxQQb0RLFKOjlXLfNgOJIRgcIw1l2s9bTFsUOf1GAUL/E72i/RUO4abflueLAVu+IA92960vT1T5/xRiK8qhaQV4hf+Vg1Ubjspy5F2FO51gRPfP9RC/rZ3y9204=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768674189; c=relaxed/simple;
	bh=u7QmeV3MgA49nqDTEIXb+HnMhUm1Hetj6GkCKMuLJXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WAt7aS+1uOir7A87mOded3/sMQggkrqvKZjmuGPXiNDONTT92B1CRgoqJK0IX0eme6b/JDSJLBkO5PROIiZACqD3qbnXIeVKRfCA7lXmWLHH3oy2mEteyo2PajU+hNlbf9topOWR82wI8TR7PLNG8snT37TKpQUUTtI6pTgnQ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FaCkhWAK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FaCkhWAK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7F6C4CEF7;
	Sat, 17 Jan 2026 18:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768674188;
	bh=u7QmeV3MgA49nqDTEIXb+HnMhUm1Hetj6GkCKMuLJXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FaCkhWAKvVTE+9wyOM2UcIePfL42g6ujHyc24KSZmm455ziEwQBtOCy9HjVGMc7xa
	 XbnMtkOACqar+vdAMqo/CJgo3ndd7oLLJFYWEpN64aMDZ5miGxfFNT3sV5GQlIQQmW
	 r0bwOd8OeljtPWEm6+gBithPLDocNpT8ZXq0xOYnwucsTA4F1vPPsPAvBVVuyoc0mV
	 xlnJtMauL9T/9ReU302Z34h7k+MfT64I2DnII15TN16KZynLuhSRV3mTUsdk4y5r+T
	 VCZQUyEvHbB4MB6RRWhKYQIbz5FBdZxoaVQNZ2eqQjPecxyfI5He/ZxyO7Jjz1mFaX
	 l7e27KC1z0KMA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] ARM: dts: samsung: Drop s3c6400.dtsi
Date: Sat, 17 Jan 2026 19:22:54 +0100
Message-ID: <20260117182257.14799-2-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260117180406.9361-4-krzk@kernel.org>
References: <20260117180406.9361-4-krzk@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616; i=krzk@kernel.org; h=from:subject; bh=ylTgqmmRvfVSt9eN9IoK27dTlZZXkKoYoySy+f/pfwE=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpa9OBk+oWrmvtzuiYuIU/QTFOBxvt31O5eGF6a xs8IpaBa1CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWvTgQAKCRDBN2bmhouD 19wcEACQLG/epGV7PxjaxqzTD9EjYUekNDwgB9KymbWpwNVlbWQ/wkbTQXc9YMld8EVdMIj6YdJ 7bgaumWkUEh3w0Vvt8m7KWe0jqqycHJ6bXDiJ+dS2GctHl1NPkR+Nav+0bT9QTo6Mlj8QR6y2/Q AGvocMIOqlFWZqKn+e6FANfjKqNV/oM12BUGfeis2PqlLGnLxnjCmA7XQNaEHdBx87Laan4bpKx P66A9E5K2s6d5VGH96Ms81sXwP3GG/18RIcWHkZKzufgnGg31CLowdNqZDRUsGEJM/U7KfaDFOA c/MQD5iyIoXhL7852etgLdf5jQIUHh6LzH9uTZPAD9Rf2jW6uTx5MJNM0Tt2HXGoAkILsD4CCU0 P1bRKazSlvUwkJ5tumGmcuvWwBLbfjZ/5RrbaS/kkP2+WzIuBSNPXrof8zPW6W8oAu1tiOOj1jC XD5bjDlqotDu6hdrW0jeRw+yU9D/PQqezN7KLNndYjTV2JqIfMKNakNqQG8E+zcLbaEsyTRT6PZ NTtA0Hy4p7tyORfmFt81xUpYHF/Xrc/axelhUAjH/aXZaZyPf3Py/iYa0fOyGeyLrXk/mBGxu60 xlReajo98sPl7Fo2fgNtqBSJKfPEDs+ZrYj+iW50Acs6vYlANYxByYesbUtWc60rLH/kP8dt2jD nm+ExDrO+17vIgg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

From: "Rob Herring (Arm)" <robh@kernel.org>

This .dtsi file is not included anywhere in the tree and can't be
tested.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Link: https://patch.msgid.link/20251212203226.458694-7-robh@kernel.org
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/samsung/s3c6400.dtsi | 38 --------------------------
 1 file changed, 38 deletions(-)
 delete mode 100644 arch/arm/boot/dts/samsung/s3c6400.dtsi

diff --git a/arch/arm/boot/dts/samsung/s3c6400.dtsi b/arch/arm/boot/dts/samsung/s3c6400.dtsi
deleted file mode 100644
index 7cc785a63866..000000000000
--- a/arch/arm/boot/dts/samsung/s3c6400.dtsi
+++ /dev/null
@@ -1,38 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Samsung's S3C6400 SoC device tree source
- *
- * Copyright (c) 2013 Tomasz Figa <tomasz.figa@gmail.com>
- *
- * Samsung's S3C6400 SoC device nodes are listed in this file. S3C6400
- * based board files can include this file and provide values for board specific
- * bindings.
- *
- * Note: This file does not include device nodes for all the controllers in
- * S3C6400 SoC. As device tree coverage for S3C6400 increases, additional
- * nodes can be added to this file.
- */
-
-#include "s3c64xx.dtsi"
-
-/ {
-	compatible = "samsung,s3c6400";
-};
-
-&vic0 {
-	valid-mask = <0xfffffe1f>;
-	valid-wakeup-mask = <0x00200004>;
-};
-
-&vic1 {
-	valid-mask = <0xffffffff>;
-	valid-wakeup-mask = <0x53020000>;
-};
-
-&soc {
-	clocks: clock-controller@7e00f000 {
-		compatible = "samsung,s3c6400-clock";
-		reg = <0x7e00f000 0x1000>;
-		#clock-cells = <1>;
-	};
-};
-- 
2.51.0

