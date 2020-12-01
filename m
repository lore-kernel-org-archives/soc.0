Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA74C64E7A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 338A020770
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZBsOPixL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Mg4In0e7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 338A020770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YYPFckZmXRt1A3XeURyeH3l9L3X391i2Vvk6LmyFGcE=; b=ZBsOPixLwd/IwPkIk+vx0c/e6
	dydWN16kKclVLCmqPbMDkuKSBuRybMlLQ9Yq8rrn3ChTMOW+VM/Sajol//iIt2+VRH5/5CsY1GbIx
	Y6euqILBUF6zhBLzEuFoTOZX3FL6pFtOc0IUYN+tYWbYXQYPgAq3IlovuUuWqGul6XmDCSJZp10vf
	HIngoCymroRMPEd01edjyCvKgcPTJNCZrprAgUGGva0jMSQAS675n6PgjA+mPOLbrIx90T8AePKEZ
	bUrRULzxgLbWvNzq8JMTo+/actf/7g/uoIkbvKXc+rZKpCIHhdcaY/PeSM9lM/hLpGeq1lpPHoBjz
	gkVoJD+5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk5wm-000715-QX; Tue, 01 Dec 2020 13:44:00 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk5wg-0006z2-8X
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 13:43:55 +0000
Received: by mail-pl1-x643.google.com with SMTP id 4so1155867plk.5
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 01 Dec 2020 05:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6DwCQ27nNXwfD9t5ZQW62DZJZaYrd0rxE1o52EO0bsI=;
 b=Mg4In0e76C/nyOIQGBgSdZl64D3A5Tu74H2xv0kJ901QHWVsL5TL8tVTtZg/sH4otm
 h08twifw/lCN9tVt0w9xD2MFXAh+K1zUtSH8GfB1vti2Dx9NcjBDFZSKfHYscKwxCRye
 JrTYcYc5xcZ1au/5IwyjW9PTMsc+zVXnNnUwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6DwCQ27nNXwfD9t5ZQW62DZJZaYrd0rxE1o52EO0bsI=;
 b=JHl/H18+uOIfv2aw66DfNm1TmDh3f7NX3ShPNGp7SyfWcyECMc8nfn7LaW/TEej1f2
 0VzXIF7BxW6vDGSfk9A736S+mkro2qhVL1pax3dewzHgZJNbf0KhcXyP5aNBBkWe237J
 UybRw0eMDig3tRlbKDssoblbRJKcumVjz7bReJOia2BKRjXUlQLCfs5r5Wm7SiecJhOE
 7HdjoALsi/nGjWuIw/1dLEP1Zw2R+WzdNF8Fn41jn7FOgrdZBUh+J9MAHbJL1nhjB3Wl
 qcglfjN6XlMBNh6jIi/XYf7NVaO8Bi762C4kiMr+tSPfW+m7JORJbGz1I8RqdF4QVI8h
 HMWA==
X-Gm-Message-State: AOAM532y+xpWuYY/LTP/GltCKWnb53H1fTKD7qo/2eja+cszjbFlncbn
 XPOnD9NPo29VYKs99L+IGNwPLw==
X-Google-Smtp-Source: ABdhPJxpaiILhXu389YSGSADviATIWQrbxVZK/JiCYSOrTtXFyfERdUSo5vjfna+xlbCHCirxfOyNw==
X-Received: by 2002:a17:90a:ee8c:: with SMTP id
 i12mr2774956pjz.33.1606830231857; 
 Tue, 01 Dec 2020 05:43:51 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:43:51 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 05/10] ARM: mstar: Add common dtsi for SSD201/SSD202D
Date: Tue,  1 Dec 2020 22:43:25 +0900
Message-ID: <20201201134330.3037007-6-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_084354_315106_C490971D 
X-CRM114-Status: GOOD (  15.13  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: robh@kernel.org, arnd@arndb.de, daniel@0x0f.com,
 linux-kernel@vger.kernel.org, olof@lixom.net, w@1wt.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201134325.Wp22MI-zi41C49JFyWWdXM3TkmilhUUpgJdqm1V6_-o@z>

The SSD201 and SSD202D are basically the same chip with a different DDR die
packaged (64MB DDR2 or 128MB DDR3).

This patch adds a shared dtsi for the common parts of these chips like
gpio, pinctrl etc.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi

diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi b/arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi
new file mode 100644
index 000000000000..0811220f0a79
--- /dev/null
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include "mstar-infinity2m.dtsi"
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
