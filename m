Return-Path: <SRS0=ablS=OE=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C247BC433EF
	for <soc@archiver.kernel.org>; Tue, 14 Sep 2021 14:04:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A24A360EB6; Tue, 14 Sep 2021 14:04:39 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C7026108B
	for <soc@kernel.org>; Tue, 14 Sep 2021 14:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C7026108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-ej1-f51.google.com with SMTP id hx25so6261146ejc.6
        for <soc@kernel.org>; Tue, 14 Sep 2021 07:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ElnYE0CucJpW4adwsIEEuLlE6bvR7h4olEB7PyDvlj0=;
        b=pZobn6wZkrBBoYLS0hVSFyYVOuc6/d2aYY9CkTlr5uFOonXkOpRYS7xJ6cZFRdFXIx
         51CQFJAsj18Kn9+AFSgDGDpuJUHbeJbrbAUIb5LKBp9Vx7s5+LclaWDBx7KsjLSlTqnz
         Nt0HScAnr/QhrZCirYy0l+BrxJ0DHxZwWO/25t3jLCHh61gh91Ilau6XzwU2s6hMxwTf
         F/NKWV0FLK++gAO2S9nd78oqrUvJus1yfeGUxmM66Y0nY5Bg7SpihOD9tND2b4dJ3PBe
         eoJi22EvpQtJnv+q75ADxWsfJ7zGKOtgcVckzGhqBgKss7XM2VQDQ8yYbAZERj+FaCM4
         VwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ElnYE0CucJpW4adwsIEEuLlE6bvR7h4olEB7PyDvlj0=;
        b=Duy91JFxX+EBREBZJd2s+iaUyhgjO35ENHwhiIT1zSshdKSZkYJrguOU23w8EE5g+j
         pXk4iQd3dv1vnRTTRxeDw7nTTmig+YJd+EDc8mpHFO9av3gu0QvX0XiL3ova7OcPpynx
         OnoS6p/RlVHm4M7XNGNDo8Vd1SbUZPW9elG7YRzW88JFc3sd6K14mHrtekV0s94Iz5Wn
         iw+dt6EYuIs4MSy3XXM33z++sDhZsc3UkMy9k4OykNlRbGHCjAt4c2s6I2TPfgc9VWvB
         7haBzUc1koTgqIEtMpfbPDNiAQ4KtmU5Hr4jijGM9n3neVgGA1qNNhpsOPa8n7sgpGzJ
         mDmA==
X-Gm-Message-State: AOAM530lE53ThCX2hCJrFbns76v2KIAOBQ9QWjYjok8MIvX3GinHFUYx
	/qKtKnUMbqRVcz9IYPxeef1FgcyG0/+XEQ==
X-Google-Smtp-Source: ABdhPJyMSooGg/fbCGoDgMOyoBCDqwmsm6uc32vi92SIyT5z5degqSybWye/0nNLsFu9LYL5Hknl3A==
X-Received: by 2002:a17:906:4f82:: with SMTP id o2mr19747880eju.10.1631628276911;
        Tue, 14 Sep 2021 07:04:36 -0700 (PDT)
Received: from ?IPv6:2a02:768:2307:40d6::45a? ([2a02:768:2307:40d6::45a])
        by smtp.gmail.com with ESMTPSA id s18sm5146336ejh.12.2021.09.14.07.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 07:04:36 -0700 (PDT)
Subject: Re: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.15
List-Id: <linux-soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, patchwork-bot+linux-soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>
References: <cec98151-d7a9-3fdb-ba5c-dc1fd182c2c4@monstr.eu>
 <163010220873.19400.3396594122611634350.git-patchwork-notify@kernel.org>
 <CAK8P3a38ZeKhg07Ed3fh2puouNKwXjRvosJaf5zWaKqF6x5+7g@mail.gmail.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <0a30a2dc-047c-94d1-9714-4c2cb70539d7@monstr.eu>
Date: Tue, 14 Sep 2021 16:04:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a38ZeKhg07Ed3fh2puouNKwXjRvosJaf5zWaKqF6x5+7g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 9/14/21 3:58 PM, Arnd Bergmann wrote:
> On Sat, Aug 28, 2021 at 12:10 AM <patchwork-bot+linux-soc@kernel.org> wrote:
>>
>> Hello:
>>
>> This pull request was applied to soc/soc.git (refs/heads/for-next):
>>
>> On Thu, 26 Aug 2021 16:36:21 +0200 you wrote:
>>> Hi,
>>>
>>> please pull these patches to your tree. I have one more patch for adding
>>> new Xilinx Kria platform but that discussion about compatible nodes in
>>> overlay is not finished yes. That's why I am sending this pull request
>>> without it.
>>> A lot patches are coming from dtbs_check fixing and synchronization
>>> among boards to better see differences. But also couple of drivers were
>>> already merged that's why make sense to enable it.
>>>
>>> [...]
>>
>> Here is the summary with links:
>>   - [GIT,PULL] arm64: dts: ZynqMP DT changes for v5.15
>>     https://git.kernel.org/soc/soc/c/6f4f55bdc436
>>
>> You are awesome, thank you!
> 
> Hi Michal,
> 
> Just to let you know, these patches ended up not making it into the release.
> They came really late before the merge window, so I put them into the
> arm/late branch (along with the rockchips/dt64 branch) with the intention of
> sending them in the second half of the merge window, but then Linus mentioned
> that he had seen enough patches that annoyed him for the merge window
> and I dropped the branch.
> 
> I don't see anything wrong with the contents though, so please rebase on
> top of v5.15 and resend the branch for 5.16. If there are bugfixes that you
> want in v5.15, maybe split those out and send them separately for the
> fixes branch.

ok. Not a problem. When do you start to accepting patches for 5.16?
Around rc5 or even earlier?

Thanks,
Michal


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

