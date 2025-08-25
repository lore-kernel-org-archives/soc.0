Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8AF24CEE8
	for <soc@lists.linux.dev>; Mon, 25 Aug 2025 13:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756128342; cv=none; b=ZHURNGT74TlLslC9S9tzaiToT1lNZuK3NUUczt8ueJTjMPLTOLVoZUH7GD54H4kdWXGtE52a5ExUlSsIltvXlCX3LfvJXfr4R+EZS//dzo6qDU79qAVntyWpMr4sgNYGLAKIASeJS1Q4t93SfvCIK4Ua1/CutDTGpAxbTaHGZx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756128342; c=relaxed/simple;
	bh=VHxoa7I/FIi/ij2uzPbE4SZZZKuO7oiVDCJcaT1pqbw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kYlDhCacBqKCrWHModtv1oqyVMf0mZxsx6/UAsecU/Hm3Zgw7oArH44Mdu6HyWiVvxQncIzJjBgFD6KCyMI+KiMBhVoKxxZATluwn+bZ0MbP77RCY2SOi8OfJLwlHfdXN9LiamPdoRNp/9ko/jSqnI7Yd5DE5UdG8YrjijkoNc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=pXz7koPH; arc=none smtp.client-ip=216.150.161.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="pXz7koPH"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=2221; q=dns/txt;
  s=NAESA-Selector1; t=1756128341; x=1787664341;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VHxoa7I/FIi/ij2uzPbE4SZZZKuO7oiVDCJcaT1pqbw=;
  b=pXz7koPH4JcRUrQHVFZLKnrK7Xwy9wRd4fFYZ5YZcXt7/ftsx0B5Sqyp
   ytS521mnuPJFclpIpu1pVD43eD9rb2NB7yn8j0kzrKcECfVkv1jSvMjuZ
   9tJhU3XBTtqvJiQCsmv5fvtQQVq03ld3tDiLBfOIlRI/WbHZQgSUt6M7E
   bUWyf/Z1R1p2m5vP5bkxVmIw8E5mSOdM7HunJOMWi0yKLwPuvX7XS5LB9
   6GLemevLK3lF5j4yKWynGv+Up6/I2WxdAv4G8ZQmyBnW9Sqr49p/3x3rj
   9suaeKkiUoi63qOp/Qth5+mXEby6m3LBGxFsgSwz0EMJHBTi2ZyEs0Nq+
   Q==;
X-CSE-ConnectionGUID: wnsviHZZSSm1nXPTAz33og==
X-CSE-MsgGUID: xki4H2rLTfGKvWroSj5uWw==
X-IronPort-AV: E=Sophos;i="6.18,213,1751263200"; 
   d="scan'208";a="31950007"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa06out.arrow.com with ESMTP; 25 Aug 2025 07:24:32 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 25 Aug 2025 18:54:27 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH v5 3/6] dt-bindings: riscv: Add SiFive HiFive Premier P550 board
Date: Mon, 25 Aug 2025 18:54:24 +0530
Message-Id: <20250825132427.1618089-4-pinkesh.vaghela@einfochips.com>
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
X-OriginalArrivalTime: 25 Aug 2025 13:24:27.0909 (UTC) FILETIME=[9521AB50:01DC15C3]

From: Pritesh Patel <pritesh.patel@einfochips.com>

Add DT binding documentation for the ESWIN EIC7700 SoC and
HiFive Premier P550 Board

Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Reviewed-by: Matthias Brugger <matthias.bgg@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Min Lin <linmin@eswincomputing.com>
---
 .../devicetree/bindings/riscv/eswin.yaml      | 29 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++++
 2 files changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/eswin.yaml

diff --git a/Documentation/devicetree/bindings/riscv/eswin.yaml b/Documentation/devicetree/bindings/riscv/eswin.yaml
new file mode 100644
index 000000000000..c603c45eef22
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/eswin.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/eswin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ESWIN SoC-based boards
+
+maintainers:
+  - Min Lin <linmin@eswincomputing.com>
+  - Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
+  - Pritesh Patel <pritesh.patel@einfochips.com>
+
+description:
+  ESWIN SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - sifive,hifive-premier-p550
+          - const: eswin,eic7700
+
+additionalProperties: true
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index fed6cd812d79..9f8f806c7c79 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9074,6 +9074,13 @@ L:	linux-can@vger.kernel.org
 S:	Maintained
 F:	drivers/net/can/usb/esd_usb.c
 
+ESWIN DEVICETREES
+M:	Min Lin <linmin@eswincomputing.com>
+M:	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
+M:	Pritesh Patel <pritesh.patel@einfochips.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/eswin.yaml
+
 ET131X NETWORK DRIVER
 M:	Mark Einon <mark.einon@gmail.com>
 S:	Odd Fixes
-- 
2.25.1

