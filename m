Return-Path: <SRS0=IwMG=D3=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6531C001DB
	for <soc@archiver.kernel.org>; Thu, 10 Aug 2023 12:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 722B9C433C7; Thu, 10 Aug 2023 12:29:54 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7581AC433C8
	for <soc@kernel.org>; Thu, 10 Aug 2023 12:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7581AC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-686b91c2744so613965b3a.0
        for <soc@kernel.org>; Thu, 10 Aug 2023 05:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691670592; x=1692275392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CmYdZ6Nb6Jq/o5TomN55yrTMIaLqhz3TfJB9u+dvC2U=;
        b=GdMr7IADvbeOiwEWzbZYZflpJ/tXDl8UmXwqGiprz6+3qzK/LIrRtVdem/2eHGryP4
         ICmbW+0cWIzpvkG67ZOmTQn5KiUgDPhqkT3eiiLirqfarok5V1w5BEaY5Lg7OTSrIzZA
         JWdafFvlpKk3mxNIk/p1e6rmIEUG5KP6Tr3hpWFzqqwzvn4DUNQ1oWtxsonanL0kAlvq
         HrvgrTd5YFhaLWtkA1APbDy5TZCHOqWTHJvPdoo+Sq8t+BWzVz30EitpdwF9oOljM8fz
         9KlU8TBC4Xs/BXzAws6GtYpkJNOPru3irNtgwcHtdMgWPbFJqRKCk9bbqNx3uC0CbWln
         vBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691670592; x=1692275392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmYdZ6Nb6Jq/o5TomN55yrTMIaLqhz3TfJB9u+dvC2U=;
        b=XSvrOKDllt5G1qPONSXWVIb28NVYRwJYRXk+G4kp+p2R5xF9Zwj0X/gy6/yP84jZcZ
         079YFzu5Zvt4H7OmYylzDuiqhmg3oXoBtTHLp5aA96q6DCUOEzm3n+DR/74jDeQGsVpz
         hfPSMnv6+5ymFE+gMV57l8oCEw9YL3NA0iejkBLsFnMuEH3LbU/vo0iaC5/5IHCB2fxd
         Fbu2Dk5OqVkK0oXE/LEfD3s7qePq2lllZGmypzcnyYPYJDbfbFukSYAZbU744nf6Ualg
         NGFlZDxSxHWGaJwlfboJIRDc5WuwXJyxYyfOA2BJey6D7gQJGbe95sduVDJrrcKB42TZ
         eb/w==
X-Gm-Message-State: AOJu0YzjRW94eJto5WN57CFxZQSFkpcmz6iN53XXkjXsiOP6Zu4AQ7OI
	rEU55szNlUgEYFlJV6KyobDUHKKQuC8=
X-Google-Smtp-Source: AGHT+IFImLjg/jF8UZQs34pKfQBl70btvoPmavsEddmcOI3pUTUkKT46FhUlx7OI7750EzZ4m9ij1A==
X-Received: by 2002:a05:6a20:ce84:b0:11f:6dc:4f38 with SMTP id if4-20020a056a20ce8400b0011f06dc4f38mr2079265pzb.55.1691670591946;
        Thu, 10 Aug 2023 05:29:51 -0700 (PDT)
Received: from voyager.ibm.com (region97.lnk.telstra.net. [110.143.27.102])
        by smtp.gmail.com with ESMTPSA id e18-20020a62ee12000000b006870ff20254sm1402210pfi.125.2023.08.10.05.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 05:29:51 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Zev Weiss <zev@bewilderbeest.net>
Subject: [PATCH] soc: aspeed: uart-routing: Use __sysfs_match_string
Date: Thu, 10 Aug 2023 21:59:41 +0930
Message-Id: <20230810122941.231085-1-joel@jms.id.au>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zev Weiss <zev@bewilderbeest.net>

The existing use of match_string() caused it to reject 'echo foo' due
to the implicitly appended newline, which was somewhat ergonomically
awkward and inconsistent with typical sysfs behavior.  Using the
__sysfs_* variant instead provides more convenient and consistent
linefeed-agnostic behavior.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Fixes: c6807970c3bc ("soc: aspeed: Add UART routing support")
Reviewed-by: Joel Stanley <joel@jms.id.au>
Link: https://lore.kernel.org/r/20230628083735.19946-2-zev@bewilderbeest.net
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Soc maintainers, can we please get this one applied as a fix for 6.5?

 drivers/soc/aspeed/aspeed-uart-routing.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/aspeed/aspeed-uart-routing.c b/drivers/soc/aspeed/aspeed-uart-routing.c
index ef8b24fd1851..59123e1f27ac 100644
--- a/drivers/soc/aspeed/aspeed-uart-routing.c
+++ b/drivers/soc/aspeed/aspeed-uart-routing.c
@@ -524,7 +524,7 @@ static ssize_t aspeed_uart_routing_store(struct device *dev,
 	struct aspeed_uart_routing_selector *sel = to_routing_selector(attr);
 	int val;
 
-	val = match_string(sel->options, -1, buf);
+	val = __sysfs_match_string(sel->options, -1, buf);
 	if (val < 0) {
 		dev_err(dev, "invalid value \"%s\"\n", buf);
 		return -EINVAL;
-- 
2.40.1

