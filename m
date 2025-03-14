Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C54194A75
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 08:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741941402; cv=none; b=a7QNxaCUiyV7Lmf3JDtlEF3/ZLJW9e558WNyRsogbslfeK+cJjDAjkc6hpGB7sAbmGvEG+VEgBsLF7nKoeUuhwUg4SSokESNdZXIzdDZXxbakXhgtlGEhtDgsEe6mUtbNKEVlHsuc4uLNOQs+O474qS7+TDpd+xSxuVAuThOsug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741941402; c=relaxed/simple;
	bh=SrrfmRRllZqFek6rbG9nWhX6cTCKReG+Vak6XmvztYc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T2q7scMLVJVvbZJz5y5i1zYJkxMQJR9r0muZnLwgwaiOxFQGhrO1X5xLpbrAF2EEw2ekVmIuCAb2q+ARZlbyeQp/AtsDx9HxVw/4DkYtapxmRgTvA/gfe3XVmC9TfijcZ6vLoJIdApr9Jl8zl0S8rjQRp27zXNkG5f5toQ79+E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id DE207C4CEEB; Fri, 14 Mar 2025 08:36:40 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A13EC4CEE3
	for <soc@kernel.org>; Fri, 14 Mar 2025 08:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0A13EC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZDd0r21k7zCs9h;
	Fri, 14 Mar 2025 16:33:00 +0800 (CST)
Received: from dggemv711-chm.china.huawei.com (unknown [10.1.198.66])
	by mail.maildlp.com (Postfix) with ESMTPS id ECE59180102;
	Fri, 14 Mar 2025 16:36:33 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Mar 2025 16:36:33 +0800
Received: from localhost.localdomain (10.90.30.45) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 14 Mar 2025 16:36:33 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <xuwei5@hisilicon.com>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Jonathan.Cameron@Huawei.com>,
	<liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH] soc: hisilicon: kunpeng_hccs: Fix incorrect string assembly
Date: Fri, 14 Mar 2025 16:28:56 +0800
Message-ID: <20250314082856.3257783-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.30.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemn100009.china.huawei.com (7.202.194.112)

String assembly should use sysfs_emit_at() instead of sysfs_emit().

Signed-off-by: Huisong Li <lihuisong@huawei.com>
---
 drivers/soc/hisilicon/kunpeng_hccs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
index 8aa8dec14911..444a8f59b7da 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.c
+++ b/drivers/soc/hisilicon/kunpeng_hccs.c
@@ -1539,8 +1539,8 @@ static ssize_t used_types_show(struct kobject *kobj,
 	u16 i;
 
 	for (i = 0; i < hdev->used_type_num - 1; i++)
-		len += sysfs_emit(&buf[len], "%s ", hdev->type_name_maps[i].name);
-	len += sysfs_emit(&buf[len], "%s\n", hdev->type_name_maps[i].name);
+		len += sysfs_emit_at(buf, len, "%s ", hdev->type_name_maps[i].name);
+	len += sysfs_emit_at(buf, len, "%s\n", hdev->type_name_maps[i].name);
 
 	return len;
 }
-- 
2.33.0

