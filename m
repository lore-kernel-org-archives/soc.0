Return-Path: <SRS0=OCw6=KK=collabora.com=nfraprado@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBB8C5478C
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 18:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D55B5C433F1; Mon,  4 Mar 2024 18:28:53 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF930C43390;
	Mon,  4 Mar 2024 18:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BF930C43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709576930;
	bh=v9K54mCWFGXxTmk+0kMTeT8m/5ID9PzFuet4Ue7lEa8=;
	h=From:Date:Subject:To:Cc:From;
	b=iIgJffdobUV6zPpFOTq1ofzrrvjiE+JvULRCF/zLUCFl/dCOU+nUvJ6x715Lf4Hil
	 SVzlcsdWy+5pjLlukRBlxm1/sTXXDPbQ2ND9e0GkUPpeLU5OaC1aalj9OZaM/IVGc4
	 ZmnEg9HVbBryGVWuChAZUqYMvLmn7/E5bYOS9QLbD5hwNmCPSNhkIpWkTIuEr2z1GD
	 p4WXBUxn3L3IE5w+n0l5CzyEXfmv+4sQd5FU7ck+7uQWpIjOhhwUYxvJlqdnh6EWHj
	 jqlBgLTj8GLdDiNJCHy2RPX8xyVVy9DdnmM0JVG/MiaYzR8krm5V2kbtgwfd4zUFMg
	 4IF5Po/2eaBtg==
Received: from [192.168.1.234] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B776E3780C6C;
	Mon,  4 Mar 2024 18:28:48 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 04 Mar 2024 13:28:35 -0500
Subject: [PATCH] arm64: defconfig: Enable support for cbmem entries in the
 coreboot table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240304-coreboot-defconfig-v1-1-02dc1940408f@collabora.com>
X-B4-Tracking: v=1; b=H4sIANIS5mUC/x3MPQqAMAxA4atIZgtVY/25ijhoTTVLI62IULy7x
 fEb3ksQKTBFGIsEgW6OLD6jKguwx+J3UrxlQ61r1I1GZSXQKnKpjZwV73hXiIPpXdt2aAzk8Az
 k+Pmn0/y+H6f2ks1kAAAA
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Brian Norris <briannorris@chromium.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.13.0

Enable the cbmem driver and dependencies in order to support reading
cbmem entries from the coreboot table, which are used to store logs from
coreboot on arm64 Chromebooks, and provide useful information for
debugging the boot process on those devices.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Brian Norris <briannorris@chromium.org>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Patch split from
https://lore.kernel.org/all/20240212-coreboot-mod-defconfig-v4-4-d14172676f6d@collabora.com
as it's independent from that series.

Rebased on top of soc/for-next.
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f9cc5bff157c..97888eabb328 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -251,6 +251,9 @@ CONFIG_RASPBERRYPI_FIRMWARE=y
 CONFIG_INTEL_STRATIX10_SERVICE=y
 CONFIG_INTEL_STRATIX10_RSU=m
 CONFIG_MTK_ADSP_IPC=m
+CONFIG_GOOGLE_FIRMWARE=y
+CONFIG_GOOGLE_CBMEM=m
+CONFIG_GOOGLE_COREBOOT_TABLE=m
 CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_IMX_SCU=y
 CONFIG_QCOM_QSEECOM=y

---
base-commit: 856e4f898347c4b3dbe1ece5d8c511cf8858011d
change-id: 20240304-coreboot-defconfig-44968f557466

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>

