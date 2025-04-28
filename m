Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22132757F3
	for <soc@lists.linux.dev>; Mon, 28 Apr 2025 12:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842163; cv=none; b=Cuqoo2bcNnySI4uPP91JlQkpZCz6xHcWbqsEUwFEZ3QE1Rg+9utx86Gpi2Blx3nVkx9QnrEe6bRw1p2WBVgdv/PYfp+gL90lyZ+vZhndUfxbV86Ih0pynFPziQNztf9H+ATVz9eww3RAhjpZ4oQEUA1BR0Vc3J3M4mPh6BFkAik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842163; c=relaxed/simple;
	bh=cGyL80VGPDmQ9WdBrfP8/aR2yDohAnOKiCjzllaex+A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FpBWv3xp0wentYymb6LukWWU3df85K9MQbSUr2gkhr/Lqf1F0Vnnzqt7HOEBP6gSBcrKaCyp9h+nOE3wXpLH+zvQSB4HtBAG/gLCxNMG67QtwU6AsRvIRN3AHcAU57FyZR8a1rTj4tXLzQpJFVcjx5z+4nQxeTBJK6bzuN77drk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=w/mg2uRF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="w/mg2uRF"
Received: by smtp.kernel.org (Postfix)
	id E68A5C4CEE9; Mon, 28 Apr 2025 12:09:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF133C4CEE4;
	Mon, 28 Apr 2025 12:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DF133C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9aHNk021436;
	Mon, 28 Apr 2025 14:09:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	VDepB8SehSi6GXRffHPKudonq+tQNkNItAJbzLTxasQ=; b=w/mg2uRFKNG+caQa
	qgICNZAIeYpVyz7HYyMUuBNH167mKZp4AMXzw3BXZBOH4WmbEr5uCiFaASUi6Shk
	nGfZ9G8Kfr66tVhBvE7uY5Y749KWy4obZnrd2x2Jpyrdhc5/8IxzgXycugz9cqCR
	G1mWwnO7wwzgTS/SNRzmsjQ1oZGYv+6/Bi/7nta4YaiGwqXHxNIqUn/5TSpP3ycL
	y2pnTV1zaNOcjMyd9v2my2YEnHN5wBI+q4bSJxTbmUON1Sy8FNDzcbEtsQrxvojo
	MbxwGTelU9EAGwkUzN4TIn2myWu1l5WOFE27gSGvl7/ZBsV1WsXYrMfv2D72l2nx
	jEhq+g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468mm9enr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 14:09:15 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 04F7240047;
	Mon, 28 Apr 2025 14:08:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AEC26A59537;
	Mon, 28 Apr 2025 14:08:17 +0200 (CEST)
Received: from localhost (10.48.86.79) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 14:08:17 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
        <soc@kernel.org>, <arm@kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 6/6] arm64: dts: st: Use 128kB size for aliased GIC400 register access on stm32mp23 SoCs
Date: Mon, 28 Apr 2025 14:07:03 +0200
Message-ID: <20250428120703.1392456-8-alexandre.torgue@foss.st.com>
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

Adjust the size of 8kB GIC regions to 128kB so that each 4kB is mapped 16
times over a 64kB region.
The offset is then adjusted in the irq-gic driver.

see commit 12e14066f4835 ("irqchip/GIC: Add workaround for aliased GIC400")

Fixes: e9b03ef21386e ("arm64: dts: st: introduce stm32mp23 SoCs family")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Link: https://lore.kernel.org/r/20250415111654.2103767-7-christian.bruel@foss.st.com
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 3f73cf1d443d..75697acd1345 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -1203,9 +1203,9 @@ exti2: interrupt-controller@46230000 {
 		intc: interrupt-controller@4ac10000 {
 			compatible = "arm,gic-400";
 			reg = <0x4ac10000 0x1000>,
-			      <0x4ac20000 0x2000>,
-			      <0x4ac40000 0x2000>,
-			      <0x4ac60000 0x2000>;
+			      <0x4ac20000 0x20000>,
+			      <0x4ac40000 0x20000>,
+			      <0x4ac60000 0x20000>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
 		};
-- 
2.34.1

