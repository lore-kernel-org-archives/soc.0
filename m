Return-Path: <SRS0=tZzA=VN=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E523CC433EF
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 11:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CCA20C385AA; Thu,  5 May 2022 11:23:49 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D3ED5C385A8;
	Thu,  5 May 2022 11:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D3ED5C385A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id eq14so2752083qvb.4;
        Thu, 05 May 2022 04:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6U81F3J95/rsKZwfBRMct5IzTiEVBNMXd4/8yYgv1pY=;
        b=h3ZZbjzjpSuW7/PZ8tQDPty8Qynf+MDjS6JNjHEtstVUzL+0nGy2id5rG8A+oivq1L
         9Ond9wLsMUEHqHxInPeFL21Go62hJg3//jT9oAydMsWZpgfr1JQZZSvlOZjMcHj9SN/o
         4GoBJf16VZhWzr6xJJekScoDVgrm8jdRFSRTlCNwVMkj9noWh6bGg57JdkNxtlHiq+OV
         X8LUsHEK2YM7xnhlXJmoGwamHfX2QsUfjoGmmVgcCPLKKSmLEddVTBYL1jQFxNS4NC+U
         TNVD7JjQzpSLlxyGfVXA1TAKJfW43i+rIYd5de/mpgvw23dS6HH4/0PXSFpEnZZmtxrL
         JHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6U81F3J95/rsKZwfBRMct5IzTiEVBNMXd4/8yYgv1pY=;
        b=MUIoru3aj0HnPS8OXjFaOpw1e8tmpnGcwmsRzGywofY1VWzneRPKXvuJ4k6nUfApAQ
         tzlKIMn9v2XZQBNmwQCBDTDL4KhJKeGWayAGRkTHhBNFf9lffZ7HvQHMsv0RuG6WUBCB
         NoFwp1/MEBOHTlY4FYahBKSrU9LNVJw0PnHkR6E3bjA+24ZynrVatv1JQkrFH9qXrByG
         AHuFVqH1XEP/uJNBslDA632rXD4gT0Wucbw+cs/hRgfQcs29BWofsR9m6QUQuS3WgmnD
         g/LJrXUkWMhBroIDUZ8kksmtQyKmFxiy/z08txnxZEZHXDW/BDDdRkmVpYyJA50lW2Jk
         QL6Q==
X-Gm-Message-State: AOAM532R7H27cTgK+fqDVVu4OwCO/fq3238C7ayMSG73mPBTU4iiRwU7
	f0/OaRN78i9QsL0lroG+AI0=
X-Google-Smtp-Source: ABdhPJwGpx1RTwxpJjGtF0OKzKQcTGoX1QKpDZJVF/fVCD8pLGCgp5rXHRMGH50s7Yvjz4lFgtgGjQ==
X-Received: by 2002:a05:6214:2461:b0:45a:bcbd:bcf7 with SMTP id im1-20020a056214246100b0045abcbdbcf7mr4526808qvb.79.1651749827778;
        Thu, 05 May 2022 04:23:47 -0700 (PDT)
Received: from [10.4.10.4] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id i21-20020a05620a27d500b0069fdbe43a5asm652449qkp.41.2022.05.05.04.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 04:23:47 -0700 (PDT)
Message-ID: <5b8a7e58-1b84-6a6b-cc9e-b4224392b5ef@gmail.com>
Date: Thu, 5 May 2022 07:23:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 12/15] pinctrl: freescale: Add i.MXRT1170 pinctrl
 driver support
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, robh+dt@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
 stefan@agner.ch, daniel.lezcano@linaro.org, tglx@linutronix.de,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, dev@lynxeye.de, marcel.ziswiler@toradex.com,
 tharvey@gateworks.com, leoyang.li@nxp.com, sebastian.reichel@collabora.com,
 cniedermaier@dh-electronics.com, clin@suse.com,
 giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
 <20220428214838.1040278-13-Mr.Bossman075@gmail.com>
 <CACRpkdY2MNkAKhVOQ_Eyq0AwOtEW-seSrxgsJ2D8E78u636A8A@mail.gmail.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <CACRpkdY2MNkAKhVOQ_Eyq0AwOtEW-seSrxgsJ2D8E78u636A8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/4/22 17:38, Linus Walleij wrote:
> On Thu, Apr 28, 2022 at 11:49 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
> 
>> Add the pinctrl driver support for i.MXRT1170.
>>
>> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>> ---
>> V1 -> V2:
>>   - Nothing done
> 
> If I get a review from a Freescale maintainer on this driver and the bindings
> I can merge it separately, correct?
That's fine with me.
I cant speak for Abel or Freescale/NXP maintainers though.

Thanks,
Jesse Taube
> Yours,
> Linus Walleij
