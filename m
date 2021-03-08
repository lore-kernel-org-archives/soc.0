Return-Path: <SRS0=nlsx=IG=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31AD7C433E0
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 22:03:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0BD336525F; Mon,  8 Mar 2021 22:03:04 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D477665257;
	Mon,  8 Mar 2021 22:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D477665257
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d8so5528092plg.10;
        Mon, 08 Mar 2021 14:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0IxAVv9HFNQDOGu6qEb+RKfGTfy8P8WYeCdHsFyTnEA=;
        b=sdlyVxvYAVZILno1bFpsFADQM7JOXTj+Tl6XUq9YnMT5E39TRqczzuHWYQRhMBxu47
         hnB0FCwheJXyObpp47KW+PjZd1ZmiC3iZa9GuV5n+YPJEU5G/oPfHMDhdOjBp51soHgg
         H90txOuk1CwOWeAMmUfM6Hwqul1AUsc7SG95Q9VSHEd4DmBQd9Hv8JVZkE7mEkQuGjlY
         CYwFlIvPM/QQA1cr42O9+oWAc9jHCSOB/RpWivubITRPLFnuh5Er6mtuftfT8h8bQRhF
         KV9RAouvXV4BqjS1CBPgkfRu44yDtw4BIx2cBm4KvPlB5kYM5QXFY67Zf8IqiCshde4I
         1Akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0IxAVv9HFNQDOGu6qEb+RKfGTfy8P8WYeCdHsFyTnEA=;
        b=SpVjvxnJMXTGm6VYVeL/fviMXrLBg5vVKKjF5ud0RjDRwO8ZihBkma3yVJh40zeM3I
         aR0JU2VDvfp9UjKhTYh5ArN74AeUqKOwkGRWQJAsch+DNTuvu2wbFYxXlnNHsb4+g6aC
         UXLvof6kwuorKjx44GCIQEqc8G1e//w+/RIaAr0FugRJLDzqp2gxXp2nbCZvC85d09AZ
         q/zBensECljp5v5s/IWLG5+NP2Vuv3BbOHoKeE9uQL50Qrzsm7S5Yvbq8Tv5XEd5MAKv
         /OhqkcDbj6oUaNBB9NfXt7cXyxhjCQ65Ly/4f/pBUEHhd/+jiXmcfSGhpc48FuEK4pc4
         ooMA==
X-Gm-Message-State: AOAM530ybTlsRKi6DR9g5ej6TW05+p0JfCn4D64mZleB6Qkj1WDS08kR
	oHaS4ZwrSaogxiN8024UB98=
X-Google-Smtp-Source: ABdhPJzxspONYB/9TwCrWBseE06aGGJMeKhJSMSGPcnMbeXWIi2fqfGiyF2Zo06JnX/buogmFyGNYg==
X-Received: by 2002:a17:90a:db01:: with SMTP id g1mr1020134pjv.127.1615240983484;
        Mon, 08 Mar 2021 14:03:03 -0800 (PST)
Received: from [10.67.49.104] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id x11sm237664pjh.0.2021.03.08.14.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 14:03:03 -0800 (PST)
Subject: Re: [GIT PULL 1/2] Broadcom late devicetree changes for 5.12
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-arm-kernel@lists.infradead.org, khilman@kernel.org,
 bcm-kernel-feedback-list@broadcom.com
References: <20210217011654.2561426-1-f.fainelli@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <36375146-6aa3-9796-9c26-fdd7705b6cec@gmail.com>
Date: Mon, 8 Mar 2021 14:03:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210217011654.2561426-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/16/21 5:16 PM, Florian Fainelli wrote:
> The following changes since commit a0610b409fc9f90b4861c021ebe853bfcc310bb3:
> 
>   Merge tag 'tags/bcm2835-dt-next-2021-01-28' into devicetree/next (2021-01-28 20:11:44 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/devicetree-part2
> 
> for you to fetch changes up to 443f0bb8e29fa031ec4d5beb3c3143350438dc97:
> 
>   Revert "ARM: dts: bcm2711: Add the BSC interrupt controller" (2021-02-16 17:11:40 -0800)
> 
> ----------------------------------------------------------------
> This pull request contains Broadcom ARM-based SoC changes for 5.12,
> please pull the following:
> 
> - Florian reverts the adding of the second level interrupt controller
>   for HDMI BSC interrupts since they collide with the main I2C
>   controller (i2c-bcm2835).
> 
> ----------------------------------------------------------------

Arnd, Olof, is there any chance you can apply this for an upcoming
5.12-rc candidate? Likewise for "[GIT PULL 2/2] Broadcom late drivers
changes for 5.12". Thank you!
-- 
Florian
