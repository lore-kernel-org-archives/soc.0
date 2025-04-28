Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A64263C88
	for <soc@lists.linux.dev>; Mon, 28 Apr 2025 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842107; cv=none; b=Kd+r6xSfBI4MhqIfTH9bA8lW+gl2klZR7pvlF68anpAqLAx5qcFVNo1dvJwz/iR2Wj2Yhjia/eCwf5DAOyq+/96nRWUx8R4GP24XIZOliPZzCxgddFD7lyQO+FbefDk17z3vsM2oLLlNkLorFbPkeGJZjZXO3NWwI8hIfdvjeyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842107; c=relaxed/simple;
	bh=WwulVXjAmRvn3pa+Wd3vzZe+I1qXZIzKagwVjQmyJLg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IB7URbPoRJxDeDIi7cKbh/xJ0XqYF3QjYweAms9wpBVaJSiSg4cvcbmXAlSy7sAo0p8xxhxXFJL7VAiwwK1wfhVPUuHK1gCz0DQDxr8CHYv5ATMB/3JrW9MmlLt9ByBu1qGlX4lGm+cS+g0HW1+ySKGUePuuGDXXYtkiU8Y4mb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=r9KUuCm2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="r9KUuCm2"
Received: by smtp.kernel.org (Postfix)
	id 38875C4CEE4; Mon, 28 Apr 2025 12:08:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 19F0BC4CEE9;
	Mon, 28 Apr 2025 12:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 19F0BC4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9X7kE010430;
	Mon, 28 Apr 2025 14:08:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	WB+vNDlvLRXNyLcwgnzN5l5mx7/wfzcKWD45HlWv8r8=; b=r9KUuCm2QFpeDWwW
	X7u3KjMW1RmQD2KlRkH1Uim3C29XNUTTQzUi7Y47MS/neZ8XgvMhyE2aOmInd3fC
	fHmSWbaNaxzRNN32zGmCTHaKQkQaKPWeVVQtiROYxsndtSEGF8J4jvjdmUFp4JPa
	FfM30i7WKLqsoYXAKfab7pJsQXBfYMjg/y/y5HIXFvO9wde1Pk9SvnvHhRjRQBpx
	Z/53cktHRsLsKF7ypE4ka/Cdw6da9LW7eQzJrXPI2Vgm3XZMVgusOpPEpoVzZhSa
	CPn+QZAVn4M+5ddcCyoDwEh9Uufa+wRjNa9bUJ4gXC1IBDkOP0zwvU5K5vgo/zhV
	AF16sQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468pcg6f4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 14:08:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5142340051;
	Mon, 28 Apr 2025 14:07:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 81F0AA72E19;
	Mon, 28 Apr 2025 14:07:13 +0200 (CEST)
Received: from localhost (10.48.86.79) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 14:07:13 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
        <soc@kernel.org>, <arm@kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 0/6] Fix interrupt controller node for STM32MP2 SoCs
Date: Mon, 28 Apr 2025 14:06:57 +0200
Message-ID: <20250428120703.1392456-2-alexandre.torgue@foss.st.com>
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

Dear Arm maintainers,

Please consider this first round of STM32 DT fixes for v6.15.

Thanks
Alex

Original cover-letter message:

Fix GIC compatible and register access for STM32MP2
This serie replaces the original stm32mp25 patch:
 "arm64: dts: st: Adjust interrupt-controller for aarch64"

Christian Bruel (6):
  arm64: dts: st: Adjust interrupt-controller for stm32mp25 SoCs
  arm64: dts: st: Use 128kB size for aliased GIC400 register access on
    stm32mp25 SoCs
  arm64: dts: st: Adjust interrupt-controller for stm32mp21 SoCs
  arm64: dts: st: Use 128kB size for aliased GIC400 register access on
    stm32mp21 SoCs
  arm64: dts: st: Adjust interrupt-controller for stm32mp23 SoCs
  arm64: dts: st: Use 128kB size for aliased GIC400 register access on
    stm32mp23 SoCs

 arch/arm64/boot/dts/st/stm32mp211.dtsi | 8 ++++----
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 9 ++++-----
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 9 ++++-----
 3 files changed, 12 insertions(+), 14 deletions(-)

-- 
2.34.1

