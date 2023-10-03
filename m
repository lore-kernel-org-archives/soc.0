Return-Path: <SRS0=neRB=FR=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB3EE7544C
	for <soc@archiver.kernel.org>; Tue,  3 Oct 2023 11:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6C79C433C8; Tue,  3 Oct 2023 11:13:58 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7774EC433CD;
	Tue,  3 Oct 2023 11:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7774EC433CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E024F6607324;
	Tue,  3 Oct 2023 12:13:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696331632;
	bh=ZIRAP2qm7XJoF1kXFQyj8XANIl0j4JfaME1N/oAEhmA=;
	h=From:Subject:Date:To:Cc:From;
	b=NKdIB6BoXyaqPjYoZBhptnFNXxedY9hPj6uZn7PBF1h8SrjggM7C4P93cU5JVDnP4
	 WK5iUR2Fw6HxFQSIKcoi4VtIHcMyoha0o+Xfs8vYE7YV+lLxwAwi9YVFp53KJkS6Tq
	 Zc1E7GWuXKx1mI1EMhU6PSmE28BJaQj21iFDg024riBIubFUgzoIaAo+jFOndr/LR0
	 7ph25s+MwZ3toIN0xA7/SicCUiDP54fnt4ZsPiRnq/bgJP+rKlOAyN0E2eCLZOYgCd
	 NHbec9BbQ64U8EDaJvhLBGAHNTgLu2eOFaHNtrmne8dcAISN58qmN7eOM3sT6mnZ2k
	 zZJ5BHQlN4xvA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/5] MediaTek: Update MAINTAINERS and dts fixes for v6.7
Date: Tue, 03 Oct 2023 13:13:42 +0200
Message-Id: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGb3G2UC/x3L0QqDMAxA0V+RPBto7TbBXxk+pG2cYa6OxslA/
 PeFPd4L5wDlKqwwNAdU3kVlLRa+bSDNVB6Mkq2hc13wzgV8cRba+ImTfFlxv2GP4eLjNU05uZ7
 AZCRljJVKms2Wz7LYfFf+Ezv38Tx/T+czfXoAAAA=
List-Id: <soc.lore.kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Miles Chen <miles.chen@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, 
 Frank Wunderlich <frank-w@public-files.de>, 
 Jieyy Yang <jieyy.yang@mediatek.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Seiya Wang <seiya.wang@mediatek.com>, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 stable@vger.kernel.org, Eugen Hristev <eugen.hristev@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438;
 i=angelogioacchino.delregno@collabora.com; h=from:subject:message-id;
 bh=ZIRAP2qm7XJoF1kXFQyj8XANIl0j4JfaME1N/oAEhmA=;
 b=owGbwMvMwCU2y4zl/NrpLRWMp9WSGFKlv+d7zOy97b5a+fUXwat5zHEWRwO/8H/wOBMm91Kr8dpM
 293fOkpZGMS4GGTFFFnU79ZkP1+zkvFI+9kSmDmsTCBDGLg4BWAiEQcY/odt/DpHhnGdyHa/NV0xx5
 aHrZ72t3rz9il17zn93V/G51kz/PfqrEniOKbzk+XWUymr5Il7UpaIHd9auvXFUsk007mlauwA
X-Developer-Key: i=angelogioacchino.delregno@collabora.com; a=openpgp;
 fpr=57152E620CAF29C5DBE574766833ABB5BEBAF7B7

Hello SoC maintainers,
    
As suggested by Arnd in [1], I am sending an update to the MAINTAINERS
file, adding myself to the MediaTek SoC maintainers, and some urgent
bugfixes for MediaTek devicetrees.
    
mt6358 PMIC
 - Bogus property dropped
    
mt7622/mt7986a
 - Fix dtbs_check for t-phy nodes
    
mt8195:
 - Fix early boot failure when DSU PMU enabled
 - Fix memory layout for demo board
    
Regards,
Angelo

---
AngeloGioacchino Del Regno (1):
      MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer

Eugen Hristev (1):
      arm64: dts: mediatek: fix t-phy unit name

Macpaul Lin (2):
      arm64: dts: mediatek: mt8195-demo: fix the memory size to 8GB
      arm64: dts: mediatek: mt8195-demo: update and reorder reserved memory regions

Nícolas F. R. A. Prado (1):
      arm64: dts: mediatek: mt8195: Set DSU PMU status to fail

 MAINTAINERS                                  |  2 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi     |  2 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    |  2 +-
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 39 ++++++++++++++++++++++------
 arch/arm64/boot/dts/mediatek/mt8195.dtsi     |  1 +
 5 files changed, 35 insertions(+), 11 deletions(-)
---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20231003-mediatek-fixes-v6-7-341b5cfdc07a

Best regards,
-- 
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

