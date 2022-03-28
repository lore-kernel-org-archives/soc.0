Return-Path: <SRS0=18dB=UH=opensource.cirrus.com=prvs=7086e7f598=ckeepax@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB040C433F5
	for <soc@archiver.kernel.org>; Mon, 28 Mar 2022 09:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6730C340F0; Mon, 28 Mar 2022 09:46:28 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 082F1C340ED;
	Mon, 28 Mar 2022 09:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 082F1C340ED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22S89AWv025933;
	Mon, 28 Mar 2022 04:46:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=ycAqSODlyIBXBYeXGaVL2PLkjXwClbha5XEkRlCAIWY=;
 b=jEwkhI/qxfclrXR0NKU9JIp9J2w4hi54hUS+heNPf+nLUeEUmMO1r20/hm5I8Qll6UMx
 6SfJyLDL9PJMzMMYOA5yceYS5nb7CQUEWSbmuItF+hATxd4TSMzEm231Q/YCZpqZdcW9
 q/epUAOG5BA4zrbUGw+T2sxVcUgfwBg6f4ptJtrUdVkWVOFfxco1XbfswZE00V2CMeUd
 WzHRsjhbfX8c9t19y75e1/AkpqIfEqq3kikqFxIXPCVPc7b7ZJo3LLPd8dy0S8W5RxXh
 9jYnSIU2F6ZRdisJz1C+RCNyAwbS2FlpO1r24q3W1EJlK8noJRkFpg84SgY9JR17NMzs 7Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3f1y8pa88n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 28 Mar 2022 04:46:23 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 28 Mar
 2022 10:46:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Mon, 28 Mar 2022 10:46:22 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E869546A;
	Mon, 28 Mar 2022 09:46:21 +0000 (UTC)
Date: Mon, 28 Mar 2022 09:46:21 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <soc@kernel.org>
Subject: Re: [PATCH v1 7/7] ARM: configs: Update multi_v5_defconfig for
 WM8731 bus refactoring
Message-ID: <20220328094621.GA38351@ediswmail.ad.cirrus.com>
References: <20220325153121.1598494-1-broonie@kernel.org>
 <20220325153121.1598494-8-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220325153121.1598494-8-broonie@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: t1XWJyBuqDFaC_T8WjVC8zT3hlZUzAel
X-Proofpoint-ORIG-GUID: t1XWJyBuqDFaC_T8WjVC8zT3hlZUzAel
X-Proofpoint-Spam-Reason: safe

On Fri, Mar 25, 2022 at 03:31:21PM +0000, Mark Brown wrote:
> The WM8731 driver has been refactored so the I2C and SPI bus code is
> separate modules. Refresh multi_v5_defconfig to reflect this.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Cc: soc@kernel.org
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
