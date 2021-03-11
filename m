Return-Path: <SRS0=XWxL=IJ=foss.st.com=patrice.chotard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A316C433E0
	for <soc@archiver.kernel.org>; Thu, 11 Mar 2021 15:24:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EEF9664FAB; Thu, 11 Mar 2021 15:24:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 497C164FA6
	for <soc@kernel.org>; Thu, 11 Mar 2021 15:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 497C164FA6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=patrice.chotard@foss.st.com
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12BF74Zo011771;
	Thu, 11 Mar 2021 16:24:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=v+c1CwgHEdj0dQK0n2xQKNTW00bhBAc+aNy3B1sUE1s=;
 b=BTfNMr9l0h2mjKOtsPNeZvKzT9gD4Tbjdy1JwpBUA+fpqsNPkFqQ4o6xqz+R91HSKM5T
 D3AS4A6EDBLG7Zcsw8sBAgyAthYFWMFEFmc6N41VfPOclbZavZ5IOfj8GugLHoOFYb9r
 10q7Bo4AGBAsJWr32ff9BwooKnUDANoeh2X27zK/stZXzfrXxVPMWi0E40q5twQj5EXz
 GcG4FhAMvmPHE8JnWyVnU9QYWDLK/csq+ScpQ8xNYJdsIGncf3lQaC8FNJMpKIeLJlwv
 Tvx50fUL9KScYPd8l9WeHyeNkndcLPgLMQlOSFTWlobfbXuJJiWOixur/GkVw/W5/bko Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 3740377k8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Mar 2021 16:24:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E0E9410002A;
	Thu, 11 Mar 2021 16:24:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D7D4B24CFD6;
	Thu, 11 Mar 2021 16:24:40 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Mar
 2021 16:24:40 +0100
Subject: Re: [RESEND PATCH 0/3] MAINTAINERS: update STMicroelectronics email
List-Id: <soc.lore.kernel.org>
To: <linux-kernel@vger.kernel.org>, <soc@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>
References: <20210216074929.29033-1-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <1cd91834-6df8-a655-a3b1-0e16f5fe470d@foss.st.com>
Date: Thu, 11 Mar 2021 16:24:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216074929.29033-1-patrice.chotard@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-11_05:2021-03-10,2021-03-11 signatures=0

Hi 

It's just a gentle reminder to not forgot this series.

Thanks

Patrice

On 2/16/21 8:49 AM, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> This series:
>   _ Update st.com to foss.st.com email for some maintainers.
>   _ Remove Vincent Abriou as STI/STM DRM driver
>   _ Add Alain Volmat as STM32 I2C/SMBUS driver maintainer
> 
> Patrice Chotard (3):
>   MAINTAINERS: Update some st.com email addresses to foss.st.com
>   MAINTAINERS: Remove Vincent Abriou for STM/STI DRM drivers.
>   MAINTAINERS: Add Alain Volmat as STM32 I2C/SMBUS maintainer
> 
>  MAINTAINERS | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 
