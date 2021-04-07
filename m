Return-Path: <SRS0=Yh/P=JE=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB29CC433ED
	for <soc@archiver.kernel.org>; Wed,  7 Apr 2021 07:03:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A1BC761260; Wed,  7 Apr 2021 07:03:14 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49D58611AF
	for <soc@kernel.org>; Wed,  7 Apr 2021 07:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49D58611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-ej1-f70.google.com ([209.85.218.70])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lU2DY-0000tS-FC
	for soc@kernel.org; Wed, 07 Apr 2021 07:03:12 +0000
Received: by mail-ej1-f70.google.com with SMTP id jt26so687611ejc.18
        for <soc@kernel.org>; Wed, 07 Apr 2021 00:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EPPmWmdaq2dh/UGET3fGHk7TqyifSikdBPPTcaMQ1jg=;
        b=KnXavfo/sGUc3fxDY03/WzCZPq0Fpkj5IxAjMJVLx8LEHnWhfbappCcPk7Fka47PGO
         tim9PeVbkEE6sFzrXpj5W7doS6B0oyw0v14t4zOJjYNIaXV+R3KPt3dObxKJYE5BYMxO
         FR1YdfNHRhmbGdSdzl5G4iA0cUyWht3kwe1L5oD4M/LahR9bifFtTXArOanbBzWF748y
         p0GI2WPwDS+lrKaXLwMuqYnAY4HNlQfZAacdJFDM2FWk07hVWnG0to6auykCS6a/2zIn
         7HcSNXQhSDstC/+ufJBRhs77HMtY82UhWv7AXXu6wcsqnQKzHmy+J/MtWXqs2K7dz/Z1
         ZfKQ==
X-Gm-Message-State: AOAM53376dLLyMH3bCHUdipJswmYT0pX0RaKlV3l+/s5u4vB7IPRSmql
	062sMnn1hODerfqX33S5ru/a5yUy2K5M4wv0nWY8dB+JunrCiz3usRfUwxqEDgjIgAtKnfuGCHx
	HeyPUhboSRI+yzDCC+7VFTrs=
X-Received: by 2002:a17:907:8315:: with SMTP id mq21mr1978847ejc.197.1617778992249;
        Wed, 07 Apr 2021 00:03:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5unwAu/pheJs7/Bm4+tsoa6su36QNc2QP3KIySluVf5OYxVWePEgyI1T1vZ5SuhSIJMwiOQ==
X-Received: by 2002:a17:907:8315:: with SMTP id mq21mr1978824ejc.197.1617778992048;
        Wed, 07 Apr 2021 00:03:12 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id s9sm14384640edd.16.2021.04.07.00.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 00:03:11 -0700 (PDT)
Subject: Re: [GIT PULL 1/3] ARM: dts: samsung: Pull for v5.13
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <33fb7d93-a091-e1d4-e0e6-463c391b6e76@canonical.com>
Date: Wed, 7 Apr 2021 09:03:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/04/2021 08:58, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <krzk@kernel.org>

I still did not update all my tools for new email - this should be
"From" my Canonical address. The tags are signed with the same key with
@canonical.com UID.  The latest key is already in kernel PGP keyring:
https://korg.docs.kernel.org/pgpkeys.html

Best regards,
Krzysztof
