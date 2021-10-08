Return-Path: <SRS0=ge7R=O4=gmail.com=zhang.lyra@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98740C433FE
	for <soc@archiver.kernel.org>; Fri,  8 Oct 2021 03:46:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4724B6120C; Fri,  8 Oct 2021 03:46:00 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 181D5610E7;
	Fri,  8 Oct 2021 03:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 181D5610E7
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id q19so6559105pfl.4;
        Thu, 07 Oct 2021 20:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7DEKEwn1sYlj7MiLzk6fLL0vy4MseGtQcchsFCXbjxQ=;
        b=HuS8xXU9n3RP9Z8wRKHlz2xxxem//6yMnrYPm59Skz7x+qdISQYod8sdKRSgl3DjHx
         BRAyGuFd4NcXzd+nX0rXIncqskgHbHac5lQJRjydO+IyXoYMyP4/eWdIfRTSFxccvRmM
         WWeexgXuPwFmZeUvuyaReODqGp0Fnuv5FMwVByCZ01h4QnmOYlH1du1iApH6Rhvfyn7C
         cYpG4q+Yo55ImbnBVCWSrN2CRu2bY5a5TAxQIHq952bEsmniyJ1wl1n9R8L54nKZacEy
         rQfMSdc1GRePJtY/vPJ5Zms6T2ucyu0Em7Y4d08sRUs8rtmdKPY6WLYxllcEC85PgmQX
         WnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7DEKEwn1sYlj7MiLzk6fLL0vy4MseGtQcchsFCXbjxQ=;
        b=adLKV2/KSfIfi5LQX6tcChZrpxhX7SZ54hFG1XB9FHuYbZO96FXL+QEBWcdGiSaiMQ
         DEu/NFqWsHYrGQb4J+16nzPfTejtftDLcqRC2r/if/ab5Pq6KGWP1UWfLdJv1FEgraz0
         lImtQT4xsG7k+jVW13hUiPUkdqHaeZZ1xeffmEhbL7Ou3WcqDbqYkKtTxm56kxDKK7XY
         PubrI2rLJ6GG8LCU4TznR8s8FTCUdtHImH0+pgS65aVim+ESSTH5Lik7XcLaRG5jWY3v
         NbY9m5qsjiC83sHWkikmRgkP5zwg0uKWhs0MsCibAtDpJOT3F3wPMjpVvrk0kLOg73pZ
         kJkQ==
X-Gm-Message-State: AOAM532PKi8X3QxWeprssQ5nQA+0DlqI4RMWmofxJE/WARF3BDZCCQNI
	3gHCFmaSO8c3rgQc7NDxNQHu02U4AsQ=
X-Google-Smtp-Source: ABdhPJyYZCr7OAVfyNM+Z8n7lEgEBUMJyQtz8tYm+zp2CgOO2iEtifROiJAfELasAfD60h1FegN+SQ==
X-Received: by 2002:a63:d2:: with SMTP id 201mr2730054pga.400.1633664759558;
        Thu, 07 Oct 2021 20:45:59 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.102])
        by smtp.gmail.com with ESMTPSA id s3sm9253776pjr.1.2021.10.07.20.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 20:45:59 -0700 (PDT)
From: Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Baolin Wang <baolin.wang7@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Chunyan Zhang <chunyan.zhang@unisoc.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: Add bindings for Unisoc's UMS512
Date: Fri,  8 Oct 2021 11:45:32 +0800
Message-Id: <20211008034533.343167-2-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008034533.343167-1-zhang.lyra@gmail.com>
References: <20211008034533.343167-1-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

Added bindings for Unisoc's ums512-1h10 board and ums512 SoC.

Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/sprd/sprd.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sprd/sprd.yaml b/Documentation/devicetree/bindings/arm/sprd/sprd.yaml
index 7b6ae3070396..2c12e571394b 100644
--- a/Documentation/devicetree/bindings/arm/sprd/sprd.yaml
+++ b/Documentation/devicetree/bindings/arm/sprd/sprd.yaml
@@ -30,6 +30,11 @@ properties:
               - sprd,sp9863a-1h10
           - const: sprd,sc9863a
 
+      - items:
+          - enum:
+              - sprd,ums512-1h10
+          - const: sprd,ums512
+
 additionalProperties: true
 
 ...
-- 
2.25.1

