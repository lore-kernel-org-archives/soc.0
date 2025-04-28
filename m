Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89953266EE0
	for <soc@lists.linux.dev>; Mon, 28 Apr 2025 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842107; cv=none; b=n1TqFvMlAvsRSSMvRtLCwEMfsDe3OKCIt9gT9iwOfqUCM4fa13wUQiRDsKPZbwc8BXCHkWDFwcLeEs0EBtasEwVi+YxgCbGvXsSiNrnP74JWFzL6OW2200jHJ93hDf7GWYdWWplksV7m7z0aWzZyPh6wX+spNWcBkuAJFoOGisg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842107; c=relaxed/simple;
	bh=vNixJIvuCnUaMM8A5pprOiD7IGFNF+8V3ipBVkyyKx4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NsFU+XMvymmOO2vgBuR9iNMLEVrIcsMl9GWH+kDeRQaeqMlnzsw+dvuZGvCidnAPa8KshtVPKK7rBwhoc617WexKiUCL33cGqU5F6G5DUE3WxsuETjTJ0WVMLTsL0AxvDyNpfdoZQg3L+CJzNPmTt0q3ZD8tlrPk2lZlZvf+RRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=JaOvp/Ld; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="JaOvp/Ld"
Received: by smtp.kernel.org (Postfix)
	id 1C25FC4CEED; Mon, 28 Apr 2025 12:08:27 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1C4CC4CEE4;
	Mon, 28 Apr 2025 12:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1C4CC4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9ZK7C010153;
	Mon, 28 Apr 2025 14:08:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	oYi+LH6fRp3DZFCezFTOcoKYgn+yeQ+bap2mDq2/lv8=; b=JaOvp/LdWd5Rq+xd
	Hn+9HLzhZZYZUVEzXaXYXZ4P2NjONrydep0+68gWmkCnisHkz8lnmYPTfVET0VzT
	5NGIvBAPnUyKvQE26innCt/G1XexigtXLB38GLJj1Oj2rAPLAvLlFcPYeMQw/2aK
	ttbRy3WJPh+soRkbFUysFxwz0jhfofOrNWaTLeGZn04IAfs+MT5ilzSCkJ4TYukV
	e2Bt0v9o4AomnempLnurbo0cB0h/UYveeN4NBICQQcNr8EgK7MBnGtA+R301ObRD
	0TH/KPntOkiTjr7lbj06oxHUs+oc2x7K537HhjQ5nunQp06/RtH2U/u41EGsUj7r
	gaGiOQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 469aenc79j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 14:08:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DF38440083;
	Mon, 28 Apr 2025 14:07:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93A61A439DA;
	Mon, 28 Apr 2025 14:07:15 +0200 (CEST)
Received: from localhost (10.48.86.79) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 14:07:15 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
        <soc@kernel.org>, <arm@kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 3/6] arm64: dts: st: Adjust interrupt-controller for stm32mp21 SoCs
Date: Mon, 28 Apr 2025 14:07:00 +0200
Message-ID: <20250428120703.1392456-5-alexandre.torgue@foss.st.com>
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

Use gic-400 compatible for aarch64

Fixes: 7a57b1bb1afbf ("arm64: dts: st: introduce stm32mp21 SoCs family")
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Link: https://lore.kernel.org/r/20250415111654.2103767-4-christian.bruel@foss.st.com
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 6dd1377f3e1d..52a8209471b8 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -116,7 +116,7 @@ syscfg: syscon@44230000 {
 		};
 
 		intc: interrupt-controller@4ac10000 {
-			compatible = "arm,cortex-a7-gic";
+			compatible = "arm,gic-400";
 			reg = <0x4ac10000 0x0 0x1000>,
 			      <0x4ac20000 0x0 0x2000>,
 			      <0x4ac40000 0x0 0x2000>,
-- 
2.34.1

