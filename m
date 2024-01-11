Return-Path: <SRS0=3nnK=IV=gmail.com=zajec5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9149AC4707B
	for <soc@archiver.kernel.org>; Thu, 11 Jan 2024 10:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F419C433C7; Thu, 11 Jan 2024 10:39:40 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C210C433F1;
	Thu, 11 Jan 2024 10:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5C210C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50ec948ad31so3858052e87.2;
        Thu, 11 Jan 2024 02:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704969577; x=1705574377; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPI1X20P/Je0ba5yFdcffHFwmZ27vo/Hq5v/+iKRorM=;
        b=faYXnCwUOdrOvvmf7Imkg7g02bmau17PkF820pwv/dVVFAsDrF/D7oCd3hj8eRS0QD
         Qo8VKHlYfeWVLeVW252eMr7Y8RrcOFwX4aJLPNGhMtyz4K8aC62r+VzizowU62QN2uM+
         ZcPkl+n0OSkJskjtFZrQ9oX5YAxaXEGmyICIw9JHJ2Q4mzZMe3sAvoUKONG4ZCPHP41d
         hL/oHwpMHHwPlyj85MmTXqPb9iEM2JQsnKeGCXG2/98Svm6tHw0ERd+DXi9+RhV31zTd
         yvAEePN4ctBEiOv+IM4PA1snyW1aTP7CEXBgfMT9idljiSIXVfObherdLHRUOOm3EY3w
         Ejpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704969577; x=1705574377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPI1X20P/Je0ba5yFdcffHFwmZ27vo/Hq5v/+iKRorM=;
        b=BRl8p/SwzYi0m6LhHYfJBilKEDY1IOXsQZ/KZnAAJU79RaNeD8Fe5a1MvdP/N4qZ5+
         AXl/34KzX+osY5KAwDWdyW2gKLmBCtXwjmP8EFujdF2va5hg66Hw+mNXe47c+jOe9uLe
         UkFbTHUVb8GCijWLnqV2At5+hd+9d6kjDrI50jm7bsCUg2Xp903uXSGFEP1WwML59HVJ
         ra2pXjWiRWNEy6LBwXETWENAnoqoD4uxC++ldayDsrD2A+z/JpONgSAF1crIbVbSjVgA
         LjRD+ly3e6Phu+TjQnFhVzVzlxmFZPAdajeZ89rlCuRefCXY9oNusjO9WtyKyVFmlrU5
         FmaA==
X-Gm-Message-State: AOJu0Yx9cpwCpZhJlOkhWEP7gkC1vpc+f34Wcb64YiIf5IQOW8MWC3Vg
	D8vNfeyrCjOCDph5Yu4XKAU=
X-Google-Smtp-Source: AGHT+IEpoHyDf1gqLg9M/jmdtKfdJe1FslovTRkFcPaMSTdBqVE/TypY2qP1lbz07KRoJPguDTflnA==
X-Received: by 2002:a05:6512:31d2:b0:50e:7ade:d394 with SMTP id j18-20020a05651231d200b0050e7aded394mr636997lfe.0.1704969577147;
        Thu, 11 Jan 2024 02:39:37 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id d14-20020a170906c20e00b00a298e2f6b3csm407179ejz.213.2024.01.11.02.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 02:39:36 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	soc@kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V2 1/2] dt-bindings: arm64: mediatek: Add MT7981B and Xiaomi AX3000T
Date: Thu, 11 Jan 2024 11:39:27 +0100
Message-Id: <20240111103928.721-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240111103928.721-1-zajec5@gmail.com>
References: <20240111103928.721-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

MT7981B (AKA Filogic 820) is MediaTek's dual-core ARM Cortex-A53 SoC.
One of market devices using this SoC is Xiaomi AX3000T.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 92dbfb862757..12cf02b30967 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -82,6 +82,10 @@ properties:
           - enum:
               - mediatek,mt7629-rfb
           - const: mediatek,mt7629
+      - items:
+          - enum:
+              - xiaomi,ax3000t
+          - const: mediatek,mt7981b
       - items:
           - enum:
               - bananapi,bpi-r3
-- 
2.35.3

