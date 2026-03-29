Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5755E36B05E
	for <soc@lists.linux.dev>; Sun, 29 Mar 2026 12:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774787713; cv=none; b=CdtaURYRkyyWA67RvgBK2VD5DfZ00fIOfR9yGriCWCvSuYYf281qfjOEx9pemdu555tsTJhBIkGpL5M71VV8tpo4WVy21mp9YWZmmKQYJb7F2VhRRDvIwg2zMMqR2T1CvgL2V/jbFUi9ZyHjZsO2mpkSj53XG9ASr1xhqL/X7tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774787713; c=relaxed/simple;
	bh=Z3qCgdReWQ1prJb0XmYEgTOQ/bvofKyS6Un91gtBtJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hFLL3H8ZKc7PPfwga6J0ZPegt2VUC+QcrqXy6uerXQP5zMu9O1uGwQ2vwRU6rzTKpE3qFP0gRtymBzpC3mFJI8chF9EJ0HCs5V1/C8U92ceKHd9yQ6aepuxy4CT7jVxoncrYevwy4fooFCrqqwTXTH/Cb7XrnyqrXL9Z3DRFqaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEbgO0a9; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEbgO0a9"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c742d7c8acfso1580056a12.1
        for <soc@lists.linux.dev>; Sun, 29 Mar 2026 05:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774787711; x=1775392511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tLsn8hpa4BdCwst8VwbSLWHz/M72CzfhEMC9Z3GeEs=;
        b=NEbgO0a96cq0UHQndbecuw9rVeQe0rD2ZJ4gHQcTuOz68Px2fOntam09zE/XA6QaUx
         7Xqml8ppSmWXSieGUfkmI2FKX+VrnUzEdVqUxyHumcfpe4IBizKj3yppYWSTARLKWfiq
         jxHRSI67H54MI/CJ3CmwTz/P2Z23x0CMmjgHD9w59WZ/ZE5RDX92CHHfGX6PTnZAr6hN
         VPego4i9wh4Os/dmsEL8hlPVJTWdkZcTMdZg34anOyGLrkt4dqXrl3DA/LLrw2IG89LQ
         HKZvKWYNPNAwinpuzatYiXAGT84mLy7/bNSmPJIWhVI/hncYskpU3AysgFCq7mY3Wpka
         /LVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774787711; x=1775392511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7tLsn8hpa4BdCwst8VwbSLWHz/M72CzfhEMC9Z3GeEs=;
        b=kj1qD/fL3nCa6gvqzE7hFUPKw/zv7yCCqkRlL4CxmWSfm4hVK6oFtkNS8RecQz1vtF
         AfQbG9CNMnudYEJfFsyYOqAwXr14aTQv0Hmtpe6g38GOAquw6ot7KKFS+JNsRbnpy3w5
         SVEuRevhFLALVIdTpfcHhpFfTptCmJf7+yuLLdjERGugq5gaACpF9MHarukFVDJQSmmD
         uzSDYUnWhwoerMVPGLtWJ1p/trPYk6rQmbSYLteMfa1gpP9iVDeH4/XxmGbIdBKrNbBM
         qFcdAStx/V95w8jv0araBIqU+FWYN2+KJJOzLCrQPb+tqvd05tvej9bBRXKlE3hO76zi
         LBmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+SwBgfd8s7LoUjljWUSoBI/6TmZdTZ/DwTOyHOsipsRs44Xbt4JEsEno5gYsquDizFj4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLn9ONr+JnW7akYk0QWaV5UiX8MQAiKmnbp0ye7aaAJgL8JbM2
	1ybfBPgtIjxtS/eqDK1QmwWPzBPimbdule2675kMi2yUqlQud9rzAu92
X-Gm-Gg: ATEYQzw0WPJoRxuugosvOezt7x2uVc6vwxfHA4yaoPiVrxRjmPP5bSJyHCaDmf7KHtr
	9Dx5nAqbMr4wIrdGAEkxlwcfXYWVuSLFHJ6NKU1CDY41wjAZ2CBTK49UXi2/0SfQaGO+QJDl8+o
	XfWgrUmRnDmhb8bQ2iCE+MbiKENgZBXdFVvaenHq8RyMTsCRb6GM6fZgON9EkosquAeDuKv+h39
	ZKdOE83hkevVnMznGzgpVTf0Dw6UdVRUbcCPoqWAn2pFOs8FUQtU2aRFEIaFzuveGQmoVxdhuac
	ZIMD5lN8eB2MmEOXx/MuIAoMPVKTBex6+eT6GvaPNBXx29vgrYXlIrDH11WEoJUPmOpmG+zF792
	Jgv60LrlJIyy4Blsmlgljkrf6mZpEkj+eJ0lN02XYrxfTA76tR/WrEnc6OZyVr2N/koxfM2u0rk
	YqDoms9ycWu+yl0IMz6nchfoIayCSyGkwpuRBGz2zCJHVIznBIX+hyAkXF5i0acnoT4oChAeuwx
	as=
X-Received: by 2002:a17:902:d588:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2b0cdc48fbfmr101671395ad.18.1774787711463;
        Sun, 29 Mar 2026 05:35:11 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427afbe0sm58709665ad.72.2026.03.29.05.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 05:35:10 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	vireshk@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
Date: Sun, 29 Mar 2026 18:04:43 +0530
Message-ID: <20260329123449.309814-2-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329123449.309814-1-krishnagopi487@gmail.com>
References: <20260329123449.309814-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the SPEAr Thermal Sensor bindings to DT schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changes since v2:
- No changes
Changes since v1:
- Changed unevaluatedProperties to additionalProperties in the binding
- Reword the commit message and subject in the second patch

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../bindings/thermal/spear-thermal.txt        | 14 --------
 .../thermal/st,thermal-spear1340.yaml         | 36 +++++++++++++++++++
 2 files changed, 36 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/spear-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml

diff --git a/Documentation/devicetree/bindings/thermal/spear-thermal.txt b/Documentation/devicetree/bindings/thermal/spear-thermal.txt
deleted file mode 100644
index 93e3b67c102d..000000000000
--- a/Documentation/devicetree/bindings/thermal/spear-thermal.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-* SPEAr Thermal
-
-Required properties:
-- compatible : "st,thermal-spear1340"
-- reg : Address range of the thermal registers
-- st,thermal-flags: flags used to enable thermal sensor
-
-Example:
-
-	thermal@fc000000 {
-		compatible = "st,thermal-spear1340";
-		reg = <0xfc000000 0x1000>;
-		st,thermal-flags = <0x7000>;
-	};
diff --git a/Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml b/Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml
new file mode 100644
index 000000000000..e3462a974691
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/st,thermal-spear1340.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SPEAr Thermal Sensor
+
+maintainers:
+  - Viresh Kumar <vireshk@kernel.org>
+
+properties:
+  compatible:
+    const: st,thermal-spear1340
+
+  reg:
+    maxItems: 1
+
+  st,thermal-flags:
+    description: flags used to enable thermal sensor
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - st,thermal-flags
+
+additionalProperties: false
+
+examples:
+  - |
+    thermal@fc000000 {
+      compatible = "st,thermal-spear1340";
+      reg = <0xfc000000 0x1000>;
+      st,thermal-flags = <0x7000>;
+    };
-- 
2.52.0

