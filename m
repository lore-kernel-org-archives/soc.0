Return-Path: <SRS0=fGbl=O4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB74C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 03:48:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96CC960FF2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 03:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96CC960FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S79MswFYfjVoi7m9UF0fcH//qIRJi+giRSJU9um7sEA=; b=xrNBnvf/4Pc5nZ
	/U1IVRX58ijpmk5YhVvmfE8Id4UfBr5mb972EWYa6pQBbFO5kYrZxoLBbUci3hZNBp1rcOdQHW54Y
	LG5Yr5g2bwQgJc6qPl3TZI9HcIpTC9V3/WnvshmORDuJ7HEGs7a3/2Y7aHT4BvLm0GG0LThlOK8MR
	RDcWy+/T/p2JkYVxMH35mdXbPecGVoU0GPrqQFyRTjXlPGTN+tZqcmse8BzdwqkeRsGyV1feovK2W
	SDNU30Vr5BLTuRtVc5r0Cqrbpa2PVnwgV9ULpDjcIYoxDOzDssLXCh4sd8Y3rgTTwNeoNehbvWyaH
	PhfpOpCs/cAa9hpyjBVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYgpo-001SHF-IN; Fri, 08 Oct 2021 03:46:12 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYgpc-001SDs-8g
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Oct 2021 03:46:01 +0000
Received: by mail-pf1-x434.google.com with SMTP id u7so7011256pfg.13
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 07 Oct 2021 20:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
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
 b=hFi6jN5OsuwQxDCHiNW9jmfqIpV6EYSZB2gIMm0zXA1Qi9PLIxgWHJ2XtZJreE49wb
 SYVyqDRlHGqnHzQ7cKDyKKTCIQ8sjMmheJqT+fsmN+ATC7Mo4PDil7j+9yDHApfbk6F8
 JztqfhbsuoRcduazUpkahPxlgyMEngrdnH8gn0Pl/N6EvveCye/08EjHL72gunNTQ1Fq
 YVAx6sQNDjQ6ByDzSGZ6+bWOxXHUmRWCCkP7GEqOA/dWCLgj5pBX+N0asmNNTMt9zWOw
 h6lfszXvC0uqbds2ZbqDPs+7vQd6zGXnYAcPfVyiJQk9FWg+LlvE4qSdlfNN6AYkO7Du
 SKTA==
X-Gm-Message-State: AOAM532wan0UIr8IjuQU+X3q6g5QWjo8to979BF2rR51rFHRu4TIEcM1
 yQ7M/g02BEdZDYDROLFhKY8=
X-Google-Smtp-Source: ABdhPJyYZCr7OAVfyNM+Z8n7lEgEBUMJyQtz8tYm+zp2CgOO2iEtifROiJAfELasAfD60h1FegN+SQ==
X-Received: by 2002:a63:d2:: with SMTP id 201mr2730054pga.400.1633664759558;
 Thu, 07 Oct 2021 20:45:59 -0700 (PDT)
Received: from ubt.spreadtrum.com ([117.18.48.102])
 by smtp.gmail.com with ESMTPSA id s3sm9253776pjr.1.2021.10.07.20.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 20:45:59 -0700 (PDT)
From: Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Baolin Wang <baolin.wang7@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Chunyan Zhang <chunyan.zhang@unisoc.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: Add bindings for Unisoc's UMS512
Date: Fri,  8 Oct 2021 11:45:32 +0800
Message-ID: <20211008034533.343167-2-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008034533.343167-1-zhang.lyra@gmail.com>
References: <20211008034533.343167-1-zhang.lyra@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_204600_348398_4269ED19 
X-CRM114-Status: GOOD (  10.62  )
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
Message-ID: <20211008034532.6G48dga6zuRrkW1U8a2AnoskuMMyps2lPuM3IMH9dRM@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
