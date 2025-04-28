Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75999757F3
	for <soc@lists.linux.dev>; Mon, 28 Apr 2025 12:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842159; cv=none; b=K4MLCx8myvdxeG+hOqr2M7CBiI93DyyUxu+wQoIgTWk7sVYSAwE6liQ7xkwNSWH1zKgXKHoNbXfP7W1+Zp3YhvyZ5nvRFSQKgx95AisBCukLD7MsMwmqu/AqJgEbfQLvLghRYiQrI7xi6ZEF38tlbSfckLKyp0CvG3Q//LKyl8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842159; c=relaxed/simple;
	bh=6TyxlbWNKcm/1GP6PnhSOtyY3wCNE8bvPMzd22jAJxI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YWpm/Juyr0ctaglwNk9LAh/Zs2QSD2ukskUpirmkTQvmbmwtqDQA7/l7uIt61ZFJoOJM9m9uX1I2pPVfJd0NDT1PS/6OL9rmTOgg5UDa1UmMZTpmM0xQGb2TWRz7poacZMw4mOYmrudtd1AqAJOCV3yO5uw+jrm3hDY7UyBn7o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=6LyHinbp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="6LyHinbp"
Received: by smtp.kernel.org (Postfix)
	id 0CE53C4CEED; Mon, 28 Apr 2025 12:09:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F303CC4CEE4;
	Mon, 28 Apr 2025 12:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F303CC4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9aULu010275;
	Mon, 28 Apr 2025 14:09:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Rq/r0VUvpJ1PEG2WVjTiENPljgqPLmqAV50JODaTpFM=; b=6LyHinbpyo1EElde
	Ib5qHgdioDmF/j8s0TLKhXwut1QDh01eaEhaEsciWPERoo9kBoSzkhuXsPxqXpR3
	Qe/cffdsBD3azzKWAj04b8q3Utyml0eF7b8fy0R87DLwM9UlxZDZr/01DVUTQw8T
	p2N1GeMgjyqUc9qiHqx5Pc3DTH170aZGhHBSheL/8Nir0KO/6kc9qmvdGRe0Jh54
	/FXur6TccalRPGKvhn/lpUiruHe/OR/FYMynizzKhuwLycu3f1mY6rhQsvrCpaRV
	/5Nl0Ol3njNdXiqe5k7dKQLuMChfruK9iwUTM1bKIGc66ZyrJxfcTRSIBs/dr8Xe
	nNTbvQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468pcg6f6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 14:09:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 94F984002D;
	Mon, 28 Apr 2025 14:08:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A43EA58135;
	Mon, 28 Apr 2025 14:08:16 +0200 (CEST)
Received: from localhost (10.48.86.79) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 14:08:16 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
        <soc@kernel.org>, <arm@kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 4/6] arm64: dts: st: Use 128kB size for aliased GIC400 register access on stm32mp21 SoCs
Date: Mon, 28 Apr 2025 14:07:01 +0200
Message-ID: <20250428120703.1392456-6-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428120703.1392456-1-alexandre.torgue@foss.st.com>
References: <20250428120703.1392456-1-alexandre.torgue@foss.st.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_04,2025-04-24_02,2025-02-21_01

From: Christian Bruel <christian.bruel@foss.st.com>

Adjust the size of 8kB GIC regions to 128kB so that each 4kB is mapped
16 times over a 64kB region.
The offset is then adjusted in the irq-gic driver.

see commit 12e14066f4835 ("irqchip/GIC: Add workaround for aliased GIC400")

Fixes: 7a57b1bb1afbf ("arm64: dts: st: introduce stm32mp21 SoCs family")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Link: https://lore.kernel.org/r/20250415111654.2103767-5-christian.bruel@foss.st.com
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 52a8209471b8..bf888d60cd4f 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -118,9 +118,9 @@ syscfg: syscon@44230000 {
 		intc: interrupt-controller@4ac10000 {
 			compatible = "arm,gic-400";
 			reg = <0x4ac10000 0x0 0x1000>,
-			      <0x4ac20000 0x0 0x2000>,
-			      <0x4ac40000 0x0 0x2000>,
-			      <0x4ac60000 0x0 0x2000>;
+			      <0x4ac20000 0x0 0x20000>,
+			      <0x4ac40000 0x0 0x20000>,
+			      <0x4ac60000 0x0 0x20000>;
 			      #interrupt-cells = <3>;
 			      interrupt-controller;
 		};
-- 
2.34.1

