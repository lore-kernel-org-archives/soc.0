Return-Path: <SRS0=V3zi=PV=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92111C433F5
	for <soc@archiver.kernel.org>; Tue,  2 Nov 2021 03:32:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 43F9361051; Tue,  2 Nov 2021 03:32:21 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E60360EE9;
	Tue,  2 Nov 2021 03:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E60360EE9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id h16so13362665qtk.0;
        Mon, 01 Nov 2021 20:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=q5xMzCydsOIW4HjjOOaSLM7lfTR/flQAzXNP4pGjc9U=;
        b=U78XbMRz+qE4VaDT7oxdXMYQ/jmLMdehcG/VGRktZQktJubRPUJJxkDuurnUVcehvR
         0IVl+Bh8/FvVmGYH0T4OrasWQIxlVo8Xb1iFXzppqXv/ZlEVRbdeJlkg2EZKL0Apzzxr
         N/T/zKCLkEisYWxqhKHKRNBx4rUreKGAnd+6L+JfdYsNc1CBxBr/RvxCQj0yo1K/IGRp
         F7zpiLslbTYhnGt+xhwmCDtEU/nuWehaVE5wmzLHlDX5gdHLp8uXFah9L9a2Q7AKHd2x
         pU/d19XiG/UwuGXsckmXZhBKKDlLZO2pDMmmh0MBxg5KsyIwf/RERiu/tJdz4TutwaPO
         gpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=q5xMzCydsOIW4HjjOOaSLM7lfTR/flQAzXNP4pGjc9U=;
        b=FqZeK4iwdGCyqAg4PcyIqfxzWMcEdfocvq9oGogOVpaTnouLRNyh1mlffIb7sq462J
         +QExJbo43rNiynIVf+mT784H0zvsr4I4VQ+WYWzFbo8IKKs3UOcmrjL32sfZ4JQG88nY
         0M8obT8GINh0OBBkIxOz/RDoi/lu0khfwHeD6fcu4IaFWjoW7a21rnlm/2WiUL2jyRom
         14pKa7g5zqxwUOKn0dsc1KStY9+dgaeUCW56/pdb52rAAHxypZpftZFjN6T8YupRbl/J
         nPSBQNGxCPc8tkZyWsOIrDhAonDM0xTiToqPdoU+zdf8kXM1devJ+GkkjNnjgmKFOnGf
         9u9A==
X-Gm-Message-State: AOAM532D2MTPVOhXbEYKmiUrwkILOMjD0l7dBwBJLZXPLqZSHS7805DP
	n4frOVE5FsKbUqYcUR1HJH7zcWJJIevf4j7l
X-Google-Smtp-Source: ABdhPJzF5RqaqayWs3xAVNhdtWPF99fNOWgT7/fdcJTkR9sKGuVAuM+WBDmRff/bw28k+/7FBj68Fg==
X-Received: by 2002:a05:622a:1441:: with SMTP id v1mr35430791qtx.45.1635823939799;
        Mon, 01 Nov 2021 20:32:19 -0700 (PDT)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id l22sm81668qtq.45.2021.11.01.20.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 20:32:19 -0700 (PDT)
Message-ID: <071c0b81-be62-8fc3-cf0a-d8a74a9a556c@gmail.com>
Date: Mon, 1 Nov 2021 23:32:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 03/13] dt-bindings: imx: Add pinctrl binding doc for
 i.MXRT1050
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, ulf.hansson@linaro.org, stefan@agner.ch,
 linus.walleij@linaro.org, gregkh@linuxfoundation.org, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
 adrian.hunter@intel.com, jirislaby@kernel.org,
 giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 leonard.crestez@nxp.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154017.5X5YE5S_x5KJDGyYyx5jd-8m4gybur1xerb15SgFAiY@z>
 <YYBJyKv61p/sk1PE@robh.at.kernel.org>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <YYBJyKv61p/sk1PE@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/1/21 16:10, Rob Herring wrote:
> On Sun, Oct 24, 2021 at 11:40:17AM -0400, Jesse Taube wrote:
>> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>
>> Add binding doc for i.MXRT1050 pinctrl driver.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>> ---
>>   include/dt-bindings/pinctrl/pins-imxrt1050.h | 993 +++++++++++++++++++
>>   1 file changed, 993 insertions(+)
>>   create mode 100644 include/dt-bindings/pinctrl/pins-imxrt1050.h
>>
>> diff --git a/include/dt-bindings/pinctrl/pins-imxrt1050.h b/include/dt-bindings/pinctrl/pins-imxrt1050.h
>> new file mode 100644
>> index 000000000000..a29031ab3de0
>> --- /dev/null
>> +++ b/include/dt-bindings/pinctrl/pins-imxrt1050.h
>> @@ -0,0 +1,993 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
> 
> Needs to match the .dts files which has BSD-3-Clause. The rest of i.MX
> uses MIT IIRC. You should align with that.
> 
It seems to use "GPL-2.0+ OR MIT", I shall replace the both with that.
