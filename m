Return-Path: <SRS0=Xs+J=I5=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CFEC433ED
	for <soc@archiver.kernel.org>; Wed, 31 Mar 2021 22:08:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5826161077; Wed, 31 Mar 2021 22:08:13 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F8F561029;
	Wed, 31 Mar 2021 22:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F8F561029
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pg1-f170.google.com with SMTP id i6so288087pgs.1;
        Wed, 31 Mar 2021 15:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=auQcH4kQTAWsybz5oxIwhgFg24UDR3gcUAooovC8mYU=;
        b=JmjAQ+nIJGDi+hhgfxQNLC5/yaWvx2r6unUcGfUtRiqx1A3jcarIRRXostm7LDuO0Y
         ZHHrUt3o6MmBd3BXIesvEoTibkvlyINDlFMxrrb7bs7J1HRqIKMbZsSeOOY5jlU3qKHl
         mA/Oc/o5PSfbhOSxmZSNvN88N4dHfMiXVSwNGfrAO8c7qoSp1f8yC49ut1Yf5feuE6Ay
         7pP/xJBJUEIODvJeUujdcdX35w15EE6TtyVtYtPwPL25fwVvwuvYdjVzps6TOywWa8cY
         MAEYgNkHp9cYBpnR+Gk22H6PIavqUxkF64UWt1FhQTT698PaiyXVyiZUQonWxpnKJv03
         YPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=auQcH4kQTAWsybz5oxIwhgFg24UDR3gcUAooovC8mYU=;
        b=JpOjec0IuagjQWt52+YOGFIPD9n58Kfb+TFCWdRWxVy6svilAyxPDEPhhwbOIptN2V
         169iKZSoLz0vcShW2+frW42tm2vnZ7S+No8W3ZNhNbUCRX6juBOf+mGETCLHnbmOBlSX
         ADSKuFJ65zhqoCoFdyAawrgokJPhLguM+KGa488oXtLdsD6sSCQzifVdAUVIc7ZfcnbE
         /cuCO5hrlSwui4IfIJeJv6xa1FGEoTq4O7TL+CHUZOdrJtj6Z3kdWwfO1KqhRXrU+MSm
         t7MidkFrPynUS9wutpAdbM2kf6cuxB6Xgn8OWy69qZbI0a+9yjMIOr7UBiTgOLJAxTyM
         5VgQ==
X-Gm-Message-State: AOAM532CQ+3guEs5vvCB1C+H6tVZOuZuc5X1Acs5nayqeBKO86NgTPYq
	JPgAijjILAGE8luwwecs99E=
X-Google-Smtp-Source: ABdhPJxF7yeRzeTkCkiGCLWIEQNr9P/uzNyMqzzq4/YtVQyifxIfk8THKdrtaeDKr9AdcCtwzsTx5A==
X-Received: by 2002:aa7:9ecf:0:b029:1f4:f737:12d6 with SMTP id r15-20020aa79ecf0000b02901f4f73712d6mr4899366pfq.8.1617228492627;
        Wed, 31 Mar 2021 15:08:12 -0700 (PDT)
Received: from [10.67.49.104] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id i11sm3523484pfo.35.2021.03.31.15.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 15:08:12 -0700 (PDT)
Subject: Re: [GIT PULL 1/3] Broadcom devicetree changes for 5.13
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
 olof@lixom.net, khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20210330184006.1451315-1-f.fainelli@gmail.com>
 <498a63cbc96cd52210260e6d0229ad74@milecki.pl>
 <c71b8949-b709-cb5b-b5a4-87cebf8cd8df@gmail.com>
 <213cdda3ff9ab8fba6fc840bfcb57383@milecki.pl>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <a8091fe8-26ac-504a-9cca-d40180f6d835@gmail.com>
Date: Wed, 31 Mar 2021 15:08:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <213cdda3ff9ab8fba6fc840bfcb57383@milecki.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 3/31/21 3:06 PM, Rafał Miłecki wrote:
> On 2021-03-31 23:48, Florian Fainelli wrote:
>> On 3/31/21 2:36 PM, Rafał Miłecki wrote:
>>> On 2021-03-30 20:40, Florian Fainelli wrote:
>>>> The following changes since commit
>>>> fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
>>>>
>>>>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   https://github.com/Broadcom/stblinux.git
>>>> tags/arm-soc/for-5.13/devicetree
>>>>
>>>> for you to fetch changes up to
>>>> dcb56d61d5a8acca0a357cc603397bc0272ce4cb:
>>>>
>>>>   ARM: dts: BCM5301X: Set Linksys EA9500 power LED (2021-03-29
>>>> 11:43:45 -0700)
>>>
>>> This one seems a bit confusing.
>>>
>>> Command:
>>> git log arm-soc/for-5.13/devicetree
>>> shows me only 2 of mentioned commits
>>>
>>> Web UI:
>>> https://github.com/Broadcom/stblinux/releases/tag/arm-soc%2Ffor-5.13%2Fdevicetree
>>>
>>>
>>> references dcb56d6 but opening it shows page with a warning:
>>> "This commit does not belong to any branch on this repository, and may
>>> belong to a fork outside of the repository."
>>>
>>> My guess if you didn't push your local devicetree/next branch.
>>
>> I did and then overwrote it, it should show up correctly now.
> 
> I think you just pushed drivers/next instead of devicetree/next.

Humpf, yes, now fixed.
-- 
Florian
