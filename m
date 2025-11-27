Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6C031985D
	for <soc@lists.linux.dev>; Thu, 27 Nov 2025 10:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764237658; cv=none; b=JIxcy9wvIaRj+U1P5wEs/S/c3UH2O1lX+yrB2Ne1nU8bmoyQobqDSGViMXqvYyHirgUBvYZ/cjlOvK2zTpHDSuYJywXq7WKr1Z6a4kkCLm3xVVrkIEA9YDAWSAaVln57FC8ntmhixw1F7Qp+Rnzlt+N1KYqv0DwCuNKUMwy5iRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764237658; c=relaxed/simple;
	bh=xI4TGa3Cd79DsFwxoLL93nEI8+XXnA/lRKaFQB1Mxl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cC+9YJhc+CcimBRZeAbpDCbAjRDKd/ZvjdDk2+5LxsYqs1tFATgrz80+2H6JjT49rXBBN2h/C3LVZ9Y+ynj+ycu9M/4qRkXm+Tr1I4s3dB9WTrl6DA90Jif+/GjfOpHd5wqBa1Xbz5jSapS1z8x/9nLGdX74pDyL2c7D2VdxQpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G0HUvHwN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G0HUvHwN"
Received: by smtp.kernel.org (Postfix)
	id AB055C113D0; Thu, 27 Nov 2025 10:00:57 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6F73C4CEF8
	for <soc@kernel.org>; Thu, 27 Nov 2025 10:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6F73C4CEF8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29555415c5fso8636535ad.1
        for <soc@kernel.org>; Thu, 27 Nov 2025 02:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764237656; x=1764842456; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lXLMTwsVE5PrrxBMxsVCoUcLv2OfpkJJM3iox2q0QmM=;
        b=G0HUvHwNGbtsCofMX9LOF8J2WZVHVr8aqtj0DE+PjOozV962moIvLxLWF8hUo2Deit
         p4OY+ZM2dd84gfml01ayyWkf/+siMn9eBs8BVmO5gU+b7dMSOFVpe1PvEtebBmi9ZuRI
         lUPfwmSrr5ci9VTYj3FWcs20dzHiw9KemBtEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764237656; x=1764842456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXLMTwsVE5PrrxBMxsVCoUcLv2OfpkJJM3iox2q0QmM=;
        b=LLzml+0ASq0WGBEnobDdoYQxUdeF0lPef/YjJvPNt41h844Ndm3WHwiBNA6Sbq1caN
         r+TjY3z3ikBxTNVWQu9zbo9aYxS7ss0wZYnm5EbyPl/RiCSYlgzVx5F6VJS4kgW6AKS6
         My43681zCxfGRHxxfI5nXooWVE5SWkioJJrDNkSZ6GQGxMrwE0ftaYGJjT//Wy+PI3WA
         NOYVR6OjWU5QUunFxb6b9fnlvtEpFLrB/XP8IjlfYiXsh009jUzGUTfI3q/irUrYQrgi
         SagD6KOsWNW8Iy8F0zCyAY2Pv5ycCsFHmti03bb4fJo0PoMVo9P72YaVCELqsoeJwzxV
         4thw==
X-Forwarded-Encrypted: i=1; AJvYcCVt6XHmgxJIvmFXAtyH+5Ha+UsBq2DYPpgQYJeiJyDqIqwOWH5kVaVJEqA/8fMYgf21xC0=@kernel.org
X-Gm-Message-State: AOJu0YzCNL5jRhQfm6DX3qyzOtVQTFxauHgSe5R6AtMTWPAk4yGUGGT1
	Mmtah9LTh2s2LtorPE46+KscCxsWq0QrtbLZu74pKE3hCET7lGSokgFPp+WKmV7XkA==
X-Gm-Gg: ASbGncsubzkrT2RHMkf04PYMW3tVBMA+PtS6MMa49z+pzydc/gGfpaSgUTUKvO7uu5z
	xFh1C4AUWlPyZFkC/2FLe3JojaLYF6cdZQ+WG220+7ZKSyhUzIMUIxpdCLgLVogg9Z4XMURyZw5
	SiWNVqm+o03v8fqDKkiH8u61ET5IkVz+487XhC0c4/dl0lb4TToRi8EVEYOcLUbYyNXEY97ln3E
	48VNErhaLtxHlUfhwvkOlKLzo9B8nlx8+CHc7xRsB9vcGZPZCCz5JcWJt6UhlWDpt9L3+ONWt6q
	swatLDu1s6zORjjHjzNnzO5023LMX3lbszMubHhs3M6VaGBd9eMMEe5WFNhAbU4ahOPE87YyHwQ
	LZCa/1wYDvMRwoNKpMJiusrzlAvBryR9eh2XSnq4HC5QIocqWheUKprNVyiqH+p63nDcbBFPMEQ
	6EL7d6yebKWmuvTZBkO5uI8t+03Dwv4boYirP39AK6xQavPqVm8YpDgYBg3EBdgZq04GYn
X-Google-Smtp-Source: AGHT+IHivfNnrfK3dtvJit5EMEyVA6t8fLK67j9PbneBRp9gDarid+L6oRuRF/o2DijnRZbB5oV9KA==
X-Received: by 2002:a17:902:e551:b0:295:3eb5:6de1 with SMTP id d9443c01a7336-29b6c684abbmr298506555ad.34.1764237655717;
        Thu, 27 Nov 2025 02:00:55 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:4917:2ae3:8ebd:4ff1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb29fbbsm12490515ad.49.2025.11.27.02.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 02:00:55 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	soc@kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8195: Fix address range for JPEG decoder core 1
Date: Thu, 27 Nov 2025 18:00:42 +0800
Message-ID: <20251127100044.612825-1-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The base address of JPEG decoder core 1 should start at 0x10000, and
have a size of 0x10000, i.e. it is right after core 0.

Instead the core has  the same base address as core 0, and with a crazy
large size. This looks like a mixup of address and size cells when the
ranges were converted.

This causes the kernel to fail to register the second core due to sysfs
name conflicts:

    sysfs: cannot create duplicate filename '/devices/platform/soc/soc:jpeg-decoder@1a040000/1a040000.jpgdec'

Fix up the address range.

Fixes: a9eac43d039f ("arm64: dts: mediatek: mt8195: Fix ranges for jpeg enc/decoder nodes")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This was introduced in v6.18-rc1.

Maybe have the soc maintainers take this directly instead of waiting?

Also, I'm not sure if this error could mess up the JPEG decoder driver's
internal tracking.

 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index ec452d657031..c7adafaa8328 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -3067,7 +3067,7 @@ jpgdec@0,0 {
 
 			jpgdec@0,10000 {
 				compatible = "mediatek,mt8195-jpgdec-hw";
-				reg = <0 0 0x10000 0x10000>;/* JPGDEC_C1 */
+				reg = <0 0x10000 0 0x10000>;/* JPGDEC_C1 */
 				iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
 					 <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
 					 <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
-- 
2.52.0.487.g5c8c507ade-goog

