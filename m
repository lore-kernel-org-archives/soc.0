Return-Path: <SRS0=7ONh=OS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC05BC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Sep 2021 20:40:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 967FC6135F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Sep 2021 20:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 967FC6135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=z3ntu.xyz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77XeA1lC45P8zQbcf+xYzIe9wY8huONfWuZP6c+PIXA=; b=2QRAkg515rgo/b
	3Mn1aAU111VGsXSpjrekGOB9w6KwdU+mydWokBOAzcGrW4Rt9RTPzqkWycWCkHvzDBNZyqi54AVGl
	DwFydXvcPo6Sdx/sroGQdqyn8JxucOHdxGszP1BacuGqaGjNPpnA38UMgy+khUY0qBO7VzP1nl89C
	21v2vLKkDoL+SmgYmMmKNJfzJEyqftiSV/JvybTfwyEC/YldfsSZekhgvN73zUZoTKc2kKb3r6jAU
	upmde7VU+Wple+heFA2hktYoTaUa0CqaaKHXJPMHwxA8re7PyRUcu6flMzGWyOR3lzHUMaDG4H2ht
	bS/VxbeCCF2pAr/JY0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVJs3-008mCv-S2; Tue, 28 Sep 2021 20:38:36 +0000
Received: from mail.z3ntu.xyz ([128.199.32.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVJs0-008mBj-1V
 for linux-arm-kernel@lists.infradead.org; Tue, 28 Sep 2021 20:38:33 +0000
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net
 [213.127.63.121])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id EE2C5C8FF3;
 Tue, 28 Sep 2021 20:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1632861508; bh=CiNsP3adcwuzakR+x22r6mqUJpYSqHKJwX//BvpNn8Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=nniINJnXsWVKOUK5D8dbOk2nO7fBY9fySeqU+cOL52VS6akL+eU5DxKZ6PlcInPnI
 2Bvk6IyB6Vc8hG5QgodK+NStTx0ZjZGb2pPopzICM2WLNsGKnGUfVRVMqFguVZ+OBF
 skrK9NFpQVoKVVvY5Z5ZQFbD5clXAmnnxKCWaVyk=
From: Luca Weiss <luca@z3ntu.xyz>
To: linux-arm-msm@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: qcom: apq8026-lg-lenok: rename board vendor
Date: Tue, 28 Sep 2021 22:38:15 +0200
Message-ID: <20210928203815.77175-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928203815.77175-1-luca@z3ntu.xyz>
References: <20210928203815.77175-1-luca@z3ntu.xyz>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_133832_263461_78105CEB 
X-CRM114-Status: GOOD (  11.36  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210928203815.EQ1zM3Y-uJv3ZQicueUX1Yr40cMlS_ZFcE2gLHQnipk@z>

In order to avoid having prefixes for multiple internal divisions of LG
use the "lg" prefix instead of "lge".

Fixes: ad3f04b7bef6 ("ARM: dts: qcom: Add support for LG G Watch R")
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/Makefile                                      | 2 +-
 .../{qcom-apq8026-lge-lenok.dts => qcom-apq8026-lg-lenok.dts}   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm/boot/dts/{qcom-apq8026-lge-lenok.dts => qcom-apq8026-lg-lenok.dts} (99%)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 5ffab0486665..ff8f5ed5dd65 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -942,7 +942,7 @@ dtb-$(CONFIG_ARCH_OXNAS) += \
 	ox810se-wd-mbwe.dtb \
 	ox820-cloudengines-pogoplug-series-3.dtb
 dtb-$(CONFIG_ARCH_QCOM) += \
-	qcom-apq8026-lge-lenok.dtb \
+	qcom-apq8026-lg-lenok.dtb \
 	qcom-apq8060-dragonboard.dtb \
 	qcom-apq8064-cm-qs600.dtb \
 	qcom-apq8064-ifc6410.dtb \
diff --git a/arch/arm/boot/dts/qcom-apq8026-lge-lenok.dts b/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
similarity index 99%
rename from arch/arm/boot/dts/qcom-apq8026-lge-lenok.dts
rename to arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
index ada4e94ade66..52a848e1b4d0 100644
--- a/arch/arm/boot/dts/qcom-apq8026-lge-lenok.dts
+++ b/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
@@ -10,7 +10,7 @@
 
 / {
 	model = "LG G Watch R";
-	compatible = "lge,lenok", "qcom,apq8026";
+	compatible = "lg,lenok", "qcom,apq8026";
 	qcom,board-id = <132 0x0a>;
 	qcom,msm-id = <199 0x20000>;
 
-- 
2.33.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
