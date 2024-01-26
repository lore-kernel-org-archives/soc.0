Return-Path: <SRS0=JNwS=JE=quicinc.com=quic_obabatun@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67705C48291
	for <soc@archiver.kernel.org>; Fri, 26 Jan 2024 23:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4AFD2C43330; Fri, 26 Jan 2024 23:55:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D9A69C43394;
	Fri, 26 Jan 2024 23:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D9A69C43394
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40QNaTjh020399;
	Fri, 26 Jan 2024 23:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=Rbfri0w8rs8j6hzJO9zw
	SwBaauq10llgtGmh4EGN4Iw=; b=YeV+7YJ8kD35EMtHgwAtiZc8T+CPXgMFIAYQ
	bhxWyLFAGvdKLYOr5gN5breKWYgDCM2C2hfqd54afS7CsQbwzKhA6BOw9thu/jM4
	hKpw6SCMiMeQ1sz8mzAglfszGN2pWdZ1btjb19HY7epiH139vt4OecLhZGtABUm+
	OlcpfDuFgUZp1+6E99b1wA70sE2F6yeP+IZG4RTf3r9eYZDt0G/7z/pi8xTTr/V2
	h73w5yRhep79bqOxYAMytTSsPWpbOPG6B7GSU3ThKOvXI+SOnXMaBLdwXn/iUiUv
	7jRsMrVlsDQ717LLS74eMv6c2t0JQKaKsBta3t5PboyOwsEAkQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv6c8j5x5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 23:55:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QNtAhO009370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 23:55:10 GMT
Received: from hu-obabatun-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 26 Jan 2024 15:55:02 -0800
From: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
List-Id: <soc.lore.kernel.org>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <robh+dt@kernel.org>,
        <frowand.list@gmail.com>, <vgupta@kernel.org>, <arnd@arndb.de>,
        <olof@lixom.net>, <soc@kernel.org>, <guoren@kernel.org>,
        <monstr@monstr.eu>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <dinguyen@kernel.org>, <chenhuacai@kernel.org>,
        <tsbogend@alpha.franken.de>, <jonas@southpole.se>,
        <stefan.kristiansson@saunalahti.fi>, <shorne@gmail.com>,
        <mpe@ellerman.id.au>, <ysato@users.sourceforge.jp>, <dalias@libc.org>,
        <glaubitz@physik.fu-berlin.de>, <richard@nod.at>,
        <anton.ivanov@cambridgegreys.com>, <johannes@sipsolutions.net>,
        <chris@zankel.net>, <jcmvbkbc@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <kernel@quicinc.com>, Oreoluwa Babatunde <quic_obabatun@quicinc.com>
Subject: [PATCH 14/46] sh: reserved_mem: Implement the new processing order for reserved memory
Date: Fri, 26 Jan 2024 15:53:53 -0800
Message-ID: <20240126235425.12233-15-quic_obabatun@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240126235425.12233-1-quic_obabatun@quicinc.com>
References: <20240126235425.12233-1-quic_obabatun@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xWIxx8I7sp_MTzBvsRofwlpzt5Nk-qWs
X-Proofpoint-ORIG-GUID: xWIxx8I7sp_MTzBvsRofwlpzt5Nk-qWs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=470
 priorityscore=1501 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401260176

Call early_fdt_scan_reserved_mem() in place of
early_init_fdt_scan_reserved_mem() to carry out the first stage of the
reserved memory processing only.

The early_fdt_scan_reserved_mem() function is used to scan through the
DT and mark all the reserved memory regions as reserved or nomap as
needed, as well as allocate the memory required by the
dynamically-placed
reserved memory regions.

The second stage of the reserved memory processing is done by
fdt_init_reserved_mem(). This function is used to store the information
of the statically-placed reserved memory nodes in the reserved_mem
array as well as call the region specific initialization function on all
the stored reserved memory regions.

The call to fdt_init_reserved_mem() is placed right after
early_fdt_scan_reserved_mem() because memblock allocated memory should
already be writable at this point.

Signed-off-by: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
---
 arch/sh/boards/of-generic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/sh/boards/of-generic.c b/arch/sh/boards/of-generic.c
index f7f3e618e85b..7bec409f077c 100644
--- a/arch/sh/boards/of-generic.c
+++ b/arch/sh/boards/of-generic.c
@@ -8,6 +8,7 @@
 #include <linux/of.h>
 #include <linux/of_clk.h>
 #include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/clocksource.h>
 #include <linux/irqchip.h>
 #include <asm/machvec.h>
@@ -110,7 +111,8 @@ static int noopi(void)
 static void __init sh_of_mem_reserve(void)
 {
 	early_init_fdt_reserve_self();
-	early_init_fdt_scan_reserved_mem();
+	early_fdt_scan_reserved_mem();
+	fdt_init_reserved_mem();
 }
 
 static void __init sh_of_setup(char **cmdline_p)
-- 
2.17.1

