Return-Path: <SRS0=duQC=SQ=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A93C433F5
	for <soc@archiver.kernel.org>; Tue,  1 Feb 2022 07:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A1A0C340ED; Tue,  1 Feb 2022 07:00:41 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4B19C340EB
	for <soc@kernel.org>; Tue,  1 Feb 2022 07:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C4B19C340EB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id h20-20020a17090adb9400b001b518bf99ffso1741733pjv.1
        for <soc@kernel.org>; Mon, 31 Jan 2022 23:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6OpQVC5EzNowhioJtdiEBKNsTQJbWjnwBy9L3ieqIV8=;
        b=OBg0XpYSBMdi4VmztgWd4Ctg62uoHyQSAVHTSct74x9D5Idt78ofIEAgwKc4VlkVba
         A1EoPxw2HVysLldkbFLNbSluHVMl+JXFB5MLNWKcDNeghkkP9xNcuTFKktzL1OG7Gr50
         VBUfIvTQn49Km6Duc2II6rpcfzO8Uib4z8xcCPuaqHnboUuhhSfoV/iMqfNTXLPgDZz1
         KJqT1byDmWZcb1SQCMc46yRgko+QL0QuW4mG5YgIADy45wHDAT6QsEi6DqfGD6P5JQzc
         n217whnx65yFTmMFXNVuquDeMAMI6ehr+pcUx0BD5qCcHd/kBG3yjTviPaHWENgiT1Kf
         3gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=6OpQVC5EzNowhioJtdiEBKNsTQJbWjnwBy9L3ieqIV8=;
        b=pUjm+Q/3GvmMSBy8c9TpB7zAsrqsX+xoTiF6ZjTeJxzailiS8BqTUm//GCy6gYQAMo
         NatPQ8qNir1nW4vE0Zu1sHYm+FAYSxI6vc89nEZ1yXs/7ZsZ6Pa1+M9Lhw3tkEj6iwF+
         SS8I0aTz2kromNfyRVY3xuh6VPGdx4WjYKDR6y3GqDGCn16ptyJSeoBu56tnm2EJOfZD
         Q9rY63ee/5q8zX0kawv8dd7VhsBZd4qlSzOoAnpRXKFdyrdivh7Pu/MyhArM38EndBCi
         63ejPV8dO3mnikdvid1Q5JjApiUSWmvQZ9LnMzwVFp9rWcxXaJxdOhxGbXxKJlSkRDGf
         yE9g==
X-Gm-Message-State: AOAM5312zSN6BFVujrkmSrEy0dC0VtXf5V/zRM4McmTMoDp3YK6hpvYZ
	XvyVdIpyySsfk9BDQIGNzs+97/HuwGM=
X-Google-Smtp-Source: ABdhPJxG6DbPUcVWPHRDvSI2RX3EPlc31bMxnVeXwOH2WwYWhGr2VYd75YRT+ClllHVzTydVFESxRg==
X-Received: by 2002:a17:90a:bb92:: with SMTP id v18mr722121pjr.177.1643698838544;
        Mon, 31 Jan 2022 23:00:38 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id h17sm15141654pfv.198.2022.01.31.23.00.36
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 23:00:37 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH] docs/ABI: testing: aspeed-uart-routing: Escape asterisk
Date: Tue,  1 Feb 2022 17:30:27 +1030
Message-Id: <20220201070027.196314-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>

Escape asterisk symbols to fix the following warning:

"WARNING: Inline emphasis start-string without end-string"

Fixes: c6807970c3bc ("soc: aspeed: Add UART routing support")
Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Link: https://lore.kernel.org/r/20220124014351.9121-1-chiawei_wang@aspeedtech.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Please apply this through the soc tree as a fix.

 Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing b/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
index b363827da437..910df0e5815a 100644
--- a/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
+++ b/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
@@ -1,4 +1,4 @@
-What:		/sys/bus/platform/drivers/aspeed-uart-routing/*/uart*
+What:		/sys/bus/platform/drivers/aspeed-uart-routing/\*/uart\*
 Date:		September 2021
 Contact:	Oskar Senft <osk@google.com>
 		Chia-Wei Wang <chiawei_wang@aspeedtech.com>
@@ -9,7 +9,7 @@ Description:	Selects the RX source of the UARTx device.
 		depends on the selected file.
 
 		e.g.
-		cat /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
+		cat /sys/bus/platform/drivers/aspeed-uart-routing/\*.uart_routing/uart1
 		[io1] io2 io3 io4 uart2 uart3 uart4 io6
 
 		In this case, UART1 gets its input from IO1 (physical serial port 1).
@@ -17,7 +17,7 @@ Description:	Selects the RX source of the UARTx device.
 Users:		OpenBMC.  Proposed changes should be mailed to
 		openbmc@lists.ozlabs.org
 
-What:		/sys/bus/platform/drivers/aspeed-uart-routing/*/io*
+What:		/sys/bus/platform/drivers/aspeed-uart-routing/\*/io\*
 Date:		September 2021
 Contact:	Oskar Senft <osk@google.com>
 		Chia-Wei Wang <chiawei_wang@aspeedtech.com>
-- 
2.34.1

