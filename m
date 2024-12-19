Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E38B19AD5C
	for <soc@lists.linux.dev>; Thu, 19 Dec 2024 17:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734629560; cv=none; b=gdO9+OoR++q0cVJzKZFbbVibY1FClRSw21kU9RLzh/PR+OvlvzU+MXauNPdjzna8pefpcWwgeF2sYoLqMZrWwTTevDR4RDKkgqlx+lzId9VL0nbjbG38UT6IpCGARPyZm62kqxmEVxTRpis/Qo5FzbRAr4zfzvFDzeQ63xM6aUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734629560; c=relaxed/simple;
	bh=sQ0Ivy6r/sOHsOpzwz3zF/NlwMjMIRgcH+BzatI7E54=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IBPGPiieNcpdLh2+6thQlB8ugeamby6wP4XaYzusIjiPx66inflGnCPA4jrtiG1QMvywzGE/2GVYRRYUYby74aj+ArjZgiWKYMqW3mFb6QLSVqm3LOPaFpVMobkh2A2b0Z8iu21/+jTCB38NWqDXEGzXb/96jNMAodywSlI7oXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=WcayoApL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="WcayoApL"
Received: by smtp.kernel.org (Postfix)
	id F3AD9C4CED6; Thu, 19 Dec 2024 17:32:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9FA30C4CED0
	for <soc@kernel.org>; Thu, 19 Dec 2024 17:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9FA30C4CED0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJFYBXY028696;
	Thu, 19 Dec 2024 18:32:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	XP8tGry8QPhC+d2CSlQqWf2Cwz8m/rsIKfC4H6XstXY=; b=WcayoApLWhXG7+z1
	vS6+avtmgpT9mhJA+S5pd2Q1066j7T69GwoAx6Lv9YzHD8rOF0jE4m5DfaFUr23l
	CdVfHpTV3cEnnAdMDPubzRhYtTjAIu0bMW4OeDtvgCdMJcavd162zczyt8iApDNE
	biRi3kN2GxiCDS+iN4xUD739JkrStnNSnzSgQj/2saV5zUfnBfzECMObYoQpDQCW
	33IIR5SnPvY/ZN0VMGQewozP+Fg4SDnXxAftagyDj/A9TRgJp/MeXShSV+Ga9U4n
	iqMqZ6Lx+jdSrjX/h9iko9lMDzyIi/YNylj5lJmBu4CUEie5v9/MxuZowBI6Y2lr
	VqROeg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43mp8b8dns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 18:32:32 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 520BD40052;
	Thu, 19 Dec 2024 18:31:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F860288B47;
	Thu, 19 Dec 2024 18:30:00 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 19 Dec
 2024 18:29:59 +0100
From: <patrice.chotard@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Petr Mladek <pmladek@suse.com>, Yoann Congal <yoann.congal@smile.fr>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <soc@kernel.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>,
        Patrice Chotard <patrice.chotard@st.com>
Subject: [PATCH 4/7] ARM: configs: stm32: Disable CONFIG_ADVISE_SYSCALLS in STM32 defconfig
Date: Thu, 19 Dec 2024 18:29:31 +0100
Message-ID: <20241219172934.3010875-5-patrice.chotard@foss.st.com>
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

Disable CONFIG_ADVISE_SYSCALLS in stm32_defconfig.
It will reduce the kernel image size for these platform which
embeds a low amount of memory.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---
 arch/arm/configs/stm32_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index 0fc411e7d87c..20fa929e2f9b 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -12,6 +12,7 @@ CONFIG_BASE_SMALL=y
 # CONFIG_SIGNALFD is not set
 # CONFIG_EVENTFD is not set
 # CONFIG_AIO is not set
+# CONFIG_ADVISE_SYSCALLS is not set
 # CONFIG_MMU is not set
 CONFIG_ARCH_STM32=y
 CONFIG_CPU_V7M_NUM_IRQ=240
-- 
2.25.1

