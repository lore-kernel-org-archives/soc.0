Return-Path: <SRS0=caHC=ZZ=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C097FC6FA82
	for <soc@archiver.kernel.org>; Thu, 22 Sep 2022 17:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88D73C433C1; Thu, 22 Sep 2022 17:19:56 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4AD0C433D6
	for <soc@kernel.org>; Thu, 22 Sep 2022 17:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B4AD0C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id b23so6737780qtr.13
        for <soc@kernel.org>; Thu, 22 Sep 2022 10:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=YW1vyfK0IFS8wI5DuxeJs6+Exwqe/LMWpZCMhRTfroI=;
        b=Hxv2i39fcXPBjVK4g7jtOpTEqBgIAOOERFyAheJD0Fm8U3RHi2b/0QMBGhJVtG2cyp
         X/6KHWkPFrNJ/VGq43wSgWPOnZyUQKxF10KFm1+Ean18WhIswcgilKv1gxqP5huJCMrW
         mOQbF4OJ8kDwLB+MmCjaWYuFPECxrrRta7V28IOVERVc6WX19/q2de3W2GGaUB+rQE/t
         xTdx5C4U36GriccQPh4/o9Oc4PK8E0rz6Yc2Fx3OrKkpaeR9T7mqIJkL84Ci5W5VzVQT
         7Ku+v+TH2esBzY1PE5yL/1QSjfWeHfcfCHR0Sjy20LLQtcz7RVt/9cnPnhch8hD/Xwa7
         amnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=YW1vyfK0IFS8wI5DuxeJs6+Exwqe/LMWpZCMhRTfroI=;
        b=jVhKT8AlLdqmq4EkynkY9uPPTgrfKLH9TwCC8RVgkgzrsJoJwxCWKZQzT0Naoaxu6N
         yRsKDkj0Crc2bCsedFH7q2VePRDA1vIUfZrNi+nzh/hPojH8OK7NdteG6WnFH4xyxk0k
         qE/DHMubuFZXm9M5HtyljSseUjQrEt7V9F1cWBKJSdZuZjM0UGkLoJQXlbu3q2EY5ORx
         KuTIKAdK7YjNR6Ki7RWtXUpD40AdeSAQ4kapQobRdFf2O9VfDw2tgoByCqed6fP4GJDm
         jb0t6YcDQnHX5QrNswneyDfBdBi3Fu131/cYX1vRN7tMG1u1m4etd8WCgY1H+Q3SZZnt
         sDEQ==
X-Gm-Message-State: ACrzQf1T/bx7ZNg8XMOpHjbindwayIvDtvOM8/8XXJ8sLqQNpsyxA2Ql
	1Zwli6iGUS/h5lb1JpeCSCw=
X-Google-Smtp-Source: AMsMyM5p34CrKi2jcfxG02C5TgN9snPm/q82SonXdwbQPz/zsl6+J33SRKgi9/iz2ewgjW8kqT2XOg==
X-Received: by 2002:a05:622a:50b:b0:35c:f172:514e with SMTP id l11-20020a05622a050b00b0035cf172514emr3869458qtx.60.1663867194659;
        Thu, 22 Sep 2022 10:19:54 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id w4-20020ac86b04000000b00342fb07944fsm3707104qts.82.2022.09.22.10.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 10:19:53 -0700 (PDT)
Message-ID: <87427dd0-7307-57b2-4008-2ffb839a099a@gmail.com>
Date: Thu, 22 Sep 2022 10:19:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.0-rc6
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <acdecda4-b11a-4e15-9ac9-6d2696218012@www.fastmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <acdecda4-b11a-4e15-9ac9-6d2696218012@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 9/22/22 08:32, Arnd Bergmann wrote:
> The following changes since commit 12f09234bde51810b3f7412b2b5c84af4c07cfb1:
> 
>    Merge tag 'renesas-fixes-for-v6.0-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into arm/fixes (2022-09-02 12:05:28 +0200)
> 
> are available in the Git repository at:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.0-rc6
> 
> for you to fetch changes up to aaa58141a5d7647b14d812dde92b8d680e0985db:
> 
>    Merge tag 'at91-fixes-6.0-2' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/fixes (2022-09-15 21:54:07 +0200)
> 
> ----------------------------------------------------------------
> ARM: SoC fixes for 6.0-rc6
> 
> Another set of fixes for fixes for the soc tree:

Looks like this pull request just missed the one I am replying to:

https://lore.kernel.org/linux-arm-kernel/20220918205038.3017866-1-f.fainelli@gmail.com/

In case Linus has not had a chance to pull it just yet, could you amend 
it? Thanks
-- 
Florian
