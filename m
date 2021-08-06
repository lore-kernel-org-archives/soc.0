Return-Path: <SRS0=HLeY=M5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E70C4320A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 20:48:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C46896105A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 20:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C46896105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bJo4lZFB4uyXjR7v1w0yqNiPTmzQa90y/DBMb2zwts=; b=3RiI+UzUiIzfZ6
	Pi1YRwlDbnHpnBsYWvsTim8A3bjJj9bT8FfDDd1XHYSXAt0J6sdV/qj6NOYCdHx+REnEj3dAOmXlW
	mnXevOtz8ow/OgeD+D6z2GLn264AI+OQ3d6/Lcn8xIGrLZPzHlZRWb5mQbiHDcA5Ubb3IvHKju4gs
	qr6hiEmdSsv8mxmwKVKRSWEVoNaWgXt5Kgt9UNkhXV8pYt+iomvX1GanZOv2PuU/LlxSvQPsPAIPP
	ZkrOZzaPu3RIQUXry2KQC27hBQ8Q6fFvKekJgzy8ZV6xgp6cQdoQ7LwG9IIlw/qtr5ZnPnVYx4VXq
	yGtOq8Xd3lFbtt4i7+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC6jQ-00DX87-Tq; Fri, 06 Aug 2021 20:46:17 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC6j0-00DWxf-OY
 for linux-arm-kernel@lists.infradead.org; Fri, 06 Aug 2021 20:45:52 +0000
Received: by mail-wr1-x42e.google.com with SMTP id d8so12577337wrm.4
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 06 Aug 2021 13:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3wJQqYROu53OkfXOxiXbXsaK10t0gPF2sKNTrvl8ijI=;
 b=BzHquhrgcHqfReZNU2wYHzGqZKMPL0CTZ2OkJbkm9j88UaZl0n/9hJlScWFv6KpTrt
 xrLl3Rm4a3jimEJsAkyv68TBZYE4pe4si0m6lmObgYnKIcaJqraxpPvbC4/Rgx/q32Eo
 EK1Jeg3O4sAD0XrAqySM0nDVrV4i+55GPNo05aiKWTGhAhj+RzI8PCK+sSV2PKaHyLVl
 HKCPyV+JoV9U8NyumlbBTW/ZvQmiStt+svyBOvhcmWhPk1haS7kcdxnqYGpohgzVNVEO
 nIst7Goz3Y6xcPF4zhsQKfhiLOunISdG2u+O1c+U3Z0AQK2c8/TBkGAwyetmmmchfRo0
 nwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3wJQqYROu53OkfXOxiXbXsaK10t0gPF2sKNTrvl8ijI=;
 b=Kg51V4zm7t3FqDt8UUB7QL/kMz7R9fs4raLCpreR2HqLF/HDn/jdeXb3nswEv2OgO1
 zDVKjVSH7CA85cE7JeXN6zlcCBelQoferHBJv2W/6GpDp+vUrrCTZM7DryOMiYUYBkIr
 yOSzk2r44uYU64RCADPMrxEKVsHJmGYUWeIexXgyPVUJCBkj/uMw+JBf0mZlhgfC25ax
 O896H9pDWte4WfzDPSzwntGLNH6jl+srUTaJ1Uvd5kfxo1Q95ePZJRRPd+ccT4bwYXgF
 5cLkv7RnmpxfGOPeYI3gkm5d9ZgVVU9KG1tRDIZnbazVt6dUK2X6tmh3H9wyigwLkKnn
 EU0Q==
X-Gm-Message-State: AOAM530jg4O5OwJlM/2CGO/zi3nvUBD1c9dr6Otb11Mg5TcECSCPrjVE
 gKxJEAn2fYZHh68vh/DF4KNtL2GYZm0=
X-Google-Smtp-Source: ABdhPJzgkqKvOTrcDSDK0+Ko6rn4b8UY3tvzal+b9Qp58RK6njFRYCHGasTaYuCovTJ4qVEYOG2TaA==
X-Received: by 2002:adf:fc50:: with SMTP id e16mr13123857wrs.382.1628282749109; 
 Fri, 06 Aug 2021 13:45:49 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id a12sm13029248wmj.22.2021.08.06.13.45.48
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Fri, 06 Aug 2021 13:45:48 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthew Hagan <mnhagan88@gmail.com>, Rob Herring <robh@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 5/5] dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
Date: Fri,  6 Aug 2021 21:44:36 +0100
Message-ID: <20210806204446.2981299-6-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210806204446.2981299-1-mnhagan88@gmail.com>
References: <20210806204446.2981299-1-mnhagan88@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_134550_857262_BCEBBAD7 
X-CRM114-Status: GOOD (  10.11  )
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
Message-ID: <20210806204436.fPeuBA-F4zNFTlg9RZ90MJy1V9xe0W8qZAzAkWJBbho@z>

Add bindings for the Meraki MX64/MX65 series.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
index 78dfa315f3d0..7d184ba7d180 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
@@ -62,6 +62,12 @@ properties:
           - enum:
               - brcm,bcm958625hr
               - brcm,bcm958625k
+              - meraki,mx64
+              - meraki,mx64-a0
+              - meraki,mx64w
+              - meraki,mx64w-a0
+              - meraki,mx65
+              - meraki,mx65w
           - const: brcm,bcm58625
           - const: brcm,nsp
 
-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
