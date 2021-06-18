Return-Path: <SRS0=1/go=LM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4737CC48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 20:58:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12EB7610C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 20:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12EB7610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8iEYk1eiD7sbWkt+Qbt0JXKkBFD1YJfIqd3WeEhWJC8=; b=1bq82k6Q9Kb8Cj
	uPZH/uP/VdbdYYvNEPDRrYllv5B4Ov5fENedFG9O1lEd9W35pdCPHcW7Mcc+JytIBL9mx8iYiPsyN
	oH6wf2ma83rpcq7nTOu0jBYl6XUmMlL06yKz2lTUWiG7ZvNcvLE3Z9rvUvcRgLyVr2v8qCUJglNWM
	UpXPjgk/ECv14b8oaOvgZITdegzh6rW2XtdOTyYyBRHgaiheYNvP+i12bUe+BjbyGBO3rVgXRj9Rb
	YmUPmkxcK3vbmGryHpAHRMaWduoN10o1Rq+Q+X6SBdrE/ifC6+/UkuoeO0DGScY8dcwcKdaFM6YsI
	i3dPGcDx+4j7glOKO5ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luLXF-00FVC0-Je; Fri, 18 Jun 2021 20:56:17 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luLWi-00FV7L-A2
 for linux-arm-kernel@lists.infradead.org; Fri, 18 Jun 2021 20:55:46 +0000
Received: by mail-wr1-x432.google.com with SMTP id f2so12079760wri.11
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 18 Jun 2021 13:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jRLam3ZYflZLVyyutvsIpS6o5/Y7d41E9E4JTAN/wTs=;
 b=gWB6youcrGgkWbJ8AIjkohQ82VUYjFUB3tVCiTMNnPvJVfqZnUw8Zf+NjBvaek04OF
 DaMAja3dMKukQuasVORhFiIRkDUkoXk8la/p2H/rsZQ29LK6lXmene7qa4WP5e4kyw47
 uFgYSvv3zqaqnMhwvdASbSSgYpNLQMHqxl0r5NUPezi9AkJabcDLsgYgT6xauMJCHiw1
 gNRcbeT3GW+4BI/c89H4gjNnpVr0l2C6vg/JVlzEXLL8PwsE2xemRvmm6GO5uRsBpopr
 YlWb4l4Av9h7kKCQqT/gJWq3v7vWGE7gyolC5MzSylgZYAN/UcOZGQ7ErFkOOnCBIwCb
 H8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jRLam3ZYflZLVyyutvsIpS6o5/Y7d41E9E4JTAN/wTs=;
 b=KyxbbysYXQskOcej4Zeo3ONLE6dWTeZt0mJ7quzDatPSOMQ5yxme7TyFi1aHN589B0
 9rnfRLKInow25IksbDbvS+9r6ecfp5Nr5hnvrnUNVo5XahLXXSbp4vzOOzHSc3DtgpUS
 2Lve+2SqfMoU3VWgs1sbE3xds7lA7fFcxGEHFSIgz6zJafBdkBBhwXMtGfCSARm92Lmn
 N4JUGzWVR0WYEkHX405Mm2KizvWmeJTl83oBqwhxfz3SwueZw3o4eS4vGtMpieDIVLZX
 ABOcoZbOhHM42pJL4ql52uCnG40HcfT1hjG9HPp02YQgfbUeCxqSwLGPdyZEoiY5jNz1
 sI3Q==
X-Gm-Message-State: AOAM531EQB+q7piiwmRxR+vyG6aHJ+GNAs83e7u1GgX1IDxi6/YwFbaU
 r+SnzPWMTDa/eeQqG7Mnard3eQ==
X-Google-Smtp-Source: ABdhPJwddHi1wiHWVq/27aORb5P87HAYyN2nQPoE9B42oXNCu4EJgWhDBuV2lIRN+TzjLsnmLMLY8A==
X-Received: by 2002:adf:d229:: with SMTP id k9mr14670400wrh.245.1624049743172; 
 Fri, 18 Jun 2021 13:55:43 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j12sm9745476wrt.69.2021.06.18.13.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 13:55:42 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, linus.walleij@linaro.org, olof@lixom.net,
 robh+dt@kernel.org, soc@kernel.org, ulli.kroll@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 3/5] dt-bindings: add vendor prefix for ssi
Date: Fri, 18 Jun 2021 20:55:31 +0000
Message-ID: <20210618205533.1527384-4-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618205533.1527384-1-clabbe@baylibre.com>
References: <20210618205533.1527384-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_135544_385402_70E78486 
X-CRM114-Status: GOOD (  10.29  )
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
Message-ID: <20210618205531.s5mVSOwIXSSOVf053ZTsFfIvvyAw2Np-xNWuSzxRDSc@z>

Add vendor prefix for SSI Computer Corp (https://www.ssi.com.tw/)

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 800d0536be75..6d70d6ba60a0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1090,6 +1090,8 @@ patternProperties:
     description: Spansion Inc.
   "^sprd,.*":
     description: Spreadtrum Communications Inc.
+  "^ssi,.*":
+    description: SSI Computer Corp
   "^sst,.*":
     description: Silicon Storage Technology, Inc.
   "^sstar,.*":
-- 
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
