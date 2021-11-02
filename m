Return-Path: <SRS0=YOEr=PV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3799DC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 03:33:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 038AE60F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 03:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 038AE60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BoaO5oXseXE9gaS1TewFhb9qmGk/s6vqJ0eHskLfDgo=; b=ihWjrWOGc3ZNvS
	sLSB0X4QC3A9DDGlw3SMeXNfI7bZb/FSO36Q4QfWtssr9o3vIJ046EZQaTN22OZQPLGIIbz875mvK
	IwlVc0gSfLreuR9ecOZprbWxCjZLawiC0s715rzS/+iW1PsBYHGdjeMNB3pdFBdy7WOB4eP990625
	TE6vjSC3RKTa4WVtXHPnTNZH05XrQC544UPZXcXAtNfja8VEWCEOc1X7y+2lxvYCLSzpOyXp4OwSJ
	vw+4x1Y2ijEhjbc8J0Y68/stkmsP1xinaoQb/8e8Nw7zMRp7uP54dEo4EAmMZyk97BM9+f1IeBaWp
	Cq4byYh1nmR7+Me01xhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhkXF-000SXH-18; Tue, 02 Nov 2021 03:32:29 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhkXB-000SVk-F9
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Nov 2021 03:32:27 +0000
Received: by mail-qt1-x829.google.com with SMTP id r2so16494132qtw.12
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 01 Nov 2021 20:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
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
 b=yI6nj+OesXf32lXAxyGD35lVnhQOvA9r7o9rZISv/EgIwhCcgZUVDyUTUNBVusGX/B
 SwBmii0FSCvTVjFSM4SB7tHTazYsVRkmNS+xlNeM0EcxK4VJIlsdGuHbi6B6vt5gnepy
 2raXXJPuxj4yJdi5XzfAKo1owNzOJzZMNPSDsFHYQ9GnMc2ZlhqnhdkpmClR8g8Zmiw+
 GDxSqQEtHeyvICheuZeKRf5wzcWf1947Vn9NajbrAYqeo8SqGHYZAZa+FQCkutrQAln7
 O3YviSfReL209bz9p3CwKiaY77qbxjjI6We/Bh2wn5vmCWD3Vsh5cdAhhYWCnFNQENiu
 7mwg==
X-Gm-Message-State: AOAM530tnS54Uv4Y01Zs3yH1J8kW+rIpByiMJ43coEF/O/69Mc55j0h4
 iXCI3sQRtW3Uvlh9QwQmKaM=
X-Google-Smtp-Source: ABdhPJzF5RqaqayWs3xAVNhdtWPF99fNOWgT7/fdcJTkR9sKGuVAuM+WBDmRff/bw28k+/7FBj68Fg==
X-Received: by 2002:a05:622a:1441:: with SMTP id
 v1mr35430791qtx.45.1635823939799; 
 Mon, 01 Nov 2021 20:32:19 -0700 (PDT)
Received: from [10.4.10.38]
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_203225_541065_B6B76B09 
X-CRM114-Status: GOOD (  16.66  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211102033217.cizZHc6H6-gz2UFPg1qnP8emzmS1fH3Z_9FmlJpNY1E@z>



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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
