Return-Path: <SRS0=DTuh=WI=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB89CCA479
	for <soc@archiver.kernel.org>; Wed,  1 Jun 2022 15:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 279AEC3411F; Wed,  1 Jun 2022 15:47:48 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B9C1AC3411C
	for <soc@kernel.org>; Wed,  1 Jun 2022 15:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B9C1AC3411C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f46.google.com with SMTP id i10so3499794lfj.0
        for <soc@kernel.org>; Wed, 01 Jun 2022 08:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s1I1Lu6vDnv+FXCTPOWPHqa85mx5mVRb44SdNNE1HaQ=;
        b=5gR5CbreQ7srjG4Ym7Ultz+/q2nE9r/GfUDpbd3uPQOeB+iu3HtDcbNu0p5kZmpUVg
         fPsNMYipnB9IVUAWme2bDC4FLqYU/14GMYY6J4Y3SCThHAjhYedfsTWBDiDxtcIn9H49
         5qyC6kVfcQssWlVcxU/8uB8L8K503iFBC0fVZlOcVQZCQoXP1w1YMCTqkkvxjFUH7XjT
         k2NSE+lny5cnmbM8CvqoOxLSaP8P9QHuGLm7TzOLwct2gxHP/CHXtxvtLi9Rt9/vvAsO
         QPi7t527ylkC9oTqEyokrkmCuXLU8nBZZyCyqKVY0qN8ifyP6ypEoNYx8ZgRmj8LCmZL
         xi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s1I1Lu6vDnv+FXCTPOWPHqa85mx5mVRb44SdNNE1HaQ=;
        b=Y+NVQQZ1g9MNItV3eJZZVuslrlshX5dR6Ih4BfoSGAuHCElzcVMlveAkj8Dp0sE8J/
         eipavgXc4gvgzagSclpo4kINKelGofFCbclPPQtkU75H2zLUcvoltRUCSHoIX1I+zlX9
         sM1LO+RjvmDF3HqigXOuWFD/tnZ6D/zsS9kpl4NIGGGapq0xIsij/+FiODfUeGMBFSAx
         KrMl3XZjXABKFY2W/DdX0Dzv6+JjTqooiDFi4YqBkX5+VV4GQCOEmTV+hynjMcDita/2
         orOiZD2y+1fp+1lJ1Etvk+94Oo+KX7zsq482OMlqB6NbQyIvq2uQJAp5T9jUKdVvyiu+
         gS0w==
X-Gm-Message-State: AOAM532vLkTL1/ESf9jQFY+y7bMt7q6z9MAUvgxEyiFgddZJsXQj72Vg
	a8RnN5F7ZmK6o+QPCDC4MSTYXCELVhcf/w==
X-Google-Smtp-Source: ABdhPJxDG73AD76s9kMvKtHwHRysyphsIohDnmLglBHeLvKPQfhd9oKlb71wR7C2XDycAqZr0Ev1hw==
X-Received: by 2002:a05:6512:6c9:b0:478:dc36:b25b with SMTP id u9-20020a05651206c900b00478dc36b25bmr13149300lff.369.1654098465821;
        Wed, 01 Jun 2022 08:47:45 -0700 (PDT)
Received: from panikiel.wifi.semihalf.net ([83.142.187.86])
        by smtp.gmail.com with ESMTPSA id f10-20020a19380a000000b00478ad871b25sm431219lfa.145.2022.06.01.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 08:47:45 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: arnd@arndb.de,
	olof@lixom.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	dinguyen@kernel.org,
	amstan@chromium.org,
	upstream@semihalf.com,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v2 5/5] dt-bindings: altera: Add Chameleon v3 board
Date: Wed,  1 Jun 2022 17:46:47 +0200
Message-Id: <20220601154647.80071-6-pan@semihalf.com>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601154647.80071-1-pan@semihalf.com>
References: <20220601154647.80071-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Chameleon v3 to Arria 10 boards.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 5e2017c0a051..400543fbe78d 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -26,6 +26,7 @@ properties:
           - enum:
               - altr,socfpga-arria10-socdk
               - enclustra,mercury-aa1
+              - google,chameleon-v3
           - const: altr,socfpga-arria10
           - const: altr,socfpga
 
-- 
2.36.1.255.ge46751e96f-goog

