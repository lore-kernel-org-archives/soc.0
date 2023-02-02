Return-Path: <SRS0=3ngf=56=chromium.org=wenst@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32A4C05027
	for <soc@archiver.kernel.org>; Thu,  2 Feb 2023 10:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C46DC4339C; Thu,  2 Feb 2023 10:40:32 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CFA51C4339B
	for <soc@kernel.org>; Thu,  2 Feb 2023 10:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CFA51C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f49.google.com with SMTP id f16-20020a17090a9b1000b0023058bbd7b2so788471pjp.0
        for <soc@kernel.org>; Thu, 02 Feb 2023 02:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PexX/V0c+w21JwIUEKWHSc7QoYhjon5sMZqAPNZ76zo=;
        b=DSuetR/giXwCr7xl33WxRX4Hvfsvzbp00ZCg/YSjdN59Da6JVxqgvCvj75vLHYOwOH
         ltR2lE/nv3y8xMordBsJkMhC+SwyN0Z4Lod37n8akuTFQ6P8lxDmG4ljBUXUe9IP+sU6
         IB38AJQ9pTHm5zxM34c1mAK1pHIn9Y40T5m+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PexX/V0c+w21JwIUEKWHSc7QoYhjon5sMZqAPNZ76zo=;
        b=Jgt/4g58igxjnbfWWJPONGmR4r/s5Q9/0FYsaHvJB0Ksi8Qc2CcFTAH0BkjSEoI/+l
         EwW57i7WCWFeOJTZJQOKLKr5tJes4aNZpBgM4AfO4mLgRY1Nkt8YFQWIicY5mSm8mwJx
         Xminsd/f+Bx/UU3wzqcNuOmn4NnYdAyba0rsRq2mviy7MvKAgNyXfi3RhHNN6wLUdwys
         +b9LTHrMvnIcwy7NRzYaBJ1BgCtUSGii5ycsDeM75HJJVvuLxqIVwbOf9guaE9GNnRmt
         p+aGGhcY12pRvCb/k6wOQtlL2LE3NBvsUVo9Lq8HqzNCfQ4N1hyNp/IeK3Mv7JCHI0cb
         kpvg==
X-Gm-Message-State: AO0yUKXAJlfHhSZOSXg4EpvCjzEvvG0n+W9uz+hXgR0WuOG+JRC1sAKS
	FHqj/WDVizi/x80ZByO7h4AuZpdQIFK0hLVb
X-Google-Smtp-Source: AK7set+sw1iMXd99AlKQYQp6TJaHlmdMupoaYMb79i2bbcIgiPzqroi3GNubMJIp+d05hWuhQI1HZw==
X-Received: by 2002:a17:903:32c9:b0:196:2e92:e546 with SMTP id i9-20020a17090332c900b001962e92e546mr7508552plr.44.1675334430339;
        Thu, 02 Feb 2023 02:40:30 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:68a6:9bbd:a36a:4d1f])
        by smtp.gmail.com with ESMTPSA id jk22-20020a170903331600b00194c82c2a7bsm13365706plb.224.2023.02.02.02.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 02:40:30 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	soc@kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8195: Fix vdosys* compatible strings
Date: Thu,  2 Feb 2023 18:40:14 +0800
Message-Id: <20230202104014.2931517-1-wenst@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When vdosys1 was initially added, it was incorrectly assumed to be
compatible with vdosys0, and thus both had the same mt8195-mmsys
compatible attached.

This has since been corrected in commit b237efd47df7 ("dt-bindings:
arm: mediatek: mmsys: change compatible for MT8195") and commit
82219cfbef18 ("dt-bindings: arm: mediatek: mmsys: add vdosys1 compatible
for MT8195"). The device tree needs to be fixed as well, otherwise
the vdosys1 block fails to work, and causes its dependent power domain
controller to not work either.

Change the compatible string of vdosys1 to "mediatek,mt8195-vdosys1".
While at it, also add the new "mediatek,mt8195-vdosys0" compatible to
vdosys0.

Fixes: 6aa5b46d1755 ("arm64: dts: mt8195: Add vdosys and vppsys clock nodes")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

Since we are at -rc6 and Matthias already sent out pull requests, I've
CC-ed soc@ so that this may be picked up directly on top of them. This
should be merged for -next.

Thanks

 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 5ffcfd8da31d..93ba274c3f42 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2439,7 +2439,7 @@ vencsys_core1: clock-controller@1b000000 {
 		};
 
 		vdosys0: syscon@1c01a000 {
-			compatible = "mediatek,mt8195-mmsys", "syscon";
+			compatible = "mediatek,mt8195-vdosys0", "mediatek,mt8195-mmsys", "syscon";
 			reg = <0 0x1c01a000 0 0x1000>;
 			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
 			#clock-cells = <1>;
@@ -2625,7 +2625,7 @@ larb1: larb@1c019000 {
 		};
 
 		vdosys1: syscon@1c100000 {
-			compatible = "mediatek,mt8195-mmsys", "syscon";
+			compatible = "mediatek,mt8195-vdosys1", "syscon";
 			reg = <0 0x1c100000 0 0x1000>;
 			#clock-cells = <1>;
 		};
-- 
2.39.1.456.gfc5497dd1b-goog

