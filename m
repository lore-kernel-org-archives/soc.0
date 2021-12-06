Return-Path: <SRS0=vfwn=QX=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF473C433EF
	for <soc@archiver.kernel.org>; Mon,  6 Dec 2021 00:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9FC1DC341C6; Mon,  6 Dec 2021 00:45:43 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E212AC00446
	for <soc@kernel.org>; Mon,  6 Dec 2021 00:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E212AC00446
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id c32so21257322lfv.4
        for <soc@kernel.org>; Sun, 05 Dec 2021 16:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=35Af0MdKDgoEa+Y4UQ0RbJJX8eTFJ1PgBvwzYANLwAE=;
        b=LwweodicY6Z1c05t4z4MUa1NGpXiYtfovL08J4uTf11lnbZlBAMzE8NBetRwySNDiY
         LLYnXytcO2L+M+m6Dxm48lemp6kGbdMZqD+2LmsSoVMR99B6tB2d/38QBfSRBcL92WHA
         40reVQYpW+lhIKpq5tnhF6IFqn1cNOP11Jiyu1Ptzhg2xm93I/DKr687otHgM4omJVtq
         u++6i5aOEyX1TXawiPHSRNxPuvfB3WyqkSpC9mJ2z56bDdR/9nx0SLLW2CwKortGjQEB
         X4YELs8tXqDoOqUnzTyJB9LUKfnOtKTBvcZrrFmx/HNg22eomkyFQiJFmC8f/gGgF599
         MvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=35Af0MdKDgoEa+Y4UQ0RbJJX8eTFJ1PgBvwzYANLwAE=;
        b=YV9tX2NFI1Y1qaj1CA2pILNwmvwYTphjOldyrqFNnTqTsyXDMwc+SXFhpKaAPdJ3Bq
         tiWRCiSgaM0pCn5kqY1rxI6FKYssSgGemsWcIraXieDut8CYksLIzF833NZL8+88xbx6
         f9XRZBlUogNzp+s+e1yUBe2J1fhuf5VW10nDzP1dMHoARTxS7vUJKjobpJuo3IFCwNSp
         /FTmVefIg+WapBKS9fsjZjr9RW/xmJPBD77LytvfBfHmj8oIBN8xIBJvuKphqQuWM8k0
         E4ElIdxdgHkI8va/SYCpkhVbcuFr05rPHvvRse+o8K9ekvysU12+cFZFyJh79JMTAJ6Z
         296g==
X-Gm-Message-State: AOAM533CezOKzxgaPJ6OQBdX0EwRa4HCLA2f/GFtmbZwc/A43xsxqWMr
	PiD0UBCNaswswdS3ARCpMdzS7A==
X-Google-Smtp-Source: ABdhPJw6py8nSYQmiwwZWOCbQlUrRq29wkxmDTFCmOM+RkCCcDiWOlA+Tmov8E6er0YWzhC50VtiCQ==
X-Received: by 2002:a19:d61a:: with SMTP id n26mr32242525lfg.313.1638751540852;
        Sun, 05 Dec 2021 16:45:40 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m20sm1207394lfu.241.2021.12.05.16.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 16:45:39 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Christian Lamparter <chunkeey@gmail.com>,
	Steven Maddox <s.maddox@lantizia.me.uk>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: gemini: NAS4220-B: fis-index-block with 128 KiB sectors
Date: Mon,  6 Dec 2021 01:43:34 +0100
Message-Id: <20211206004334.4169408-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christian Lamparter <chunkeey@gmail.com>

Steven Maddox reported in the OpenWrt bugzilla, that his
RaidSonic IB-NAS4220-B was no longer booting with the new
OpenWrt 21.02 (uses linux 5.10's device-tree). However, it was
working with the previous OpenWrt 19.07 series (uses 4.14).

|[    5.548038] No RedBoot partition table detected in 30000000.flash
|[    5.618553] Searching for RedBoot partition table in 30000000.flash at offset 0x0
|[    5.739093] No RedBoot partition table detected in 30000000.flash
|...
|[    7.039504] Waiting for root device /dev/mtdblock3...

The provided bootlog shows that the RedBoot partition parser was
looking for the partition table "at offset 0x0". Which is strange
since the comment in the device-tree says it should be at 0xfe0000.

Further digging on the internet led to a review site that took
some useful PCB pictures of their review unit back in February 2009.
Their picture shows a Spansion S29GL128N11TFI01 flash chip.

From Spansion's Datasheet:
"S29GL128N: One hundred twenty-eight 64 Kword (128 Kbyte) sectors"
Steven also provided a "cat /sys/class/mtd/mtd0/erasesize" from his
unit: "131072".

With the 128 KiB Sector/Erasesize in mind. This patch changes the
fis-index-block property to (0xfe0000 / 0x20000) = 0x7f.

Fixes: b5a923f8c739 ("ARM: dts: gemini: Switch to redboot partition parsing")
Bugzilla: https://bugs.openwrt.org/index.php?do=details&task_id=4137
Reported-by: Steven Maddox <s.maddox@lantizia.me.uk>
Tested-by: Steven Maddox <s.maddox@lantizia.me.uk>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi ARM SoC maintainers, please apply this directly for fixes.
---
 arch/arm/boot/dts/gemini-nas4220b.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/gemini-nas4220b.dts b/arch/arm/boot/dts/gemini-nas4220b.dts
index 13112a8a5dd8..6544c730340f 100644
--- a/arch/arm/boot/dts/gemini-nas4220b.dts
+++ b/arch/arm/boot/dts/gemini-nas4220b.dts
@@ -84,7 +84,7 @@ flash@30000000 {
 			partitions {
 				compatible = "redboot-fis";
 				/* Eraseblock at 0xfe0000 */
-				fis-index-block = <0x1fc>;
+				fis-index-block = <0x7f>;
 			};
 		};
 
-- 
2.31.1

