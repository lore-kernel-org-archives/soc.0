Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051E34A08
	for <soc@lists.linux.dev>; Fri, 20 Dec 2024 08:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734683687; cv=none; b=gzorUCniEimhJl/tkQdMaLCbqjiD4pSyj05w+quwQYUNrzgrTK7jMbKsySJOAEm9wCYDviRak09/24q1OWbQ8CcV4lVIk45fmSO24K31sgEn63XUE+F6C2vY5IpapLJIGaKgf4rmqoQdstjhNEwZ7xYsSeKhtOo45+/+Gl+1u4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734683687; c=relaxed/simple;
	bh=23T4EyEhmUAs2AInhj3j9uP3y1CEVDTYWoR5JjlNKwM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AEsM1NIX59dylnHjKRyx3WY7BhZG6iFcEtDRuyK9be0WaheaplEgY8sSPtoE8vYYQcoh0hvAoBT2ONoFejh3szpIH3CQSi4kzg0bQy8YOlP+EvoayLgZUU1Js4bapwJQvX3TGZmWlqASs4RKeTzW+Zs/BCJrH72HGDNINvYiOwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=phe7H290; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="phe7H290"
Received: by smtp.kernel.org (Postfix)
	id 92ECBC4CED6; Fri, 20 Dec 2024 08:34:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F3D8DC4CECD;
	Fri, 20 Dec 2024 08:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F3D8DC4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK89GV9013423;
	Fri, 20 Dec 2024 09:34:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=NXYvXMf4FRV/xpeIigxHK5
	8ZT4ica+QWRRFIgx8m8DQ=; b=phe7H2907G/jbTPQca2M+2Um+yGS39puRiKdWB
	QKQTgq8hcONjNN+KjYLSTysz3jt7CTDNF3oh/OPrfmKV0PRcFxMNUmIWFmt/0oXf
	+Cyrtl4LukrNwlYmmuwdvq4sTn7bDrIdk54oQTUrmu4YB63KMrmVI8EZ8GxskJFC
	e8qjdiwbV4cqjf4SnG0/y7FS5Ii3SAAccELv/IvhCibFkS85kui/RKuIQ1udiWew
	/sQnEkVM3bev+7QlUh21YvqGSWKXxDaVrMxcXFScIaBaRXZNZukP6DFvag9CWnHT
	NR9aJ1IBTHyDuvotL9keBF7rJl/ZfrZg9aNuL9N85bqhgdWg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43n34brhvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 09:34:40 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A88A740057;
	Fri, 20 Dec 2024 09:33:56 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C67382576D3;
	Fri, 20 Dec 2024 09:33:35 +0100 (CET)
Received: from localhost (10.48.86.79) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 20 Dec
 2024 09:33:35 +0100
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, <soc@kernel.org>,
        <arm@kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH] firewall: remove misplaced semicolon from stm32_firewall_get_firewall
Date: Fri, 20 Dec 2024 09:33:35 +0100
Message-ID: <20241220083335.66350-1-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.34.1
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
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

From: guanjing <guanjing@cmss.chinamobile.com>

Remove misplaced colon in stm32_firewall_get_firewall()
which results in a syntax error when the code is compiled
without CONFIG_STM32_FIREWALL.

Fixes: 5c9668cfc6d7 ("firewall: introduce stm32_firewall framework")
Signed-off-by: guanjing <guanjing@cmss.chinamobile.com>
Reviewed-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

---

Hi Arm SoC maintainers

Can you please take this STM32 firewall patch in your SoC tree for v6.14 ?

Thanks in advance.
Alex

diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
index 18e0a2fc3816..5178b72bc920 100644
--- a/include/linux/bus/stm32_firewall_device.h
+++ b/include/linux/bus/stm32_firewall_device.h
@@ -115,7 +115,7 @@ void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 su
 #else /* CONFIG_STM32_FIREWALL */
 
 int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall,
-				unsigned int nb_firewall);
+				unsigned int nb_firewall)
 {
 	return -ENODEV;
 }
-- 
2.34.1

