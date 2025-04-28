Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5502676FD
	for <soc@lists.linux.dev>; Mon, 28 Apr 2025 12:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842159; cv=none; b=ub0mmT3WIy89RNNrROWmiZkG74WGtnlkxReLTMaFqvPRKwAaayccR5GTvfQiUxwvPjF6cuKruaQ/2ZfRxffkQfZHVEtE6f3GCk4AZY396SYZLIdSasDJGnJt/7ajTnrOzLWAHHMn688qvlgwbSK5Z0bKhRVgfc7APVQM2fw6CVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842159; c=relaxed/simple;
	bh=AioaNF6S0m02ijjYv0DRo+Aj7lIF0PNcgjspgAcyZNE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r9bLU7KulA4n0yMmWMazL+3BR63GT6xKogwnny3cgZPN6VjCGoEIqUY91OHfCBEJCLTgi/T6xlB35uRzT2NtlFPAybrMAZBeiU29VR90gfanyqtqpbB57eFhYVHyiOzUXaYzbPc6BxMttlOXHKERpDgNmIOeuRw4U9OBQ0mvSl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=dwZ17fOz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="dwZ17fOz"
Received: by smtp.kernel.org (Postfix)
	id 5849FC4CEE9; Mon, 28 Apr 2025 12:09:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D226C4CEE4;
	Mon, 28 Apr 2025 12:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4D226C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9MOmF021339;
	Mon, 28 Apr 2025 14:09:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Cm6cchyf2UfB/Eal6U5fQSus/v2Wv3HaDHsZtxnhrp4=; b=dwZ17fOz+jBXDMAI
	O6BJNFhKnU5BTVXChj9KuIlqqVw/GXSphAv+20V6O8C7PRc/UmhJHxwOoZ6c9PIl
	io6o5zGbzuf0tQBYzAqRjtcRQI0DJUfk50Btt/nPsBO+HT0WiDVNwQveOPpU0I3D
	14sf/wweupFpqMil5b16KTROUXxHEvTJr54MIkgpqOPaonZVnlNdlLf3sNMp67Y9
	5tLKQ4OWVrLzUMM+dBibvg7lUYgKtoC1bkkb/IRPQZUCpTWLWDrlYI9m9coQ4zUA
	x9GuxLqj6U2UDUR6dewjys10coP6GXyODhVdBpncaUbVNPLZT0wiLICXN1OVsUGF
	d+LlYg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468mm9enqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 14:09:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4C42540044;
	Mon, 28 Apr 2025 14:08:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 02835A58136;
	Mon, 28 Apr 2025 14:08:17 +0200 (CEST)
Received: from localhost (10.48.86.79) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 14:08:16 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
        <soc@kernel.org>, <arm@kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 5/6] arm64: dts: st: Adjust interrupt-controller for stm32mp23 SoCs
Date: Mon, 28 Apr 2025 14:07:02 +0200
Message-ID: <20250428120703.1392456-7-alexandre.torgue@foss.st.com>
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

Use gic-400 compatible and remove address-cells = <1> for aarch64

Fixes: e9b03ef21386e ("arm64: dts: st: introduce stm32mp23 SoCs family")
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Link: https://lore.kernel.org/r/20250415111654.2103767-6-christian.bruel@foss.st.com
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 8820d219a33e..3f73cf1d443d 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -1201,13 +1201,12 @@ exti2: interrupt-controller@46230000 {
 		};
 
 		intc: interrupt-controller@4ac10000 {
-			compatible = "arm,cortex-a7-gic";
+			compatible = "arm,gic-400";
 			reg = <0x4ac10000 0x1000>,
 			      <0x4ac20000 0x2000>,
 			      <0x4ac40000 0x2000>,
 			      <0x4ac60000 0x2000>;
 			#interrupt-cells = <3>;
-			#address-cells = <1>;
 			interrupt-controller;
 		};
 	};
-- 
2.34.1

