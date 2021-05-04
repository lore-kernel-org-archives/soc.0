Return-Path: <SRS0=/KAC=J7=baylibre.com=clabbe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CD3C433ED
	for <soc@archiver.kernel.org>; Tue,  4 May 2021 19:35:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CF4E7613D7; Tue,  4 May 2021 19:35:08 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FEF0613F5
	for <soc@kernel.org>; Tue,  4 May 2021 19:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FEF0613F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=clabbe@baylibre.com
Received: by mail-wr1-f46.google.com with SMTP id x7so10638337wrw.10
        for <soc@kernel.org>; Tue, 04 May 2021 12:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ECt4IwwEy7FG3zWZdqheu507ZfKamNdvmBcqaTIjkuk=;
        b=Mxe4nYHFsLV8wxZ7XHXPTU3l0fP6YkdfwhuBUv43kA7M0CyJUV4vG21Mu3p7uOj3tw
         +gh9dqFTqYrJXuoXmQFolrLyaQ+5ytlgQPZlB59oisvqstBDT/3+HYY+oR0psZV0khit
         XufuwgIHLwkrhVjEwjg4HyKtovNKDOP90fSdgQfPLwWiB6y+8SrLTR2gGo/QJgVM1t4/
         UeOzKT5cNl1DWqQUCozBTY1z2ULnD55ptmj3HQbYMof6ybPwOYlK2kL8c8J/QKuMVxdY
         +P2KxqBmnopJWAYTTQrtB/3njPWqfuA7hdW7E5foU0VVJqS6bslake8/dnCenMPjxqjT
         Uq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ECt4IwwEy7FG3zWZdqheu507ZfKamNdvmBcqaTIjkuk=;
        b=Oby2m3z8lpYHJlIUPBZP5HoWnIlv+Iwu5F54mN0QpYr1fiEsWoigOBQPEJgt2fSqHn
         dgGCF1adzLTB6XUlKfwMRGoFXkXL5JKIdOyhpgnjIcrF9AgG5ZiABlvSL0+bgjOyHsvA
         6LBweSb7S5Gn7P06qfIGgYdF0AbNi4/Na0rX6YyLxcVjGPVL5S+k0P4kNswM71eJJziz
         Spn13rl8/gyRq2DljMIAuzAjZzB3E0SyixcvOagb3iKDJOr8oqmAP4dldn7drR0uPEBJ
         +JHU4H666hJLU26rvZ61guXyQYvmqLqq9N5ZutVX9sCUORS1raDRxG4ZPocuGSw/nSQR
         /mAA==
X-Gm-Message-State: AOAM531PWB11tWN9NCBwZQVT5Xx678KrfVx7XD2eIIT/1mSeipIItciK
	8cLHznZuKeQP9vGerH4tO1+iFg==
X-Google-Smtp-Source: ABdhPJwjwaW9YWol8TjtRGI9aOHMyyniv2xovQHdKggE5A/YFOemELHYW0A8a+iyWw3PG94j2veKtQ==
X-Received: by 2002:adf:f212:: with SMTP id p18mr33315887wro.120.1620156907386;
        Tue, 04 May 2021 12:35:07 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id x8sm17072136wru.70.2021.05.04.12.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 12:35:07 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	kaloz@openwrt.org,
	khalasa@piap.pl,
	linusw@kernel.org,
	linux@armlinux.org.uk,
	olof@lixom.net,
	robh+dt@kernel.org,
	soc@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 4/5] dt-bindings: arm: intel-ixp4xx: add welltech,epbx100
Date: Tue,  4 May 2021 19:34:56 +0000
Message-Id: <20210504193457.4008384-5-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504193457.4008384-1-clabbe@baylibre.com>
References: <20210504193457.4008384-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds welltech,epbx100 as a valid intel-ixp4xx board.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml b/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
index d72e92bdf7c1..230bffeec0e5 100644
--- a/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
+++ b/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
@@ -17,6 +17,7 @@ properties:
       - items:
           - enum:
               - linksys,nslu2
+              - welltech,epbx100
           - const: intel,ixp42x
       - items:
           - enum:
-- 
2.26.3

