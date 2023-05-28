Return-Path: <SRS0=8gjP=BR=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B12C77B7E
	for <soc@archiver.kernel.org>; Sun, 28 May 2023 00:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0B5BC4339E; Sun, 28 May 2023 00:10:45 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C09DFC433EF;
	Sun, 28 May 2023 00:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C09DFC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-3f6b24467deso11002141cf.1;
        Sat, 27 May 2023 17:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685232643; x=1687824643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnTseOZCoY+CK3HtI+8c2hP/MGTha5onAmFTzOp40tU=;
        b=qPT9E0edttTYNdnHFlE81rQuGTNJhwsmQPQnZ7ROVuMiV/mXzz0iptAla7rW9vcOPC
         4khy8mjXOeVCDVA41H7wzd/gCbAZe5lcCQOACSrmQDJ3ex5xM0B9VJr4G1435wCxYumn
         M7SNZd6GNh+xbi5T9vSzsYYVaquE1Nb5vIcDtSluj+2XxulMuh6x5B6OIbpG3MkzVSPH
         s0sJ+jQ3i9TWVPchZBc2JZB08rBUuMAA4moBEEcK70yzfhmBgbHKpvz6bzJbMvuzMMv4
         w9EMpjGyJBJsgGYy0ESYpzD5+PoqeRiDWpAB4HGbeZGwzahT6Of86nwJzjsJ3o4V/RBs
         yW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685232643; x=1687824643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnTseOZCoY+CK3HtI+8c2hP/MGTha5onAmFTzOp40tU=;
        b=RRs97erRZGk+x3Fxq/EOL3t3V7bOKu5kz3ME3dqrR55D+Z60MaasKNRXB2CKAlrx5u
         6rX55mghoRGM3JNXkOBgZM9UfJy4ZZFKzwlTiVsLm0bUJ8mu6OpcmdenykM3Hvqdgqaj
         UxJtWoviKzUnbR4Ax8RQHk1uYKgqsFSanqQqUiYdQbPbuzXyHP0WkZ5UmvhogrQE/UPU
         34PaMuJdoi+bkVg0XdYqtEXLU2LyAOeka34Qf99Bjj8VwsPkcaJzde3o+JAsMoL6aPi5
         VuHMu7Oe1gicEYb9agmfsV8HspQLjW14C+mk1VccHFdRLGpKKVVuF6m9Ddaalknq633u
         hogQ==
X-Gm-Message-State: AC+VfDwlKB/2Bfs/MiBd6QdKnzzTwVr5ZaosTM4hbyoVCU8pd+YYRoDI
	HZylrDrldRCDRWAVHOa/1H3bLAL08tiHlQ==
X-Google-Smtp-Source: ACHHUZ7Z5un5mSANVyiGI2lseOWl6HLDVeQL+/2M1exfjLawjBv+HeCw1oypNDyiaSBwSNJRPhrrXA==
X-Received: by 2002:ac8:5f06:0:b0:3f5:1d57:9c22 with SMTP id x6-20020ac85f06000000b003f51d579c22mr6537934qta.51.1685232643224;
        Sat, 27 May 2023 17:10:43 -0700 (PDT)
Received: from Latitude-E6420.mynetworksettings.com ([2600:4040:2007:9800:28b2:2867:6311:b7d0])
        by smtp.gmail.com with ESMTPSA id t18-20020ac865d2000000b003f6a7ab1450sm2518454qto.30.2023.05.27.17.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 17:10:42 -0700 (PDT)
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
Subject: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Samsung Galaxy Express
Date: Sat, 27 May 2023 20:10:06 -0400
Message-Id: <20230528001010.47868-2-guptarud@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230527040905.stmnoshkdqgiaex6@ripper>
References: <20230527040905.stmnoshkdqgiaex6@ripper>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for Samsung Galaxy Express SGH-I437.

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
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

