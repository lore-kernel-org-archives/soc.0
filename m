Return-Path: <SRS0=hyJi=OF=iscas.ac.cn=zhangchunyan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC60C30658
	for <soc@archiver.kernel.org>; Fri,  5 Jul 2024 09:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 512B3C4AF0A; Fri,  5 Jul 2024 09:11:50 +0000 (UTC)
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A2CCC116B1
	for <soc@kernel.org>; Fri,  5 Jul 2024 09:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7A2CCC116B1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from ubt.. (unknown [124.16.141.243])
	by APP-05 (Coremail) with SMTP id zQCowAC3iSHIuIdmxGKmAQ--.42380S2;
	Fri, 05 Jul 2024 17:11:38 +0800 (CST)
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Baolin Wang <baolin.wang7@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [RESEND PATCH] MAINTAINERS: Move myself from SPRD Maintainer to Reviewer
Date: Fri,  5 Jul 2024 17:11:33 +0800
Message-Id: <20240705091133.3308539-1-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAC3iSHIuIdmxGKmAQ--.42380S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr4UAFykJFW5CF45Jw18Krg_yoW3trg_G3
	WkXrWxWrWkJF9rA34kZF9rCa1Fv3yUWr4Fg3ZYqwn8Aay5ArykKFnFq3WxXw18Gr43KrZr
	KF98AFZagr1avjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbF8YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2Iq
	xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
	106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
	xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_
	GrUvcSsGvfC2KfnxnUUI43ZEXa7IU86OJ5UUUUU==
X-Originating-IP: [124.16.141.243]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiDAgJB2aHhSy3QgAAs3

I've resigned from Unisoc (formerly Spreadtrum) and cannot access
internal HW specifications any more, also cannot commit much
time for maintaining sprd code, especially DTS.

While I'm happy to help review the sprd drivers I wrote before.

Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d6c90161c7bf..d0d7711f05a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2893,7 +2893,7 @@ F:	drivers/edac/altera_edac.[ch]
 ARM/SPREADTRUM SoC SUPPORT
 M:	Orson Zhai <orsonzhai@gmail.com>
 M:	Baolin Wang <baolin.wang7@gmail.com>
-M:	Chunyan Zhang <zhang.lyra@gmail.com>
+R:	Chunyan Zhang <zhang.lyra@gmail.com>
 S:	Maintained
 F:	arch/arm64/boot/dts/sprd
 N:	sprd
-- 
2.34.1

