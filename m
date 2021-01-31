Return-Path: <SRS0=Fj/g=HC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4EFC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Jan 2021 22:20:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8579864E29
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Jan 2021 22:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8579864E29
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J2LnArCfNwcSw7qyTNWzWqeJtAfuzqHPhDT9g31LoIc=; b=TUV2Yvnl1AAgHiDcC2Q11fAU1
	bttpHIcGiRwrpcrRVHGEJEHVibEZF9x+A7vjrvVPkhfI6kcrV3hvr1zRxIH8dplLQL2yya5hPl1bK
	zpgZcCymNlv+WKRlV2vsO3PGvFTvUaHqHXfXUrJH0RtjsCXE4PvkR2L6SRXeH0ZnYyOAnJ/xJfUb0
	CMMBxbRj6QAKLqgs28TkEp5WHDszC4FlUKihXziWTmBq7NkkCGwaDdgRucF9di0ZKuQtww4chdF87
	7VvDUvrYbUhC4KjZPmPV9RM5sTt1yKjmOsncy8zwBmc4G1UGq+pBZeUZQ1VfzAS0cNc5PQGMKgpTc
	35Durt/UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6L3h-0001AV-PF; Sun, 31 Jan 2021 22:19:05 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6L3e-00018K-Au
 for linux-arm-kernel@lists.infradead.org; Sun, 31 Jan 2021 22:19:03 +0000
Received: by mail-pl1-x62d.google.com with SMTP id y10so4650287plk.7
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 31 Jan 2021 14:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6VE3SxdXhb/VJqVGUYcnGRiUq0o7UmpUrQqTKiWRK98=;
 b=J6BRswfyLA0VL8sR/7T+TImWTwgrHHc8w+1Iylrgan9NNql0qG0m+HZ542PT+su4JX
 UNrJwGAdz1zJkk3aFT0e5TIn0i2jq0WO3yYwV0Bx+JGRNLy+eCWaKmB3O98O6hJWIe4R
 UTpumSaNE004UztWrQUuywzlC+d7qH45spv6Wqah2/yOjmXTIz9V43h5NxIykBSW2/5f
 JWRbOjWfzjp7kYtKNFIfQeNpBcH58c3KHPCi57e2tEgH2QjBGWmNVEI7qVKYFNFUXFqI
 UPfwuPOH3ycWv9V9PRPUIWK/zf6HE3fH9MQ5Flf2TnpaLdeE/wE6PSATCcUscdIweLrr
 oLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6VE3SxdXhb/VJqVGUYcnGRiUq0o7UmpUrQqTKiWRK98=;
 b=IOx8Ba97a4h44ceqPN6u73wrZdlZy8usEgjHxaCT+1rhdbZw1FKPMuJTjLx3FBXnbm
 eY7qqN+JTQ7MN1Yr9Bxl5Fpj/+CldDPEg/g2jPelbmMpHXa+qCUIIAVRupbrXk6C7XWg
 s8/m/ZJTpXDDm7pQzFQWC4e7vO8BVDv7UwOP54zXJCZOkXvNNcq4H6+ut/cUFjRtlHrl
 BsaFuxXr12NYSxNaSqZ7U1s9xV2zfzYS8YWyRDD/5p9kzZHOg8hnPdEnIEHOwtq9QSPY
 CKUeYvZbf6nX+0W4UYFhXwUQBIdDaabFezxAIbtRvi7Q+MOeSXP/zWT4GRNUzucyFi+F
 TzvQ==
X-Gm-Message-State: AOAM532yR/zQ0nxChM2ylZpJgoX4XtcJbeE2ghchcUJFYbGbrtgIy81z
 cARRz1CIuL449z4CCh/D2HA=
X-Google-Smtp-Source: ABdhPJx8DID0hI6w8D2ZWwo5h0GgEAacQX8UhZhIIUkc4xroXaDcZ+m/mY8XzDmxTrs5KmiaWkxrQg==
X-Received: by 2002:a17:90b:4ad2:: with SMTP id
 mh18mr14385364pjb.137.1612131540308; 
 Sun, 31 Jan 2021 14:19:00 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id 197sm15424489pgg.43.2021.01.31.14.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 14:18:59 -0800 (PST)
Subject: Re: [GIT PULL 7/7] Broadcom soc changes for 5.12
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
References: <20210131221721.685974-1-f.fainelli@gmail.com>
 <20210131221721.685974-7-f.fainelli@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <f517c5df-bf3a-861c-1bc4-df6a89b42230@gmail.com>
Date: Sun, 31 Jan 2021 14:18:57 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210131221721.685974-7-f.fainelli@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_171902_459058_2D571765 
X-CRM114-Status: GOOD (  14.22  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: arnd@arndb.de, khilman@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, Maxime Ripard <maxime@cerno.tech>,
 olof@lixom.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210131221857.pfe6TAF9MFEMcyYm41fASJo_5bFbYN2WbS-Wm6JaO04@z>



On 1/31/2021 2:17 PM, Florian Fainelli wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/soc
> 
> for you to fetch changes up to e066cfd867aabe621be5c1855fc42ff699781ae4:
> 
>   Merge tag 'tags/bcm2835-soc-next-2021-01-25' into soc/next (2021-01-25 13:14:49 -0800)
> 
> ----------------------------------------------------------------
> This pull request contains Broadcom ARM-based SoCs Kconfig/machine entry
> changes for 5.12, please pull the following:
> 
> - Maxime adds a select of the Broadcom STB standard L2 interrupt
>   controller driver which is used in the Raspberry Pi 4 HDMI controller to
>   support I2C and CEC interrupts
> 
> - Florian adds a debug URT entry for the 72116 STB SoC
> 
> ----------------------------------------------------------------

You can ignore this one, my script had a hiccup and it is strictly the
same as 6/6.
-- 
Florian

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
