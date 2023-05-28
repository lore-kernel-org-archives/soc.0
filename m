Return-Path: <SRS0=8gjP=BR=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4391CC77B7E
	for <soc@archiver.kernel.org>; Sun, 28 May 2023 00:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28D23C433D2; Sun, 28 May 2023 00:10:52 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3ED5FC433EF;
	Sun, 28 May 2023 00:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3ED5FC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-3f7f864525fso24514001cf.1;
        Sat, 27 May 2023 17:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685232650; x=1687824650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlLPGYxNqRLcO0iwNntzpwA4a9ygAShxKuuHe4rrdxY=;
        b=O8OBZDfJldx3WjGaMSWA209tbN2ud5V/ZxpbdgnY06AL5QkHNzuDKshoDnTm4UGSha
         8wrfuCpJdfMbi/ii+ZrcaRuHfhb1sjs/4e2OgIPT2Lwxq/Dd2KTfIuz23bXEHCvPt/KY
         g1pJoDlxPNDNo1rLwgLjjA3twk6gS4QpNls3xiF2Uc5ZaKDnUCMtRUPigtNLt+L04hl7
         ssgg68y+CtGn3IiMXAqYW6THuxpwwK22EXPW4tSo7dCR8HCnNKDfY6ZSpkz5Aih7DcDr
         rOgjw71PXUhLVR003yNrUqp+aEpMbkT70jAYuUvYiPrGtZB45AygoC+qnV19sp/PEsrk
         iFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685232650; x=1687824650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlLPGYxNqRLcO0iwNntzpwA4a9ygAShxKuuHe4rrdxY=;
        b=XoA0G+yrOVv7B/8VgbvwkztHbPTMPTLv5nrXUpizU+biTwXMxTgeBLt8OG+8y7CZoT
         W9k/ac4gk+DJ5+uca/JscQPXQg734AzHR8EMAc6qjNCaA2/q+Syn1MuURpyE1V+94n89
         zZe2Kkgd5qxq6QKCBhfVl2tNGyrptWW1clQf54j4TFDUyKlOdSPnA70/t5of0AND4XLo
         CuKIowqXqTkGJzOdXFDUelxpVs59JtMUpq6ouPmNMWuPbhuQulas/kIlTzLl2v7m4ERA
         FZQmmKps1fqDiX2K3OehujhpL3FOhLZhI+8UGbF2jRlIxwjCCEb5lrIQnE8Qs6wBdx7K
         NxCQ==
X-Gm-Message-State: AC+VfDwyx8sqSDRhxicyOcbRQk4KKKPT9yA/KPv9oXjejpFzJ0pYpQuD
	sS37G7f91W+1OG3e2mzJPpSI46HqQzrwOg==
X-Google-Smtp-Source: ACHHUZ48t/aUfi2p8Ea4j28BZnaKxNFrtgKFnDSLOZlkMiUl6JjTR/leIIiFiv0of4//m3yyejA/mg==
X-Received: by 2002:ac8:5811:0:b0:3f5:1f9c:5b35 with SMTP id g17-20020ac85811000000b003f51f9c5b35mr5909777qtg.63.1685232649723;
        Sat, 27 May 2023 17:10:49 -0700 (PDT)
Received: from Latitude-E6420.mynetworksettings.com ([2600:4040:2007:9800:28b2:2867:6311:b7d0])
        by smtp.gmail.com with ESMTPSA id t18-20020ac865d2000000b003f6a7ab1450sm2518454qto.30.2023.05.27.17.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 17:10:49 -0700 (PDT)
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
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Rudraksha Gupta <guptarud@gmail.com>
Subject: [PATCH v2 2/4] dt-bindings: Add qcom,usb-hs-phy-msm8960
Date: Sat, 27 May 2023 20:10:07 -0400
Message-Id: <20230528001010.47868-3-guptarud@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230527040905.stmnoshkdqgiaex6@ripper>
References: <20230527040905.stmnoshkdqgiaex6@ripper>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds qcom,usb-hs-phy-msm8960 compatible

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
index aa97478dd016..6309c8e9d0b0 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
@@ -40,6 +40,7 @@ properties:
           - qcom,usb-hs-phy-apq8064
           - qcom,usb-hs-phy-msm8226
           - qcom,usb-hs-phy-msm8916
+          - qcom,usb-hs-phy-msm8960
           - qcom,usb-hs-phy-msm8974
       - const: qcom,usb-hs-phy
 
-- 
2.34.1

