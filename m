Return-Path: <SRS0=caHC=ZZ=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9F5ECAAD8
	for <soc@archiver.kernel.org>; Thu, 22 Sep 2022 18:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B52FCC433D7; Thu, 22 Sep 2022 18:17:17 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C195FC433C1
	for <soc@kernel.org>; Thu, 22 Sep 2022 18:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C195FC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id g12so6913455qts.1
        for <soc@kernel.org>; Thu, 22 Sep 2022 11:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=1SnYPOYWPXNRM2Psm7rj/ZZy/4CgkkceBm/2enTCC9U=;
        b=kScHmmvBQQeXEUoxKTYBLHOonsFqgth8+o3WQMQwdN+YZu5PkXbN9yUGeXQd/Uoaen
         ou+HDIkcebMZWz37Ij3VqywT+0ljJkxdWyYPHd7GFjBRsmpmfkdj3CatgU6YH84/avKU
         iXK2s46UaCJiEiNzaJ73jyvd3Yh7AIMt1ptBnGDPoW7gipMpr1+Uoslv9CVVPtajrcFL
         68ZNfX19xJpg5RBhveqP5taX3BM8TtoAZ3zA1Ae7HvHJYLlLHjL1IsjsxzLWDuYlICN6
         k1UbOA+zKgsnbTML41Eib94Mxwc3wqFVcp2zUS2PxmbLVp4uNk1gmD1aGcIE8klkS384
         8Ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=1SnYPOYWPXNRM2Psm7rj/ZZy/4CgkkceBm/2enTCC9U=;
        b=cQSykv2SCGefgX/bY8LTlzUgYOTIG6ZOpJrosFZAzSzlpMNOu/EJDj4/NXa/3kKtl+
         ivMyXzk2nIhEMrZMNNKQyfc57QVMyU1/TVv4XhLoTooaUkx6grdoAwDKW/MKvQVsyZP3
         RV5DNxkvNXdt/ipyLSUDVnlCX04fzKGila3iGq+EwvayaAoNJJFHnLiUhTxdKh7WhtMO
         tt6rpyUvx8STGPAffOiL97Yl3g3xh2t3jXvTkvk/8QKDY8l8j2F9lfOztfyQmKRepF5H
         f1y43kQlSR8R+H33f4rjTfteQJ9QGd45JCGSUjJR/VRi5kGCkXUCc4I38Gzszr1VGlFW
         bxYA==
X-Gm-Message-State: ACrzQf1AYaLWZ/HVO8MuLwx11bmLo8sNEnRvq4q8JpinQSNIQj7WCJXA
	XeMvK5bkfKO32yWglr/5vJ3GGNxi1co=
X-Google-Smtp-Source: AMsMyM4UtZoCgwhBcqHMe/T1MoOeSeqkKSdnQ24nY00Sf0kkYMUwS7O40wN8a3eP67aqz7mkjk2esg==
X-Received: by 2002:a05:622a:1989:b0:35c:dd7a:4206 with SMTP id u9-20020a05622a198900b0035cdd7a4206mr4007735qtc.592.1663870635655;
        Thu, 22 Sep 2022 11:17:15 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id d18-20020ac851d2000000b00342fa1f4a10sm3807254qtn.61.2022.09.22.11.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 11:17:15 -0700 (PDT)
Message-ID: <8c1c4506-bd21-a35e-d6e5-3c7897715c18@gmail.com>
Date: Thu, 22 Sep 2022 11:17:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.0-rc6
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <acdecda4-b11a-4e15-9ac9-6d2696218012@www.fastmail.com>
 <87427dd0-7307-57b2-4008-2ffb839a099a@gmail.com>
 <CAHk-=wiux9J6zi8sEHyLBVYc7zsWe6JwYOf7ggF+Oowc6fp4tQ@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CAHk-=wiux9J6zi8sEHyLBVYc7zsWe6JwYOf7ggF+Oowc6fp4tQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/22 11:13, Linus Torvalds wrote:
> On Thu, Sep 22, 2022 at 10:19 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> In case Linus has not had a chance to pull it just yet, could you amend
>> it?
> 
> I did see this email, but as I expect to be AFK for the next few
> hours, I took Arnd's pull request as-is.
> 
> I could pull your Broadcom fixes directly on top if you/Arnd would
> prefer that as a solution?

Thanks for the offer, no real urgency on my side, if there is a -rc7, 
maybe Arnd can submit a follow up for ARM SoC fixes, as there is a good 
chance we will accumulate more of those between -rc6 and then. If not, 
and Arnd is fine with it, yes please pull mine directly, thanks!
-- 
Florian
