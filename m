Return-Path: <SRS0=vM+f=B3=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DBAC7EE25
	for <soc@archiver.kernel.org>; Wed,  7 Jun 2023 05:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EBB38C433A7; Wed,  7 Jun 2023 05:00:38 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87741C433EF;
	Wed,  7 Jun 2023 05:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 87741C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-75eba89e373so9711485a.0;
        Tue, 06 Jun 2023 22:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686114032; x=1688706032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9dG+oN5uOmuQYXLewl1nCF0/Os/UQTTZl0+MY2RxWE=;
        b=SdrAJREOI+sSk3AZUFjzv72WSD27GpJcA1nyiB2724Og5P+HW5QX9Xqth8+vQZtcEz
         mSZ4whmu3dTlsuDUt1TwUohJ3ksU37hR2kVL6IXdIqh6PlQ4gPyNqgjgDlv7OfkscSUm
         XodMdWWWj3Uh04ktiIZZkgHQTmppAyN07Cd+5/DLQNtlQ6BGz15H6z3G7A6uNJIH841b
         vIHs/j1KCsJ3z5lPEU33IcI098Vh2VfnLR9/i2NOg2CZ/y5grw3UZh5Iza7ww6QfwgwR
         Wf58VXE+D11mgZ3zpK+hZer6i08ITs8T+HbD+adeHSdpXpd/5QXwSctLmGAn58wrUZfN
         A3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686114032; x=1688706032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9dG+oN5uOmuQYXLewl1nCF0/Os/UQTTZl0+MY2RxWE=;
        b=C36N2UBbpdGW4l/XzGT3/8cnapqzGg3emYVN1fB+HLDnGiZvHRKg7OSj54e+kVCpl6
         q4I3eTqiraq2HnbUm3yJ4uDoDeuF6b4qHjBNgH8WAdfmDDG3B8uBG68XLEC3AJE302Ro
         hKGmXok4GrSx4/meXk03GQ7A6/2KjxPPhRlqZZLSyyiRS9CjFMsqJRJcXvkmZONXzQk2
         WOKoQNMghvYxh1FQK1j68SoR0YE3ouCkVWxAihyXpdfy8ueCM5CvgjDTgtfnmwtgN28Z
         mJVC86hhO7vIecLqRm/PeBxCNdeHi/ELIQghdbf+jrrkiTDYzMa2Vb4ICDjmuBBTGZXg
         mAOg==
X-Gm-Message-State: AC+VfDxUh79Jghlzxsz73DNB81/rFW3lqN1qb8mvr8U5yKTVFFG+wo9T
	jJyd+CRJyWEh6IQd9e+aHs72bYcp8Khxzg==
X-Google-Smtp-Source: ACHHUZ5C7dMvWXGT3YbALPD4bql/TD9qfA1bGA2rfy9uV4o0Ujf1mwt/wVFq0zAMLR6tB3wYq6eQnQ==
X-Received: by 2002:a05:620a:888:b0:75c:ca53:d5fd with SMTP id b8-20020a05620a088800b0075cca53d5fdmr587802qka.27.1686114032458;
        Tue, 06 Jun 2023 22:00:32 -0700 (PDT)
Received: from Latitude-E6420.mynetworksettings.com ([2600:4040:2007:9800:c358:f4f2:89b6:ca7d])
        by smtp.gmail.com with ESMTPSA id m1-20020ad44481000000b00621430707f7sm5848980qvt.83.2023.06.06.22.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 22:00:32 -0700 (PDT)
From: Rudraksha Gupta <guptarud@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org
Cc: Rudraksha Gupta <guptarud@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/4] dt-bindings: arm: qcom: Add Samsung Galaxy Express
Date: Wed,  7 Jun 2023 01:00:20 -0400
Message-Id: <20230607050025.86636-2-guptarud@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230607050025.86636-1-guptarud@gmail.com>
References: <20230607050025.86636-1-guptarud@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for Samsung Galaxy Express SGH-I437.

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d9dd25695c3d..133d69b2b73d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -191,6 +191,7 @@ properties:
       - items:
           - enum:
               - qcom,msm8960-cdp
+              - samsung,expressatt
           - const: qcom,msm8960
 
       - items:
-- 
2.34.1

