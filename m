Return-Path: <SRS0=AN8N=JS=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DE0C433ED
	for <soc@archiver.kernel.org>; Wed, 21 Apr 2021 20:48:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7580E6144A; Wed, 21 Apr 2021 20:48:36 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8B9161428
	for <soc@kernel.org>; Wed, 21 Apr 2021 20:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8B9161428
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=khilman@baylibre.com
Received: by mail-pf1-f178.google.com with SMTP id c17so30033642pfn.6
        for <soc@kernel.org>; Wed, 21 Apr 2021 13:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZcLsBjs232xzROZWNF7eNdAdRnsVNUUu8DByMHzzzYs=;
        b=1wiz+IiGd8sEyoR7tY/fGbyjK2U1GJih82pZmwHXIGGtC0uNSaVxz+cpg5k7G0k87W
         JkVboK/054G7oDUihu9grUiCFJtG2yH/+itCNzGCcGWAHQRQWNE0bmZyJe21DacuIRZi
         /dDQk8fPn0EtaQzXPzVGLkSg9cWM0TxqvCb8Pxid9pxdcKqD3eOw/8njesusKlsJgCYX
         Xugu8cc87loO5sV9UsjzINDGIDKTgVOroMQK0EpunSSJbzzpdG+kPtHZfPFVoEaw+ZSz
         8TDqurm/y2zCYs2o60NDSlWBjfQOoRY7mfx0vnnuq/GXW8HtkA0VxMQU+4/r5m2T8nfC
         yg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZcLsBjs232xzROZWNF7eNdAdRnsVNUUu8DByMHzzzYs=;
        b=avAZ2nHTivQHfMHo1BBCQyOpCGs8VJb82w8kOYwCGEGiKTMSPZgX6oMZwtc1AhvXB9
         JbDJ8Gnckd/fn+gUW6QpZ6e/kADnWg7HT19hN1VvU5O+aEyAs6pTljOckMEp36/+Lngc
         dmLw/5LbzE7GLZGWJ50JhOAzaTX5obmcxFfRAheukbr9o5fcM3s3f7wuc1B5LOy19ngf
         SbF7iJqsxcQlq15ccvGd7bwtG29xqn/5ZKu/Kj4627Eta4CPV022v7j8u8fD9EDn+H02
         dSnu8OjuQNrddl3bFag8uBul6LH7T0D4kP5NH7n+UmN042NnXLaHGi3JfuVNC+AxoU9W
         k9sQ==
X-Gm-Message-State: AOAM533W61HFg5ZA9Ls3Ui3+cUqTxGOVzAalnBa/KB7QqxKpJrNRemel
	oNXT6bY4tR1AOS7E5otBps6ucA==
X-Google-Smtp-Source: ABdhPJyNHGWzLI1G0h0A3vWf4PKsfJdlfnz9vMId5uRCK39tGOWetX0geaAMqkihFnQFKBQmxcgxRA==
X-Received: by 2002:a63:9e02:: with SMTP id s2mr62538pgd.134.1619038115274;
        Wed, 21 Apr 2021 13:48:35 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id b25sm177079pfd.7.2021.04.21.13.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 13:48:34 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 2/2] dt-bindings: mali-bifrost: add dma-coherent
Date: Wed, 21 Apr 2021 13:48:33 -0700
Message-Id: <20210421204833.18523-2-khilman@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210421204833.18523-1-khilman@baylibre.com>
References: <20210421204833.18523-1-khilman@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add optional dma-coherent property to binding doc.

Found by 'make dtbs_check' on arm64/amlogic DT files.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 184492162e7e..894ba217ab32 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -69,6 +69,8 @@ properties:
 
       where voltage is in V, frequency is in MHz.
 
+  dma-coherent: true
+
 required:
   - compatible
   - reg
-- 
2.29.2

