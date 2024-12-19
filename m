Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3817D198A31
	for <soc@lists.linux.dev>; Thu, 19 Dec 2024 17:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734629545; cv=none; b=QwTqVpZX/ExuydKnyhrtNG2FnHMWI1AONXHVh+TgqgCWV4DCHvqMCFfhOfpRlOENh+BPXpMLe54sPpxw7kap3LvcfQ9cUJJN5Cg0enrt9dXCVM5c8OpJDExTtHOSZubPA+hOdqOh1u35BJcFLCB+isnFMBL7d/OF9eYEalzTNE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734629545; c=relaxed/simple;
	bh=Wa1JnsbTMoh2OX6FzlDa1iZD3s3A7tWnL8lrvle8gQw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ljqrGK++5Qc/7bD/OYhaFs1Mb1p20IS7yhVGiDOWL+ajRme049ITJIEaNpz4a34dWWiGmJntV0GhFw/8vUXjFtcCKkOhonVtKIR2dg7FBX+GsJRMIwp+aBoHLBmEtcNA5EXw4pCHSP2VY8I3dEBwYQA4h/NL5sxBPL7IVrBTn44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=uqDkYC7p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="uqDkYC7p"
Received: by smtp.kernel.org (Postfix)
	id E7158C4CED4; Thu, 19 Dec 2024 17:32:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CDC18C4CED6
	for <soc@kernel.org>; Thu, 19 Dec 2024 17:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CDC18C4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJDOfdI020452;
	Thu, 19 Dec 2024 18:32:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	vAuTIpCD0seUO/ENQX97K+9fPQcdAn1olFahh3fl33g=; b=uqDkYC7pRfsCns8A
	eaMEttDFljfvNgPY3lOR5bPXHFw+SgNDPJYWtmTjitwSZUcFL4v/KYxU+4ZSEBti
	cVMEc7gNdkZR3cjvFk7FRQjepqZxnV/uRzwsxRvAvTQGTSVealNEFxHf4fBlegyu
	yYeh93/AnZIXPpAlA3QAFtk22npXltrpIiVb/xc2a/rHHoN2O4WMeG08q3+HB+0B
	GOuv/t+QoF9xB60wPan1Qjd6TReXl/c6UvaTAaFDy046k39DhuNFzY/6G30mO7UU
	7DC2lKOFCidZzTwDwe/RBedPYRLk+mNjprF9G+YWwj7yl3ZaUKkJloTHidJ6PyvS
	5+KT7w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43mmbmrxhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 18:32:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 51FD74004F;
	Thu, 19 Dec 2024 18:31:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8103B28810B;
	Thu, 19 Dec 2024 18:29:59 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 19 Dec
 2024 18:29:59 +0100
From: <patrice.chotard@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Petr Mladek <pmladek@suse.com>, Yoann Congal <yoann.congal@smile.fr>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <soc@kernel.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
Subject: [PATCH 3/7] ARM: configs: stm32: Disable CONFIG_SUSPEND in STM32 defconfig
Date: Thu, 19 Dec 2024 18:29:30 +0100
Message-ID: <20241219172934.3010875-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241219172934.3010875-1-patrice.chotard@foss.st.com>
References: <20241219172934.3010875-1-patrice.chotard@foss.st.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

From: Patrice Chotard <patrice.chotard@foss.st.com>

Disable CONFIG_SUSPEND in stm32_defconfig as there is no power
management on these platforms.
It will reduce the kernel image size for these platform which
embeds a low amount of memory.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/configs/stm32_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index 9262be1e7cf6..0fc411e7d87c 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -20,6 +20,7 @@ CONFIG_DRAM_BASE=0x90000000
 # CONFIG_ATAGS is not set
 CONFIG_XIP_KERNEL=y
 CONFIG_XIP_PHYS_ADDR=0x08008000
+# CONFIG_SUSPEND is not set
 CONFIG_BINFMT_FLAT=y
 # CONFIG_COREDUMP is not set
 # CONFIG_VM_EVENT_COUNTERS is not set
-- 
2.25.1

