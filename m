Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EA13AC0E5
	for <soc@lists.linux.dev>; Mon, 23 Mar 2026 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273120; cv=none; b=L5cnqEWDPn8sqgix/zh0fpV9R8+T7YRVuSCqFriCzckGXQ+WnRGXum13gm0z7FpOHY8wAgxleyYblf4cuUpzbsRZlrzJBlCXe9kUoe2I9fjEY9nsdQEH4TJKgEIE5cB9VQ3do+toYQMi/ewYUZwHnvHzXck/ecgxtTWD0B8m+3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273120; c=relaxed/simple;
	bh=twEAMEZQuHixVTy0TIBpDgrHMP/lw6YTgCVvQ+QbrXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aYL60YyVDS8nNHT9yNZ+yWl6BTg5ca2/C5J3IsNIj+SzqFcfqt5FZd2U9CRzSi/9cKtmEElP3xnyRDmvIfnpum7c2+QdM6IGSnhbilKxwvOuHibNZ6D36MLxxGu2WUevOUkkvvXUQCJNF+Zin1KpkjnbhCiVarS+a9spxiB+6Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9QqNCcd; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9QqNCcd"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82a646c96bdso3403479b3a.2
        for <soc@lists.linux.dev>; Mon, 23 Mar 2026 06:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273119; x=1774877919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCVrVoKT9G2CjfYu/PBNCmXq2eaEsPu9cALs8eUDlig=;
        b=J9QqNCcdSeRxA4MWlnYWdhHiOfFTi0+AtjwuBTRBQR/9re9Gywrfptsqs/pCARTfUU
         RyS8ep3dQFfHkU50x8SfvUKD1mwTakK+M/1MycAYviyYO+xgS2BvBoBwdaw3BlyFn2Go
         jltaLWSJ2TZNY2LeV0mXUYHJAhd4TsKzru1Dv8mzUoUapY5Yg8bD8O72YhDE7Lfy4WR9
         OsM0vBzmQqddayuGPPLpjuPSokXAP4XjG77/0Awj0BhZ3+i+nC6BVCS5w2J8JRKIpAHi
         z1o83PBx4MtKuT4e1LXqiVAV0l+t424APkL4x5XDBNaH9IyfpzPnxYayqCHsBGEDtToh
         d7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273119; x=1774877919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCVrVoKT9G2CjfYu/PBNCmXq2eaEsPu9cALs8eUDlig=;
        b=KEafhFQ5RZ+Y6jOp15QzRf+JJYc0IU6S1s64/tTfMpsTPxRq0Xqb5PLgc6cU5RahHu
         xpk3/VDGxnA1twyrRsMh3p3Q9Pw4wsqbo4TK1BoozE9JITbCyWkQJ2ppM2XE0UvuEeeI
         XwT+2eJOXlgu2JEnh6QDblpbmJBnCzUt7HWttFf6dP9a33eMhd2oo+onYty6SLuFoUqy
         KB7P/4+q0zIWHTsKR1FOqoJMK3EkcVMBfAv1an/qtKgymZh0mF+yAJXVXpeov5KGNnHN
         pPK6Lb6CjtQ9skjpqaYjthcPSnYG70ykv+SSgeAZic46I3OTf6AgUgOxKHr55K48rlyO
         yC5g==
X-Forwarded-Encrypted: i=1; AJvYcCUCKi7YhuHL4QLg+83pal2PRCqYz8R/KOJdqp/l4o14mnTo74HIMs9ccf8lDkCNDmNo/m4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ6NRiWbEd3OviE3uRySofD2PPaZdBfI7uPQP2J8bGdlpJ7Cxz
	3s5ECtKUS6it5xKNRMJRpOKZ6Lh4rmW+VNvWocihmbrhHDOsPR5tpzWV
X-Gm-Gg: ATEYQzxK0QEvDPtC079oekEmrs2rAVewoncPbf03b9CU4xZZjquKAmluFT2UfVukz/1
	rHR48FrldhB6vVRFEOO7hHnQCupoJ2LxA6Ttjn8KP+xP8BWqcbPuE94xQmo0L+UamiLXwOdIvLJ
	NuQWUdYZDIYDBqfOQCOwFeQ4Ju7ZS/yJ0U73b2QcFNnnEXXIU4K2W/Y7Lb2R6WWU0J2tjLldci/
	xvnueHAmkQFjwEY3Lmyqy3oSIoBRQG55B9kd5ymbecY/xyzACCr0hh/zn1wvcg+7g2mqq2CSMD4
	Dfh9zmlv023V2lWQWxcCzVI0tz0WfB7MFAn356v2xe0F+cdskrGFXDY3GrQUhZ+8EqaBR1ZApnv
	L85+75c3lA82eLxnxXYmaQG7vgZSdL4pgWnOyNMkVZPnATDV4NHn8B0QzBGEc9R2yvZIYsaZ22Y
	U5RpQC4dqf/6Et3WZxxf+/jiv2vjahh8Leh5CalNUs1etZCOE56dEiWMFZBQxIYhOiOWI220mqg
	+Y=
X-Received: by 2002:a05:6a00:13a6:b0:827:3b1b:43e8 with SMTP id d2e1a72fcca58-82a8c22d99bmr11433015b3a.15.1774273118883;
        Mon, 23 Mar 2026 06:38:38 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410b1bdsm12069224b3a.57.2026.03.23.06.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:38:38 -0700 (PDT)
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
	m-chawdhry@ti.com
Subject: [PATCH 1/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
Date: Mon, 23 Mar 2026 19:08:08 +0530
Message-ID: <20260323133814.14152-2-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260323133814.14152-1-krishnagopi487@gmail.com>
References: <20260323133814.14152-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the SPEAr Thermal Sensor bindings to DT schema.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
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
index 000000000000..125632163911
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
+unevaluatedProperties: false
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

