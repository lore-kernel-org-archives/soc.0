Return-Path: <SRS0=iJAY=KM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221B8C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 May 2021 19:34:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FF5661263
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 May 2021 19:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FF5661263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k9GQZetI42Dbojn6yynqPauh5PI8UTDn61T0aGZ+Fxg=; b=ZSsvMf/1uQerkJcA8X4WgXDHH
	Lx9s94ZdYTv8QrLwT6Y48TCsaS1vFVkukDB/C8DTEXwVD9vgU1O9teUkhk05uBCUeszaIdPEe3qA8
	TplLi4prfWVrLC+Zt9AfvVbH/zyFKhd49dNqoMBEVZovEmijj5X12P2HtJGrr2vgumFORfLSXk2/q
	BA1AtwhpnmUEESBondCzapNrjY1Tll52LB1qUAz1dZY46ZCAn7OPEPEpC1vSAOm+X4eRoBptyfN/d
	aQqpZd78qa1FsK193mERshTBHjCTT3XwtxP4gXIhldRmQvs2Jm0aeiZoMTnosUoTlqIYOzh0cnmzA
	0KIswCcFw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liiz6-00Fwt7-DJ; Mon, 17 May 2021 19:33:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liiyV-00FwrA-QE
 for linux-arm-kernel@desiato.infradead.org; Mon, 17 May 2021 19:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=avksdsVdDMZgIQ3gqsIJUobMN9ruEWR0vv/Un1XX3xU=; b=3S9CGN8FVPq3KyGD+/jmxobcc6
 yxWPZmZJBOUdrqGPQQmnyVLVoaxS40xm3DtcBQSfALr8h70IuuABouFT+sxzIch0v5/+PyS5IxxcN
 ndfibPwI91kjHYoL79QeDkxVZTlXhyzxapvnKm09LUN/v1y3awrOzLfYREceSKdeYshEi9jMqEYZ0
 SrdntjIHvZnw1Owi1DFwFm611ubaKWNL9/ALh2AEgk1ojan252k2BRmXeaH3VgNgRcn1UHo0GPQJ+
 EzmVyU4y5koMf7IIGeFCsZDl7aDMAGBRj80sHCujSBgK/Wgp6S9P/66MikNRt5OasFVsOCPCcEGZm
 bCFKqQSA==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liiyS-00E5nA-4q
 for linux-arm-kernel@lists.infradead.org; Mon, 17 May 2021 19:32:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 b19-20020a05600c06d3b029014258a636e8so220740wmn.2
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 17 May 2021 12:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=avksdsVdDMZgIQ3gqsIJUobMN9ruEWR0vv/Un1XX3xU=;
 b=hTgaBFCmuFToWxc8asnrsyshPzpqHvZ3IqBoEB57RqwsPd/debGCK6X5Q4ySKDo/k/
 8cOZpGUfYySaYQi1oinmuzNTaUcu5HSCVVLFnknxFgvSV2CR6itIKY5KvlhcugGcJtEM
 wEwc2uY6AGNTufVQrlxgHA88xa61dMnwgDvf83/teANds9U5IkoUQ5n58Ac/ciCFNugf
 d9fvnxrI9KkWkcMYDfacBOtEDSsosmy65IEAMEOOS2FlIa0BdQ8jksW8mQF8jBcBW1k4
 /1fXfgtwXOBQNDBJ0G6HITTHnMy6AMRf2NPJES6wqGUU6MKJyLNsdBEozk5daSj/HV1I
 SuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=avksdsVdDMZgIQ3gqsIJUobMN9ruEWR0vv/Un1XX3xU=;
 b=nYldtLaWESmsmVyFnWWNm4v31j2Q7r1YyVpMt2rco6XukeLVAAWrnyCUDbnFzVCAd6
 aBZT3ruGNkJEImu2ZJp09Fgx2BHqCkXqAfbsv+RE0OM6XlPuvIaFego8LB3cZPUkKbtW
 ZAQ3SYn8py1b6es2c2Hl9XUfYdG/EJGUSidLns32fvI8GrLOOlwkCtgMDgfc9SZjj4lx
 uue/JyKlNPMP/UrSbp+mwnaHdwEYG5UuCgBMuL3WmFJSzBwAkaFNGxIrAvZtAx2R8JjS
 nGwtNSqgs8Jw47GnbN4iil8SAztQDny93562wjVRHPGM2rITTaIuBA0B8jLCmX0dCvwl
 KJNg==
X-Gm-Message-State: AOAM532JQhcFv/E1iwy30tFSpBVyen9ma5vhygWl8iSku4gcItFzejo5
 aUzNGteiR38tuZLZjma2kiqpnw==
X-Google-Smtp-Source: ABdhPJw8RZbZSLGMEc2ndPTw06YXtCitfg1ZKJ/xrkVPyubmbaf6haCN+bTuDb9k6W+bPk20b0z48g==
X-Received: by 2002:a7b:cd01:: with SMTP id f1mr609530wmj.177.1621279938739;
 Mon, 17 May 2021 12:32:18 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e10sm18928907wrw.20.2021.05.17.12.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 12:32:18 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, linus.walleij@linaro.org, olof@lixom.net,
 robh+dt@kernel.org, soc@kernel.org, ulli.kroll@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 2/5] dt-bindings: add vendor prefix for edimax
Date: Mon, 17 May 2021 19:32:02 +0000
Message-ID: <20210517193205.691147-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517193205.691147-1-clabbe@baylibre.com>
References: <20210517193205.691147-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_123220_203341_18F2AF98 
X-CRM114-Status: GOOD (  10.24  )
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
Message-ID: <20210517193202.ZDVVzRB9vy941yYUFxkahp0Dx06LL9lEaoeopewn-Tk@z>

Add vendor prefix for EDIMAX Technology Co., Ltd (https://www.edimax.com/)

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index cf69dfd3d522..003f6354db04 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -329,6 +329,8 @@ patternProperties:
     description: EBV Elektronik
   "^eckelmann,.*":
     description: Eckelmann AG
+  "^edimax,.*":
+    description: EDIMAX Technology Co., Ltd
   "^edt,.*":
     description: Emerging Display Technologies
   "^eeti,.*":
-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
