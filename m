Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106F122F17D
	for <soc@lists.linux.dev>; Sun,  9 Feb 2025 22:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739138834; cv=none; b=HQ37FHruolMdfkR3qV8JHpO9w2Kjl8o9UAwzieUC7W6zJZ2K5hsh7r/Zk0DUKQtK5cYQsUxRrdmPApFsF5kORXi4brVp0nEwGMWPeGHOoFWNhvlNKjq7P66JtRsXURPwUeXTIm4mC8ZeNRVe9VvvyHXcIebD8N23kwSqe5KumXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739138834; c=relaxed/simple;
	bh=7ZAGvUrrjx83yvWVf8ubIKKZh58Hvm4b115PNTRbOXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edLgR/Nhl16cYXcR1e8RXpokCKQSL7KB9EPDNdyJ+5oYceCE316cBQgZl2mSfFsHV8giycIlk72sk/lFb5T3Hi5uI6hOiT1aQnIBgQCjFtU2fyLAvwjC6p4y1qNpgC0N4Htm3Ka7MvpRH8DWpzDZuPteA0eE2NE8wi+En9bpBVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQzZdpJ9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQzZdpJ9"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-439307d83f0so7329335e9.3
        for <soc@lists.linux.dev>; Sun, 09 Feb 2025 14:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138831; x=1739743631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVSwUzYyCuH/0EmC09Tuh6m4O6FbPIf1eRFL1KmeQ8U=;
        b=MQzZdpJ9ty9q7WzI+RKB5mMuNlBJVCDLK5xoUNJ4HD41tPvMqLNmsKRISIE7O6J0y1
         bIBVmlNGBB0EHvKwi9y0PAr0pqFDRJV5jQmGoILXAjsQ8VOBTL/Gy+7RXF4jbScTYcVh
         +oz1dFjgsvnZythMUy8kwW0OXmNZnxvl4iBl5snI/5Y+6Dj2dwZQjnjeVeuE+c/g9G2y
         2Z4JbDbGUHtPALK//ZeMricLpbjQdkUbdPjvHcHimVHTFjdEr2vOG7lfQ7c4nHGndJEV
         xngTqjsGAk+IrmVtPULTqzUdKMAq/KdlWURzyne9i67BXmzd/jo9Fet2u4ZYNcvmy3ig
         evhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138831; x=1739743631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVSwUzYyCuH/0EmC09Tuh6m4O6FbPIf1eRFL1KmeQ8U=;
        b=g3E5PkKJ7SZkIoCojXOmWfeMo/QP2Tgi0Nvqz6kNDLxO8Fy6NOOQ58gnCSLOhjaA1Q
         oZQP0c+P7DA60FlEzsmCNYnNn2gWdU0ckfdGvRpu6RAwTVF5pw2z3IyA3nHvJgcVXMQ7
         hLnwZVwWh6yIghgLg44DFxPq3VUkounsLuPRZ1koGVJ2cz7c/8ocC5b6VsckazKYx/7d
         WKYvVHl2IYcYIADrGUZNKgp9Y7kvjjPdEYYky8trjgIr6wLO/2PTWMLfC9WqA3EzZD7B
         G9vE70NSKBLvyVMTctAAXEIMwl4AOow+O5U+KxmHqad/FzKHIaXKOjy+vc7ZHwKWkDag
         gnCA==
X-Gm-Message-State: AOJu0Yx5IEupni1/LfVOe5C913c7BmZxFT6/qy8V/+lLTUJIqflf6mEY
	vbi+dPjtIuQKAF7bxQSe0oV7PY09ey2QihutOxkFzSA4uRO9QtEoFvEekSWM
X-Gm-Gg: ASbGnctFRfBcqDL++ULmadkibd5VJEKdLAAITl5b6519YDj0vruh2Myy64LkqMO+cvx
	xyqgxLZJl5R+HBxeIAB0PFImS/eDiWdcdFEUk/GvDAiGpzRdCt7xJbfCtbCYA0vIf9/QiqkuFVK
	2QIEg1yrDI8hevYrFsN+YNqWnpmwYYxNNN9wpX9PohK6cGnK0v0/j7jO8giZgl38s9Wdw2AtYtI
	ucv5a7dOKGdYR7OFG1whyXJ7i3+yZwH+WLqryBxhZKjohvkXMigdTpt8UzWqhJFycSGB4lSdpdp
	cZr8BNIgyRdfD1u/U3Ep7gTwKhmK
X-Google-Smtp-Source: AGHT+IH5vVna5qsuNt4fQZwckiVpOEaiuCCrF2lXcmMmNlYOm+Z+9AtnNGM3IMnM6VxBlfyTkVsF/Q==
X-Received: by 2002:a05:600c:8705:b0:439:41dd:c061 with SMTP id 5b1f17b1804b1-43941ddc2a4mr22063795e9.31.1739138831167;
        Sun, 09 Feb 2025 14:07:11 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:10 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Reichel <sre@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH 07/10] dt-bindings: reset: sophgo: Add CV18xx reset controller
Date: Sun,  9 Feb 2025 23:06:32 +0100
Message-ID: <20250209220646.1090868-8-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT bindings for CV18xx reset controller. The power/reboot driver is
going to use only 4 bits from two different MMIO regions which can be
potentially used by other subsystems/drivers, therefore the resources
are not being claimed directly by the device/driver, but via syscons
instead.

Link: https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../bindings/reset/sophgo,cv1800-reset.yaml   | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml
new file mode 100644
index 000000000000..4f058f99df5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/sophgo,cv1800-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cvitek CV18xx/Sophgo SG2000 Reset Controller
+
+maintainers:
+  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
+
+properties:
+  compatible:
+    const: sophgo,cv1800-reset
+
+  sophgo,rtcsys-ctrl:
+    description: phandle of the "RTCSYS_CTRL" syscon block
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  sophgo,rtcsys-core:
+    description: phandle of the "RTCSYS_CORE" syscon block
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - sophgo,rtcsys-ctrl
+  - sophgo,rtcsys-core
+
+additionalProperties: false
+
+examples:
+  - |
+    soc-reset {
+        compatible = "sophgo,cv1800-reset";
+        sophgo,rtcsys-ctrl = <&rtcsys_ctrl>;
+        sophgo,rtcsys-core = <&rtcsys_core>;
+    };
+...
-- 
2.48.1

