Return-Path: <SRS0=1men=FT=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E29E92716
	for <soc@archiver.kernel.org>; Thu,  5 Oct 2023 15:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA0B8C433CC; Thu,  5 Oct 2023 15:57:35 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6386FC433D9
	for <soc@kernel.org>; Thu,  5 Oct 2023 15:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6386FC433D9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3214cdb4b27so1141818f8f.1
        for <soc@kernel.org>; Thu, 05 Oct 2023 08:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521452; x=1697126252; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d11cqKfS+fdxtmrtzzZxvBU5OTmGMgE/XCozhQBkInQ=;
        b=J6zwE3f+dMM8+MLW4TttrOCuxgjchOIvhPuIPxTR1g+RXdoo+htCbABnyqCAFuXivm
         atxcZvq9o2B1kGhjfHeyarsDy5P0x3DprQ9mqL54rEwobiZblHcFv+ddHqN0rnasG+4M
         4suAjdpxI0BWx5q7qfYWV0siSuyb+G4l878yy6g5dgHN46HqzvBu+WthtHrd3WFn4NGV
         pgYygvL/aIWYoVHxX8q0Lzy/tuaFGuI2VzOB1kRyboo/itY7pw0ES2YiLsDYswjHfGHu
         03jdBdDN4ib2SvrAwxB5k+xfyq7t4rhdwrM4t6N/hx/WBBndkU0iHrdvMDmochpqF7jV
         Ks4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521452; x=1697126252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d11cqKfS+fdxtmrtzzZxvBU5OTmGMgE/XCozhQBkInQ=;
        b=KJSlULRYzK9V95wFvf/HyRfXBQW85qben4YaZjkUp2gIi1G00kdrgH+CH5us9aA6Yx
         /TNL6iP7vVlS6fPa4xtZiwO35yDt4LNXCOMNVnhhwqtrlz0zBPhzLn+vrQaPiSC+brcE
         CPk9I8KdcSQ0rRfL81x79P934Ppiu8/nRjFa8qlEyVHpoRT5nXvV28Wpb6DIz3ejokNA
         Vm2tXHecGh9WcZskAA23nilsfDfBKT5Ir52iyyMzGh5N1y+L661ajBn49dsHJwNg8y/T
         PYxVdHzt6YvX/pRuGnsSDHCqfC/tjFmEiS+nEMbcwqfF7jYtyHBA4Up59OAlEZkPEm1F
         2yyQ==
X-Gm-Message-State: AOJu0Yw3/5VevFZGizrts0GDocTM0zv5Rmql4bHjo9eRNxlWewJ5KH2G
	2zq/pTIanWpZb+ZVIu9ey9KyQA==
X-Google-Smtp-Source: AGHT+IF5JxaO9+rCy97IxTy5wUsRkgWUCcXCf+iMUE0xXftzVtEU+uJrHfiP+TqDv55krBbjdkA52Q==
X-Received: by 2002:adf:ec52:0:b0:321:6de5:68b4 with SMTP id w18-20020adfec52000000b003216de568b4mr5417975wrn.52.1696521452740;
        Thu, 05 Oct 2023 08:57:32 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:32 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	cw00.choi@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH 09/21] dt-bindings: clock: gs101: Add cmu_top clock indices
Date: Thu,  5 Oct 2023 16:56:06 +0100
Message-ID: <20231005155618.700312-10-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CMU_TOP geneerates clocks for all the other CMU units. Add clock
indices for those PLLs, muxes, dividers and gates.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 include/dt-bindings/clock/gs101.h | 204 ++++++++++++++++++++++++++++++
 1 file changed, 204 insertions(+)
 create mode 100644 include/dt-bindings/clock/gs101.h

diff --git a/include/dt-bindings/clock/gs101.h b/include/dt-bindings/clock/gs101.h
new file mode 100644
index 000000000000..d1e216a33aeb
--- /dev/null
+++ b/include/dt-bindings/clock/gs101.h
@@ -0,0 +1,204 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2023 Linaro Ltd.
+ * Author: Peter Griffin <peter.griffin@linaro.org>
+ *
+ * Device Tree binding constants for Google gs101 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_GOOGLE_GS101_H
+#define _DT_BINDINGS_CLOCK_GOOGLE_GS101_H
+
+/* CMU_TOP PLL*/
+#define CLK_FOUT_SHARED0_PLL		1
+#define CLK_FOUT_SHARED1_PLL		2
+#define CLK_FOUT_SHARED2_PLL		3
+#define CLK_FOUT_SHARED3_PLL		4
+#define CLK_FOUT_SPARE_PLL		5
+
+/* CMU_TOP MUX*/
+#define CLK_MOUT_SHARED0_PLL		6
+#define CLK_MOUT_SHARED1_PLL		7
+#define CLK_MOUT_SHARED2_PLL		8
+#define CLK_MOUT_SHARED3_PLL		9
+#define CLK_MOUT_SPARE_PLL		10
+#define CLK_MOUT_BUS0_BUS		11
+#define CLK_MOUT_CMU_BOOST		12
+#define CLK_MOUT_BUS1_BUS		13
+#define CLK_MOUT_BUS2_BUS		14
+#define CLK_MOUT_CORE_BUS		15
+#define CLK_MOUT_EH_BUS			16
+#define CLK_MOUT_CPUCL2_SWITCH		17
+#define CLK_MOUT_CPUCL1_SWITCH		18
+#define CLK_MOUT_CPUCL0_SWITCH		19
+#define CLK_MOUT_CPUCL0_DBG		20
+#define CLK_MOUT_CMU_HPM		21
+#define CLK_MOUT_G3D_SWITCH		22
+#define CLK_MOUT_G3D_GLB		23
+#define CLK_MOUT_DPU_BUS		24
+#define CLK_MOUT_DISP_BUS		25
+#define CLK_MOUT_G2D_G2D		26
+#define CLK_MOUT_G2D_MSCL		27
+#define CLK_MOUT_HSI0_USB31DRD		28
+#define CLK_MOUT_HSI0_BUS		29
+#define CLK_MOUT_HSI0_DPGTC		30
+#define CLK_MOUT_HSI0_USBDPDGB		31
+#define CLK_MOUT_HSI1_BUS		32
+#define CLK_MOUT_HSI1_PCIE		33
+#define CLK_MOUT_HSI2_BUS		34
+#define CLK_MOUT_HSI2_PCIE		35
+#define CLK_MOUT_HSI2_UFS_EMBD		36
+#define CLK_MOUT_HSI2_MMC_CARD		37
+#define CLK_MOUT_CSIS			38
+#define CLK_MOUT_PDP_BUS		39
+#define CLK_MOUT_PDP_VRA		40
+#define CLK_MOUT_IPP_BUS		41
+#define CLK_MOUT_G3AA			42
+#define CLK_MOUT_ITP			43
+#define CLK_MOUT_DNS_BUS		44
+#define CLK_MOUT_TNR_BUS		45
+#define CLK_MOUT_MCSC_ITSC		46
+#define CLK_MOUT_MCSC_MCSC		47
+#define CLK_MOUT_GDC_SCSC		48
+#define CLK_MOUT_GDC_GDC0		49
+#define CLK_MOUT_GDC_GDC1		50
+#define CLK_MOUT_MFC_MFC		51
+#define CLK_MOUT_MIF_SWITCH		52
+#define CLK_MOUT_MIF_BUS		53
+#define CLK_MOUT_MISC_BUS		54
+#define CLK_MOUT_MISC_SSS		55
+#define CLK_MOUT_PERIC0_IP		56
+#define CLK_MOUT_PERIC0_BUS		57
+#define CLK_MOUT_PERIC1_IP		58
+#define CLK_MOUT_PERIC1_BUS		59
+#define CLK_MOUT_TPU_TPU		60
+#define CLK_MOUT_TPU_TPUCTL		61
+#define CLK_MOUT_TPU_BUS		62
+#define CLK_MOUT_TPU_UART		63
+#define CLK_MOUT_TPU_HPM		64
+#define CLK_MOUT_BO_BUS			65
+#define CLK_MOUT_G3D_BUSD		66
+
+/* CMU_TOP Dividers*/
+#define CLK_DOUT_SHARED0_DIV3		67
+#define CLK_DOUT_SHARED0_DIV2		68
+#define CLK_DOUT_SHARED0_DIV4		69
+#define CLK_DOUT_SHARED0_DIV5		70
+#define CLK_DOUT_SHARED1_DIV3		71
+#define CLK_DOUT_SHARED1_DIV2		72
+#define CLK_DOUT_SHARED1_DIV4		73
+#define CLK_DOUT_SHARED2_DIV2		74
+#define CLK_DOUT_SHARED3_DIV2		75
+#define CLK_DOUT_BUS0_BUS		76
+#define CLK_DOUT_CMU_BOOST		77
+#define CLK_DOUT_BUS1_BUS		78
+#define CLK_DOUT_BUS2_BUS		79
+#define CLK_DOUT_CORE_BUS		80
+#define CLK_DOUT_EH_BUS			81
+#define CLK_DOUT_CPUCL2_SWITCH		82
+#define CLK_DOUT_CPUCL1_SWITCH		83
+#define CLK_DOUT_CPUCL0_SWITCH		84
+#define CLK_DOUT_CPUCL0_DBG		85
+#define CLK_DOUT_CMU_HPM		86
+#define CLK_DOUT_G3D_SWITCH		87
+#define CLK_DOUT_G3D_GLB		88
+#define CLK_DOUT_DPU_BUS		89
+#define CLK_DOUT_DISP_BUS		90
+#define CLK_DOUT_G2D_G2D		91
+#define CLK_DOUT_G2D_MSCL		92
+#define CLK_DOUT_HSI0_USB31DRD		93
+#define CLK_DOUT_HSI0_BUS		94
+#define CLK_DOUT_HSI0_DPGTC		95
+#define CLK_DOUT_HSI0_USBDPDGB		96
+#define CLK_DOUT_HSI1_BUS		97
+#define CLK_DOUT_HSI1_PCIE		98
+#define CLK_DOUT_HSI2_BUS		100
+#define CLK_DOUT_HSI2_PCIE		101
+#define CLK_DOUT_HSI2_UFS_EMBD		102
+#define CLK_DOUT_HSI2_MMC_CARD		103
+#define CLK_DOUT_CSIS			104
+#define CLK_DOUT_PDP_BUS		105
+#define CLK_DOUT_PDP_VRA		106
+#define CLK_DOUT_IPP_BUS		107
+#define CLK_DOUT_G3AA			108
+#define CLK_DOUT_ITP			109
+#define CLK_DOUT_DNS_BUS		110
+#define CLK_DOUT_TNR_BUS		111
+#define CLK_DOUT_MCSC_ITSC		112
+#define CLK_DOUT_MCSC_MCSC		113
+#define CLK_DOUT_GDC_SCSC		114
+#define CLK_DOUT_GDC_GDC0		115
+#define CLK_DOUT_GDC_GDC1		116
+#define CLK_DOUT_MFC_MFC		117
+#define CLK_DOUT_MIF_BUS		118
+#define CLK_DOUT_MISC_BUS		119
+#define CLK_DOUT_MISC_SSS		120
+#define CLK_DOUT_PERIC0_BUS		121
+#define CLK_DOUT_PERIC0_IP		122
+#define CLK_DOUT_PERIC1_BUS		123
+#define CLK_DOUT_PERIC1_IP		124
+#define CLK_DOUT_TPU_TPU		125
+#define CLK_DOUT_TPU_TPUCTL		126
+#define CLK_DOUT_TPU_BUS		127
+#define CLK_DOUT_TPU_UART		128
+#define CLK_DOUT_TPU_HPM		129
+#define CLK_DOUT_BO_BUS			130
+
+/* CMU_TOP Gates*/
+#define CLK_GOUT_BUS0_BUS		131
+#define CLK_GOUT_BUS1_BUS		132
+#define CLK_GOUT_BUS2_BUS		133
+#define CLK_GOUT_CORE_BUS		134
+#define CLK_GOUT_EH_BUS			135
+#define CLK_GOUT_CPUCL2_SWITCH		136
+#define CLK_GOUT_CPUCL1_SWITCH		137
+#define CLK_GOUT_CPUCL0_SWITCH		138
+#define CLK_GOUT_CPUCL0_DBG		139
+#define CLK_GOUT_CMU_HPM		140
+#define CLK_GOUT_G3D_SWITCH		141
+#define CLK_GOUT_G3D_GLB		142
+#define CLK_GOUT_DPU_BUS		143
+#define CLK_GOUT_DISP_BUS		144
+#define CLK_GOUT_G2D_G2D		145
+#define CLK_GOUT_G2D_MSCL		146
+#define CLK_GOUT_HSI0_USB31DRD		147
+#define CLK_GOUT_HSI0_BUS		148
+#define CLK_GOUT_HSI0_DPGTC		149
+#define CLK_GOUT_HSI0_USBDPDGB		150
+#define CLK_GOUT_HSI1_BUS		151
+#define CLK_GOUT_HSI1_PCIE		152
+#define CLK_GOUT_HSI2_BUS		153
+#define CLK_GOUT_HSI2_PCIE		154
+#define CLK_GOUT_HSI2_UFS_EMBD		155
+#define CLK_GOUT_HSI2_MMC_CARD		156
+#define CLK_GOUT_CSIS			157
+#define CLK_GOUT_PDP_BUS		158
+#define CLK_GOUT_PDP_VRA		159
+#define CLK_GOUT_IPP_BUS		160
+#define CLK_GOUT_G3AA			161
+#define CLK_GOUT_ITP			162
+#define CLK_GOUT_DNS_BUS		163
+#define CLK_GOUT_TNR_BUS		164
+#define CLK_GOUT_MCSC_ITSC		165
+#define CLK_GOUT_MCSC_MCSC		166
+#define CLK_GOUT_GDC_SCSC		167
+#define CLK_GOUT_GDC_GDC0		168
+#define CLK_GOUT_GDC_GDC1		169
+#define CLK_GOUT_MFC_MFC		170
+#define CLK_GOUT_MIF_SWITCH		171
+#define CLK_GOUT_MIF_BUS		172
+#define CLK_GOUT_MISC_BUS		173
+#define CLK_GOUT_MISC_SSS		174
+#define CLK_GOUT_PERIC0_BUS		175
+#define CLK_GOUT_PERIC0_IP		176
+#define CLK_GOUT_PERIC1_BUS		177
+#define CLK_GOUT_PERIC1_IP		178
+#define CLK_GOUT_TPU_TPU		179
+#define CLK_GOUT_TPU_TPUCTL		180
+#define CLK_GOUT_TPU_BUS		181
+#define CLK_GOUT_TPU_UART		182
+#define CLK_GOUT_TPU_HPM		183
+#define CLK_GOUT_BO_BUS			184
+#define CLK_GOUT_CMU_BOOST		185
+
+#endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */
-- 
2.42.0.582.g8ccd20d70d-goog

