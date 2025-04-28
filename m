Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C2F263C88
	for <soc@lists.linux.dev>; Mon, 28 Apr 2025 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842109; cv=none; b=SGVUG0iEBvddpsctdqekjT5EN6oc0Wo/OTzXH4+OM6DbDXqyrgyqiHyG6/PQmECRjUrLa8e786I01JG6VyVDteD9dSXcwetRu4D+qYeDx8xOZDB52KJgLqp2VgRK/GZzzd3qUjZew55MX56jNd4TTP5GxXTH/eWH1FjDwVzs8ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842109; c=relaxed/simple;
	bh=nHBQJaqCXFNibY8hE0FQNKcqxDul1tQaye9QuAZDbmQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YNZqkzxTBvk3/4ZH9ASQu8+zDmUaduvU/booBVUoszrfr0tpG7qlL+IcIsyNxisRtzlB+tgLWfIvQyjxMpX1V4gp7VmD8oa7tORXDaQSNOHJCHDcBkYKVZc9LKTo/UgKW7UXEYKWy78haK5lcdcnzEGpKUzJs6J0cUdpmq0nSMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=wKBrryqX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="wKBrryqX"
Received: by smtp.kernel.org (Postfix)
	id 3F452C4CEE9; Mon, 28 Apr 2025 12:08:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28257C4CEED;
	Mon, 28 Apr 2025 12:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28257C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9NvMa006984;
	Mon, 28 Apr 2025 14:08:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	q0MJDbc/T1FjnEfwzB/8g4VxcOdN+zvu2JAh9tiN7ik=; b=wKBrryqXSLPx0DZZ
	9Ko16F0D8N7+HecPsvOEiasWo/reKpYuafofQ75/nJ9gv6Jv+f3jazMEbQcFRoig
	NdwPZPxsj90qTCl69Ng8mRlCY/6DTZipf0TwtKGKY5dT90uMO/fiV8w9OxSRbNqL
	KgkXZAXNnS2ptEC1GKNXXZQ37Au9q1IczK8XXMnXf3XWQ3FG2M/Jv5MheUqS7qed
	7jibJGchpAGCgV7t1UaZD1Kkew7K0u3cv4x4RIvMThqNc3ToWYmjXczZMCOvXgKl
	on9OmT0SZJlLhVKvn+rG5GtyvjRhYAIXWbH0fmDSDhus642/guldvUGtyX4pskQ8
	kfsZ/A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468pu7enh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 14:08:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 68BCC40052;
	Mon, 28 Apr 2025 14:07:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 35BBCA72E01;
	Mon, 28 Apr 2025 14:07:14 +0200 (CEST)
Received: from localhost (10.48.86.79) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 14:07:13 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
        <soc@kernel.org>, <arm@kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 1/6] arm64: dts: st: Adjust interrupt-controller for stm32mp25 SoCs
Date: Mon, 28 Apr 2025 14:06:58 +0200
Message-ID: <20250428120703.1392456-3-alexandre.torgue@foss.st.com>
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

Use gic-400 compatible and remove address-cells = <1> on aarch64

Fixes: 5d30d03aaf785 ("arm64: dts: st: introduce stm32mp25 SoCs family")
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Link: https://lore.kernel.org/r/20250415111654.2103767-2-christian.bruel@foss.st.com
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index f3c6cdfd7008..379e290313dc 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -115,9 +115,8 @@ scmi_vdda18adc: regulator@7 {
 	};
 
 	intc: interrupt-controller@4ac00000 {
-		compatible = "arm,cortex-a7-gic";
+		compatible = "arm,gic-400";
 		#interrupt-cells = <3>;
-		#address-cells = <1>;
 		interrupt-controller;
 		reg = <0x0 0x4ac10000 0x0 0x1000>,
 		      <0x0 0x4ac20000 0x0 0x2000>,
-- 
2.34.1

