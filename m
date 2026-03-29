Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBFB2BFC85
	for <soc@lists.linux.dev>; Sun, 29 Mar 2026 06:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774764949; cv=none; b=pLEhpR+NU4NCKP2ppACCMGKF2/zPkcuAN9hAYeNBTm11UbFAYBDEXq9bZxzdb78fPdveT71jYxqzwg9QpuMERBygsWwHESJgyYteNqkJNtmY94tIV1t0aX648qyG3Mbc1Pm41RgmDjvr997xnrgvWkf4NzsNkScPxrFHxiJll34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774764949; c=relaxed/simple;
	bh=2otHkcmCT9w8sLLXpwrGseCnidGp/GU8lh5rUN96wp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XhmZCcevWdPT6Fco5f84NLcRDMHTNS9k9aFHBVbyyJVxFfGZlfqfomTXad74lJXT5pFslhxF2VslcUDNJ5eoV6d+qW42ea47QBjiYlsd5Xrt8MpiOW4il5GLh99jlhIQPWlsg96bdQoQKDqFLH9ESMb0vPAKQQII+maT7/HXgk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etI7U4S7; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etI7U4S7"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82c20b9fb15so1576106b3a.3
        for <soc@lists.linux.dev>; Sat, 28 Mar 2026 23:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774764947; x=1775369747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyUhv8dZe5OountEy6t4pKCcPVDlgAwS0iiOUhBetOM=;
        b=etI7U4S71mP6QgXDdMBqKFxrRmfpPWOBIffIkN0rLdVdG9YPmRj4PvzOkME4dNDkdG
         2Ltl1zqO/Z2qsd3pClL1PLc3QEYiHMOUuYhA+Exbub2v0khM0ckrHwlnvhTI8K253mUz
         dGcKhQ6p8AoRJtPckIicmiY04YDER8+VO2AnSxsASp3Fn4jehYlkdu2SQzxJlVTgSuzY
         RtFsT1RIq0BabPeYTHt9vhRv0DDZoKpLTzNDeRsfK+crfJulhAU4Ij6d86WCt6OXgw8a
         VoXfEKwVZLKLJnsbpwU4Nh1w2fxtbKFelDWzr3sOVNf+opzcY3bE/vN4XlMSqEj2rEw9
         eiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774764947; x=1775369747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PyUhv8dZe5OountEy6t4pKCcPVDlgAwS0iiOUhBetOM=;
        b=UZ/Nj+j/3bb8hgP3FfpyH6EXfGjrA9oV8QqsOJxqkWtBGZSJpllJjj0gLew1cMT9/y
         8mFQfFiwdMewT4Q24umUKeQJUQk16vz/YDcp+0XYF9w+l5OgSZuGxKpgUM5KsKD+emdB
         mHzmR63xbirJr9Z/iiE3yTOi2cwR6RPAF3zqodueHnkyBtwigcw77e3mgizBtWkXzWnj
         bIrwkFycA5t3PrhT5FGVsFdpVXXRVjIaHp3pTRnwog3xfZgikyOCM/hHsrv+xWRwe13Z
         VIT9Kqs/pzSs38nOnX462wjZVNkhvQUYBWwPAdTjXPyuk3LU+pV4g2wvklaUc+5ksiv2
         ajSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdXFUPtsam8Je+7j3ccIvTpR255q4qJdSrCFd2J1pNWKLIKzzH1qGPaQ6LZVhwkvn4Tj0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzpciPd86JIrFg29uTcRdR5mPqKNX0McBVZ4E8hEts2yZd11wp
	U13Y5WQYw+JIzU7jHalmkMwHajKxp1aqJod4Pbq1ubvxdTIN9FLFYiFD
X-Gm-Gg: ATEYQzxp1tnJChW9ShevNjhUsi4X0rQchR1ddlif750vH2OCSRW0UQN7JCqnvXNxdC5
	4X0kilTNfjy3BRD41lpM1QkgDSk+MDPnvynwO/Wd2/FoQNj5kQktH4VFoLDnjKIzGrO8opDapKm
	M2TcwJpbPlb1i8ZfVv5miCKui263cixnkLu8d1cQG858isntF5lW2QJcJ2q8Bc71VmQEiRm+EHY
	Y+w0J7HnzO83v/wVwaOGD/Wmte0fw7UzzGKZ9dXyr5SQXpYd7cUUwjqTU46IpFx0nPyw1PORd3D
	btY8sgJIspeldjJa0It5q9/q9yNKbBBa/wcZrrANhfR4dyD6iEIXvMhxAOCYK6q5lkK0VNt2DdB
	kiIOZ9niLCeRcPyzCrB59HWP9CuxGUono7cT9CCcZCLh91bROz5pb5HPIC8hcSMjumqCVbTi3RC
	ZYB50G7U4gSGLWAONLZBboi9/V40mwhOue9kassVUx/B4JpSdHG5G17ZtM6wpne7qru3KmVP3rN
	FA=
X-Received: by 2002:a05:6a00:2d27:b0:82a:1337:493c with SMTP id d2e1a72fcca58-82c95e9559amr7945631b3a.14.1774764946822;
        Sat, 28 Mar 2026 23:15:46 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8436f19sm3709731b3a.9.2026.03.28.23.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:15:46 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
Date: Sun, 29 Mar 2026 11:45:19 +0530
Message-ID: <20260329061523.98346-2-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329061523.98346-1-krishnagopi487@gmail.com>
References: <20260329061523.98346-1-krishnagopi487@gmail.com>
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
Changes since v1:
- Changed unevaluatedProperties to additionalProperties

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

