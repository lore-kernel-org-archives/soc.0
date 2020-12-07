Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A789C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 23:02:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AADC1239EC
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 23:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AADC1239EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t3hwFCUUbkjdOgwkV3aPUD+xdwmZlVZoehs8mGSWPiQ=; b=E2Bot3vfOoEbR8KjlxqzXL7vnk
	q8GibQZd6ktAXb8kKNzxSQx++9PVkZ6sXhYM+I9QfSceDu7YlERZLWsJ5OhH8Zw/iJ4hiTuTVXjU2
	CTvATR+Hap5qXKg167fqZMwVlhnJyXjsWestSUKO4cPxjci/MSAZE2Ql7DW1TfS6Hcy6RofuI0fns
	mtd+oin0f5vruo8A+HKsafgSsVuYSjuxVKeosSzg+vxAsMZEj36kzRMz+4sUy1volhpsXyCmH3yMm
	S24SImrYLJlTwiE+fKXR5rb+n/t+cfqA8K2E1MDctWxp7BCaWMIQM7Mk1RRhnH7vTZ9MvLQjc3t8Q
	7zOLLI8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmPW9-0000YC-N6; Mon, 07 Dec 2020 23:02:05 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmPW4-0000Uq-KZ
 for linux-amlogic@lists.infradead.org; Mon, 07 Dec 2020 23:02:02 +0000
Received: by mail-pg1-x544.google.com with SMTP id q3so10385964pgr.3
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Dec 2020 15:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c20XgdAWTsbcAzOG9E8OkNi+KNaONEX/6aLRj6TsWxc=;
 b=EwegfNBs5entoa8RTWbuxqCh6BwUofBPgf/qE0SkOI2Rn4Ks9HFcPKGdutUm4fOK3r
 OxFPkkBQmo+IdmnmopgCqhCuLXHk4K3vp+MEyXCGhu7vEuJ3USoh8Q6N7FKsZNIaj0cr
 PH8zTu0NmtOB5Xfk+80FEj1l35HdEswCDNmd8WlfAnmKaJn1rfPUZulzcDpR7iqeKh2e
 bfqKs4uVFpVUbqx7Q0sFJoMCwWK7wAiQedXlVX0nfYJDvioOsddaP6Z2B1PBE6PKAkiW
 NwVz/RIxQtAZKgRf4LwOxscMmlyjPUtK+rZAEV2BfGPoVdoRTmKEf+jb4Aunuh6ugfPr
 e/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c20XgdAWTsbcAzOG9E8OkNi+KNaONEX/6aLRj6TsWxc=;
 b=iaCJa52TrP8PNpN0ZuJQ93sYSqHdvNQiTYmLi3yt7oFXpB79xmf20TwIqM7FwJQ9Jy
 o8KNFbl/93QB6PY10OL2TauQcxrQSOlO/+G47J9O0koQ++fnb1D6qqBrnAU88hF7XRgk
 1yrLF7+wQlKssTxTcd1cnv5JoAU/rclkjvH/SznxX0/ePt9SpBOiW854D3Jycbs6OD9O
 K+o+5yw34e9liMiwGr8dT7tztFfromCxfPUTFg/HdOqnVIlXIPvS/N/xv45SQiQDPiBH
 +7acGiTT6tOIO6F616/mhyZTdz5/dJBFjViMJwWebimJkWboRbf3mudZXwzxD7e15rlr
 8AHQ==
X-Gm-Message-State: AOAM532gSZvlyhvhiUopmCECEM3o43ZQqw0yBSfFQVrsRkOXuvrTIkxL
 IcoF/iCd2YFfaxuPqzuVPLvcoQ==
X-Google-Smtp-Source: ABdhPJzdlIcWNokZmEVIhqX/HKCaktB+kahUWRkXhiz1gQdn+o6cyqzyt1mMCYVeVkfPXxUvnHu81A==
X-Received: by 2002:a17:90a:c38e:: with SMTP id
 h14mr1074311pjt.10.1607382117377; 
 Mon, 07 Dec 2020 15:01:57 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id z17sm396704pjn.46.2020.12.07.15.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 15:01:56 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH] arm64: Kconfig: meson: drop pinctrl
Date: Mon,  7 Dec 2020 15:01:56 -0800
Message-ID: <20201207230156.10198-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_180200_806407_596E29CA 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20201207230156.kfQlDUFZdTwYi8xZOeYNxs3kw5mGZcP2zM7GBGPHZUI@z>

Don't automatically select pinctrl drivers, leave it up to defaults in
drivers/pinctrl/meson, which default to built-in, but are also now
optionally configurable as modules as of
commit 9c65441ec823 ("pinctrl/meson: enable building as modules")

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Arnd, Olof: I missed this in my earlier PR for arm-soc core changes.
Please apply directly.

 arch/arm64/Kconfig.platforms | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index e4e74e0b5b01..6c4d7356d918 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -152,8 +152,6 @@ config ARCH_MEDIATEK
 
 config ARCH_MESON
 	bool "Amlogic Platforms"
-	select PINCTRL
-	select PINCTRL_MESON
 	select MESON_IRQ_GPIO
 	help
 	  This enables support for the arm64 based Amlogic SoCs
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
