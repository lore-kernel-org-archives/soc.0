Return-Path: <SRS0=1/go=LM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2B2C48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 20:57:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6829610C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 20:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6829610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jMjZmYkh71neAPyIwnQv5UE8xUdQASIi0BMg06tp/ds=; b=OoctE4z7OX3i3E
	amHaNGF0lgx4m/68quz/BKiJ+2rbzaSnsOxqZ7mkb2MtkpugAup39q+iOEIlOjsAPzlSQzrkRQ7TY
	hvX/Uz4qvxbGEe2CZyfFr9sBPzxLqSjul1J5fKWsafm4jL5IhQqYHuEILHWqhv91boDZ2jdQGVnSo
	qrEvNdG/h0NX2eWcZAXzHrChhJ//93PT6Tup8lDIGn0Mwn8U9QXicuiOiwjVOqBqLyJhXMtbHZTXr
	iC9+5PkiyifxTSwtUgT7ZtS8t0irhoS9ltYyuy98NEtXR7ODAJgaHpwjtUibm8Faf9/tFahLiJ0uZ
	PyxsyQFSh9xjB9XAJ8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luLX5-00FVBF-43; Fri, 18 Jun 2021 20:56:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luLWh-00FV6t-T9
 for linux-arm-kernel@lists.infradead.org; Fri, 18 Jun 2021 20:55:46 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 c18-20020a05600c0ad2b02901cee262e45fso6463520wmr.4
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 18 Jun 2021 13:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nu7i7hLOMrckKPqlCt5sNsYJcGzmceqdUWEuYkCyCyg=;
 b=HVFgLbvqQNXI6qA1sE6VpDEA4GddUHSB6CrLP4qKefQQSXz7W0Ds60omAmp8dIYzWd
 RtyqIEQ2vGMs49bTn+D+djIxm1wpBVX8S1g3HxRCh4Q4y0Fo/4+mS13GxyqbjGdNV45k
 ZDr80L0ZCnDnnGgMclEu8CzEQPo00f/Lgpn/tYLCML8HoMtdqlD+rQsWjGjTj3stoIga
 +TlDXRJhI79hfWcmRVS41GOl0fnRkmCijWNQatXqHszA8Cu8elI2MiwVGlX1xk7uiTaU
 BzANaHT9jvyKszDwr7pPGlKqdtGezM5AJg99C/Hft/5I/NkF1o2vs3+T3k67Ijh8w6nW
 X4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nu7i7hLOMrckKPqlCt5sNsYJcGzmceqdUWEuYkCyCyg=;
 b=VXbu2yh4NryCBD/UdjhYGpCYI5PEnsBlg7513fvU0tO6ZGK6ULg9Y6BO/osdVWIGqe
 mn1e7Kqs1BvxCeo491CAzhrehC1A7AwYBpKRHo+47WX6wCPh3+2aKtqPoOSVMJDzcn9y
 FaDDX6J2ZU4EGqeypIZ9tUlULI/DRrqYXYADMELcbAq4sbr0aYW95N/42t/YSBdul2FL
 PDNCDamIainAwO9IRgTZQ05qfldYYusDNDmVf1trjWkZ2Yu3vVm03TCb76w6v+EYhC2X
 3w45gxPSEJ1cafUNnlfKLPUh0g/y7jhgYfhRRWA7kl9xLQ7dtktSL/618HLnGw7oyEf1
 GWwA==
X-Gm-Message-State: AOAM533F2VNVnya6YMyDFsPzu7RBrwjPxzQ0kLu5zR1zR0auJolq+/UI
 03/fj0KcjxCOtnFOPrrHOTNEWw==
X-Google-Smtp-Source: ABdhPJyUSyW4TuFB1EWQs4HKnLWcAB4ImpT6brXRKzrXolm5W20JLasuhMVSS3TqF2YW4sXrOe3zeQ==
X-Received: by 2002:a05:600c:282:: with SMTP id
 2mr13775691wmk.98.1624049742338; 
 Fri, 18 Jun 2021 13:55:42 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j12sm9745476wrt.69.2021.06.18.13.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 13:55:42 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, linus.walleij@linaro.org, olof@lixom.net,
 robh+dt@kernel.org, soc@kernel.org, ulli.kroll@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 2/5] dt-bindings: add vendor prefix for edimax
Date: Fri, 18 Jun 2021 20:55:30 +0000
Message-ID: <20210618205533.1527384-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618205533.1527384-1-clabbe@baylibre.com>
References: <20210618205533.1527384-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_135543_977789_A04E42EB 
X-CRM114-Status: GOOD (  10.37  )
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
Message-ID: <20210618205530.WUdE32OjeZE-xEh2g6bhqakCc4UwtmCKscqG-DUshHg@z>

Add vendor prefix for EDIMAX Technology Co., Ltd (https://www.edimax.com/)

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ed1769310f0d..800d0536be75 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -333,6 +333,8 @@ patternProperties:
     description: EBV Elektronik
   "^eckelmann,.*":
     description: Eckelmann AG
+  "^edimax,.*":
+    description: EDIMAX Technology Co., Ltd
   "^edt,.*":
     description: Emerging Display Technologies
   "^eeti,.*":
-- 
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
