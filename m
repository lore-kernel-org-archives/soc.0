Return-Path: <SRS0=+SEu=DV=robh_at_kernel.org=rob@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D3FC00528
	for <soc@archiver.kernel.org>; Fri,  4 Aug 2023 23:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EED51C433C9; Fri,  4 Aug 2023 23:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C0DC433C7;
	Fri,  4 Aug 2023 23:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691190275;
	bh=10xI+HjYOYbP7/HZy6qa0eDd3rO5r9dGZDks2kyrxE0=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=B0EVsNRZtz+8yQpyUje12rZJUflCilAdoN3VAcgm7gvsr46t1+FysJed1KvgGN4S3
	 U9JbN0rSyaC331hEW1wNF4aeDcMz6GZ8uXvBL/qgIb5kETy8g/UmESoKFOvxmKkwos
	 SOrCuQcjeeet99Ys6aH0X2VOz0xebTCmQP05wzK7MlGvfMPI9UQZP02F9rW09S7JTE
	 8t5kOG10C/k/bdIqgikri+7rOfHERunKv3EF/uNm2VDB1kEOJxup63feEQFg15ZTjS
	 M96Qb00ltglGDfRcX/1MGci7YlxxTOyhyFl6xYxLsM5rCHT4BqTPO8sMEN44/DCgcd
	 vTFczCfLaxeZw==
Received: (nullmailer pid 23766 invoked by uid 1000);
	Fri, 04 Aug 2023 23:04:33 -0000
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [RESEND PATCH] arm64: dts: mediatek: Fix "status" values
Date: Fri,  4 Aug 2023 16:58:13 -0600
Message-Id: <20230804225813.12493-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The defined value for "status" is "disabled", not "disable".

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
Arnd, Please take this directly I guess. I think Mediatek maintainership 
needs some help. Maybe AngeloGioacchino should be co-maintainer as 
that's the only response I seem to be getting.

I think for future .dts patches I will not bother splitting them up by
sub-arch because it's a pain to chase down the maintainers to apply
stuff in a timely manner. /rant

 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index e4605d23fdc8..86cedb0bf1a9 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -585,11 +585,11 @@ &pwrap {
 };
 
 &sata {
-	status = "disable";
+	status = "disabled";
 };
 
 &sata_phy {
-	status = "disable";
+	status = "disabled";
 };
 
 &spi0 {
-- 
2.40.1

