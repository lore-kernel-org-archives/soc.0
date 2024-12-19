Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4B519AA56
	for <soc@lists.linux.dev>; Thu, 19 Dec 2024 17:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734629560; cv=none; b=Y6+OjHbdO/ie2wp5EAj5eHOnPNSzG41CJ3CxLu2DG/zusf9TiKskCXMZw1OCqfcsELVL1s3jbJZWgsob45uO41xQTWWWB+51vVot2mqtJNXSsW2hBVu3PkGhIEDtOh2H4+DH8ahTXLtF/5XpWJ/HUkDMsNe7sK8dgdjTKeaOXX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734629560; c=relaxed/simple;
	bh=ePU3Cr1aZZRMkVkK9V3REszSHk6rGnAeHmnN+QJHCCM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QB5XE1f2evuqO0NkbRyeNm0rF5n1djM1wgikfGxfepQ9bKoB/h19yU/mRuY3nV59ME9GV+6Z/RJO9vUylackV8deirpnferizFifq+JMJqpCsi+jDz0d4dJHW6TI32nNmLAZmHF7wPZO6M1Cz7xf5hLfq6X2x+RYD06MEioOkXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=FJbqamI+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="FJbqamI+"
Received: by smtp.kernel.org (Postfix)
	id A2D51C4CED4; Thu, 19 Dec 2024 17:32:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60875C4CECE
	for <soc@kernel.org>; Thu, 19 Dec 2024 17:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60875C4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJChvu1011954;
	Thu, 19 Dec 2024 18:32:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	7J+xS/H3snVoj+wbOe5GrKPaIpTRTEgtYy2lupU7XmU=; b=FJbqamI+5rNBYjEK
	U8XxfYt8/nd/Q+GsAjeMxaoMcPqf5MFK01BPEUQWN6WAZSghMNh5FmqIy3LZg7wu
	INNHQs2TCkwrV0MuDRaCyzQWDTyF3KhgeCjm76AAg3m1OMbVgKHO3t3JlKYIQvFI
	WYu/26nYLDpJpjUbOSQk4+QDqpIdx4NsltVI9B8ac867UY7QNm+dLefg90I2Gtmy
	Tv4k9Q9GyAZLERTbG1wb//xJhbNEV3sUOm3FiLphfBXiPtBpDFNnmXyShZ3UoTRJ
	uThtdE3J7/tbs6e3h2HC/Bad0nnu/HCKihuSY+A6g5O8o6m2FYoNXSAQFeFApAEO
	muHY8A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43mhad9vj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 18:32:32 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 52CFE40058;
	Thu, 19 Dec 2024 18:31:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EB8F2288B69;
	Thu, 19 Dec 2024 18:30:00 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 19 Dec
 2024 18:30:00 +0100
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
Subject: [PATCH 5/7] ARM: configs: stm32: Disable CONFIG_IO_URING in STM32 defconfig
Date: Thu, 19 Dec 2024 18:29:32 +0100
Message-ID: <20241219172934.3010875-6-patrice.chotard@foss.st.com>
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

Disable CONFIG_IO_URING in stm32_defconfig.
It will reduce the kernel image size for these platform which
embeds a low amount of memory.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/configs/stm32_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index 20fa929e2f9b..3a9bffa06d6d 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -12,6 +12,7 @@ CONFIG_BASE_SMALL=y
 # CONFIG_SIGNALFD is not set
 # CONFIG_EVENTFD is not set
 # CONFIG_AIO is not set
+# CONFIG_IO_URING is not set
 # CONFIG_ADVISE_SYSCALLS is not set
 # CONFIG_MMU is not set
 CONFIG_ARCH_STM32=y
-- 
2.25.1

