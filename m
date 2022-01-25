Return-Path: <SRS0=RUdi=SJ=gmail.com=benwolsieffer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90E6C433F5
	for <soc@archiver.kernel.org>; Tue, 25 Jan 2022 02:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A77AFC340E5; Tue, 25 Jan 2022 02:10:43 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E2D7C340E4;
	Tue, 25 Jan 2022 02:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E2D7C340E4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id w6so21998455qtk.4;
        Mon, 24 Jan 2022 18:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JQ08bNvQMf8xaiplyU2DXnMjp5Aby3EKSZotltu5q8c=;
        b=WH2j+oCodFc1Yg9Ni0NDUttB7JOhwscDIgD9gCV7Df60jfKqGbatfOL7XTjQlA49yA
         ZIm921dGBfGiNW4LAb4MGAfUZ1h5Jsd0lsPtDdRF8ZrcWIRjtJbobLjZ7nYPpkiYCHtE
         apWYwUSWICpBDs6drQVAkUuq4Xhw2e7UJ+NQss9tbJ8jeKYcsGf8KzKuPlExk/XNFE1F
         hgTuEjEL10n/hbup+1XhabHypLOzIy149cetX1/R8QFCVyznBDFuqqJVkt5F60a+/vmc
         kGa5wJhUQ4KlhDNzUaxAC8+9ntpQnr7T/DDBwehxQ0XyeoP62S8qhmv//wui1slS0aSv
         X28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JQ08bNvQMf8xaiplyU2DXnMjp5Aby3EKSZotltu5q8c=;
        b=SIiSXkhDwgMuF0u5VJLIMAQnJF/qRWcy/6yUXsoI4B9gt7ZBFpZGtsoDtHSD46XRPI
         LmuN2CZGW7DZkZN/Q0hTF8p+7xP37pBpX5rTnIFgRqgPuSqAu53MS8rz3XpOMKfujQBD
         5/NAiGSlvKaR8bb7Mx9vtUfStxQPH+YqQJH+jn6HtwJhoSO124K3jmHKptLATTQ+v9ft
         IblTyIX5qCaH+z7Ib9P4cURxWMN9dHuXAhYmh6XTui3LIYv1AjPArPwO1ybAawDU2teU
         D4VMhfvm9Sd/tCv5fvxIOE9SHxnxEm60D3kPIsf9NMMKD3acdtomFwJEBpB9T24sBtqZ
         e/JQ==
X-Gm-Message-State: AOAM530HYdzzDJZGqkARcHnpeNxvvA4yc8oe2YFKK834HSTh4x5XHQL/
	SLX0kLdDOAAZ44EWnfq+6FQ=
X-Google-Smtp-Source: ABdhPJwZBAfW0IlBXV7hYkVdYLtM6cmtQtfsb2+NhozfesQ8eWj60l8cjw3Py0M6/eOhObwvM3BOiw==
X-Received: by 2002:ac8:5810:: with SMTP id g16mr14599532qtg.183.1643076642303;
        Mon, 24 Jan 2022 18:10:42 -0800 (PST)
Received: from Dell-Inspiron-15.dartmouth.edu ([129.170.195.217])
        by smtp.gmail.com with ESMTPSA id m190sm8024845qkf.58.2022.01.24.18.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 18:10:42 -0800 (PST)
From: Ben Wolsieffer <benwolsieffer@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Ben Wolsieffer <benwolsieffer@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] dt-bindings: arm: qcom: document HP TouchPad
Date: Mon, 24 Jan 2022 21:07:04 -0500
Message-Id: <aa59002aeae45a95097300213fc34490aa8db250.1643075547.git.benwolsieffer@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643075547.git.benwolsieffer@gmail.com>
References: <cover.1643075547.git.benwolsieffer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding documentation for the HP TouchPad.

Signed-off-by: Ben Wolsieffer <benwolsieffer@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 370aab274cd1..f7418a8a49fc 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -119,6 +119,7 @@ properties:
       - items:
           - enum:
               - qcom,apq8060-dragonboard
+              - qcom,apq8060-tenderloin
               - qcom,msm8660-surf
           - const: qcom,msm8660
 
-- 
2.34.1

