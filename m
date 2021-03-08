Return-Path: <SRS0=G0Ss=IG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12909C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Mar 2021 22:05:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97BC165253
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Mar 2021 22:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97BC165253
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=68GFgr6iQNHJYvV31+4EKp7QBz8eUeUBRggqpg+vcao=; b=oJing15CUEE7bVAhcFhp67MDO
	Tu1Bsh7EWOPClu6K7aHTVNMpGe2CcOriK3oIAYkXjUc0Jft8Rf6wkmM5xr7cdHm8oMp4YSqFgTaHF
	mv/x1jQzPrnJiDo48GDt4h6Gp4YQrGmGurb2pyBvW9suQuH5tGW9nfyPtyF5igYutfDQm0GZjd4mu
	O+35923HIejQKSS5SFJUOuBmJoNmQ67/t8s2OtgbUp901pVH5JMXNL/hE1pn52AnC6A8Rhjqi7MG0
	WZkD7gfxsp/Ekg+bSdQEiSyr21fzQ7PfpW4bidRJe4OuxVNjanVaSbrMswdKetWewffMw0/3sWr7F
	v7rhIAe6A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJNy6-0037N1-6v; Mon, 08 Mar 2021 22:03:14 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJNxw-0037Im-VB
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Mar 2021 22:03:07 +0000
Received: by mail-pl1-x633.google.com with SMTP id e2so278056pld.9
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Mar 2021 14:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
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
 b=NgeBEnTno70TioU/orR5gHpT+vzFR5PQA8RwBZuEzBFOkBS5ade0577BYeG4EeBre8
 V6wWBt0fqSxzTBrxL7pq22FdmcYbYgRK7ocG8WLexnXhHmqrlPxBfVyvsZIXibcMuPUg
 YcXopb1X5ri7arpHSIfEEXzRVbuZ1QAtjLQ+QhdmPmsB8vA5xs42YXvr3HavDHUJvQvP
 NdSOOZJ5n2f/KurQnsENP3eGSBH3lQeeP9wBxMYUrmkA+y702LleOk7NdnjABN3I7lEb
 oAG0+lpHcn6UxEmYdXV197wiZo8YS0sMpZOoPMpABbOWxPuquFTaN8NPaVD9OaSikMRf
 VeSQ==
X-Gm-Message-State: AOAM5314uisPs2fnrwp83y897eY2w3XF5KVtooes3GaX3LHzjz+R3f9g
 MZPS1eZfas4lEf18b5P6bXE=
X-Google-Smtp-Source: ABdhPJzxspONYB/9TwCrWBseE06aGGJMeKhJSMSGPcnMbeXWIi2fqfGiyF2Zo06JnX/buogmFyGNYg==
X-Received: by 2002:a17:90a:db01:: with SMTP id
 g1mr1020134pjv.127.1615240983484; 
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
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_220305_217999_D2BFD6E7 
X-CRM114-Status: GOOD (  14.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210308220301.yT4UBCU4Nu8GDDH71hRaO_qpESfrPmXagv4yRYQjrs4@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
