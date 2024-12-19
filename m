Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A995198A31
	for <soc@lists.linux.dev>; Thu, 19 Dec 2024 17:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734629546; cv=none; b=V7EvwA/qUXueI5O0D7mW9RQ11oxpNEGyoxErYcICXS/xrUgHD97m9JVunRRE1kSBD7hz9sqrObBw9bj60h/YyMHnY4fRp8obEA09M3Gg4VkWY9WLB5nvjOYLk4Q0vWxH1CmYrbMuU5WMRXwUnzX0Z0+HP3fyZq9Uo3UQVgKx+mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734629546; c=relaxed/simple;
	bh=TVsMA0I93rPfD/X9IV2jJnl6eykFo2iq2H14fyTheZQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BCe8TDxaSvl9twu/9fp6zSEWm0jXQ+LDiHzwS9WSfez3aVAZPOO3t4qysii66EC1hoIDjNgZaBiu2YbSqeJlYIysHR8QNVUDTO0UIBUsFOl/4aAjqdydpuxbSfGa2XaOz2o2k6fuEYeuff0zDmx0CGLRwiXMWWCdwalkg60cgH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=R2V0jCM3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="R2V0jCM3"
Received: by smtp.kernel.org (Postfix)
	id E93F4C4CED0; Thu, 19 Dec 2024 17:32:25 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C416C4CED7
	for <soc@kernel.org>; Thu, 19 Dec 2024 17:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8C416C4CED7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJD5749023576;
	Thu, 19 Dec 2024 18:32:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	WfpnuvhkdV27EF8ACM+cMUliGcJ2wUXz9Zs6Okg9Dgk=; b=R2V0jCM3onzf/B9A
	V2aoxppNG3l1w7yK2S2PY5Jbp6ZrDB6NFKaOu6L5W+JHoAuFyIyyLOEuMziM2GjP
	aOabyYay/lAS7fPyA3bvTlJi2v7y1hfaBRucEIi30MlbLqu8aNo0rrO6Z1ejiEGh
	WlfNq1GIpFVVX6Je7i1Otf/qexyqpNUxppkyn1Io0wLZuXd4wY4x60mPfLQdryoI
	/KiQJqT9Q9wIzqGHH7CliGvsf56swD9J/hsLxP05YtHp/0ckMzw9JydxENquukG/
	dhp1p3da0NO6v68SAgr0B3/5ZrsGBUy9TaNmiS3ZqLofUBMLuN0i+XSADOY7s+HU
	9svrAA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43mm2g9176-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 18:32:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DC5134004A;
	Thu, 19 Dec 2024 18:30:59 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A90672898CD;
	Thu, 19 Dec 2024 18:30:01 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 19 Dec
 2024 18:30:01 +0100
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
Subject: [PATCH 6/7] ARM: configs: stm32: Disable CONFIG_POSIX_TIMERS in STM32 defconfig
Date: Thu, 19 Dec 2024 18:29:33 +0100
Message-ID: <20241219172934.3010875-7-patrice.chotard@foss.st.com>
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

Disable CONFIG_POSIX_TIMERS in stm32_defconfig.
It will reduce the kernel image size for these platform which
embeds a low amount of memory.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/configs/stm32_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index 3a9bffa06d6d..dbe36a59a796 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -6,6 +6,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EXPERT=y
 # CONFIG_UID16 is not set
+# CONFIG_POSIX_TIMERS is not set
 CONFIG_BASE_SMALL=y
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
-- 
2.25.1

