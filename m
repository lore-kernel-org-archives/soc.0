Return-Path: <SRS0=Qc4v=5V=ew.tq-group.com=alexander.stein@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A30C54EAA
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 11:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC2A1C433EF; Tue, 24 Jan 2023 11:02:31 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 843E3C4339C;
	Tue, 24 Jan 2023 11:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 843E3C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558150; x=1706094150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=La1SqrmmnmfoRQVaCbL1NtRLcutiM97WpgFEBLZ3rgU=;
  b=HEKiHrciLkhmLB3jGWOEv7/Emiokp0kKMGwTG1LFjME0dtXMaQ3lVtJt
   M1tdJJSHGRMv3ANUyW/iDoSkRr+KJ9k+dcqqR9zwEwUCAk1GydYXfXMq2
   MYRc/+v8GcYUSUCoifW9rm0EJj2XTF3QG01lr0AZFBNcwfklyBrMdOW+N
   JqbSM2keWfCXw9Z8iRnHt5PjTiDMxMIgW73NCqtEQTKI9n/qOzn4nslxw
   wp154R0LXY0zWnJrwCm+FWHzSjdaK534mHpCblWCZu00YBaHbGEw8HsHt
   KMyLDrMIj3AU7+gU5qlOs8g5rwA+hb7tY5MT0biQ+LCqTZ5HdFYHWym3u
   A==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616632"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Jan 2023 12:02:19 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 24 Jan 2023 12:02:19 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Tue, 24 Jan 2023 12:02:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674558139; x=1706094139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=La1SqrmmnmfoRQVaCbL1NtRLcutiM97WpgFEBLZ3rgU=;
  b=SrDH+i65ZKGEcoinX3OOn7YGLK5Cs4JyetgjdvFsRXgA7kblQDB1Firw
   xV47NcY8tPbHWeA8MKTucXJ8H8ThAxKsZj5nKJzO0bibzTc6ilDJ7ipOg
   JTGMzKOWp1f7lSGdOHCYDsm8Ad+GEt8mdATMAmjq9rWOyN+aRR7NGlMzW
   xtNHG8KGyP7JRcK3vFhaTI98UXe6J465KS1S41rkJ0UQi05jD+Tge0aLS
   wg7gRKMhSWm9nQAUqUQ/kn4LJEOe6yKp977N/6gEMDtA+HT+fYfe8K1Q6
   iglW2DUeQkxB4/tHCTl4EpJUN1gQMa3B+fVniMXBSo0K4r44nmbF9gnsc
   w==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; 
   d="scan'208";a="28616631"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jan 2023 12:02:19 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3AE88280075;
	Tue, 24 Jan 2023 12:02:19 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Marek Vasut <marex@denx.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>
List-Id: <soc.lore.kernel.org>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kbuild@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v3 09/10] kbuild: Add config fragment merge functionality
Date: Tue, 24 Jan 2023 12:02:12 +0100
Message-Id: <20230124110213.3221264-10-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
References: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

So far this function was only used locally in powerpc, some other
architectures might benefit from it. Move it into
scripts/Makefile.defconf.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
Changes in v3:
* Added Arnd's A-b

 arch/powerpc/Makefile    | 12 +-----------
 scripts/Makefile.defconf | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 11 deletions(-)
 create mode 100644 scripts/Makefile.defconf

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 4fd630efe39d3..6ec5b9f7b7caa 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -253,17 +253,7 @@ PHONY += bootwrapper_install
 bootwrapper_install:
 	$(Q)$(MAKE) $(build)=$(boot) $(patsubst %,$(boot)/%,$@)
 
-# Used to create 'merged defconfigs'
-# To use it $(call) it with the first argument as the base defconfig
-# and the second argument as a space separated list of .config files to merge,
-# without the .config suffix.
-define merge_into_defconfig
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
-		-m -O $(objtree) $(srctree)/arch/$(ARCH)/configs/$(1) \
-		$(foreach config,$(2),$(srctree)/arch/$(ARCH)/configs/$(config).config)
-	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
-endef
-
+include $(srctree)/scripts/Makefile.defconf
 PHONY += pseries_le_defconfig
 pseries_le_defconfig:
 	$(call merge_into_defconfig,pseries_defconfig,le)
diff --git a/scripts/Makefile.defconf b/scripts/Makefile.defconf
new file mode 100644
index 0000000000000..ab332f7534f51
--- /dev/null
+++ b/scripts/Makefile.defconf
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+# Configuration heplers
+
+# Creates 'merged defconfigs'
+# ---------------------------------------------------------------------------
+# Usage:
+#   $(call merge_into_defconfig,base_config,config_fragment1 config_fragment2 ...)
+#
+# Input config fragments without '.config' suffix
+define merge_into_defconfig
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
+		-m -O $(objtree) $(srctree)/arch/$(ARCH)/configs/$(1) \
+		$(foreach config,$(2),$(srctree)/arch/$(ARCH)/configs/$(config).config)
+	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
+endef
-- 
2.34.1

