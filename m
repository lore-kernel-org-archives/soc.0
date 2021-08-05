Return-Path: <SRS0=zXmn=M4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6639C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 08:58:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8228361029
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 08:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8228361029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9Sbtd7p3gegoGF05CBo4zUkloaWO3W+6jClaVY+qLA=; b=ladnJBM+etl8FRCe7n4WKFCHDv
	oaVrcjOZE+7qFZniCUDf8rln++pRLA60GqYxy/PXJlKy+uGxHtL2+aaoguWtzhNJr4VpEPVZ0BAQA
	LWGAqLQzEINp943xzHvxRusQyjL1rERtZPZsTihk6vtljNmUF1yzH0d5H5Hr4g4S3t6UziZc5nvfw
	Ixq/w2shpQf/cQaNE1aeBQJmEiTa2uOXFvcg2P0Bgoa3MxKGXJKK4CjzlzotKQYfC34iVHPh0PUCe
	oskmfBiJIcTOA9rO9uh+LrN3AQ+QFp2BuuNNeHbSnWlCI3MjjUCnsWdxW/yMMDWgFz7DBX3V5SXWS
	TArnY7MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBZBh-008k2v-99; Thu, 05 Aug 2021 08:57:13 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBZBd-008k1M-AD
 for linux-arm-kernel@lists.infradead.org; Thu, 05 Aug 2021 08:57:10 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so13181684pjs.0
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 05 Aug 2021 01:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uBGvDrKwcptU4eI40KiqTkmrFiw969jPWA+k2q+CekM=;
 b=kNboybg+6Kjx5JPc/fxOD0oELVczHRj++IDC4hjC0/OJk4oKrRyTu8M/whUk444G3z
 z+fRzPQgeChY0IafDiRl71BHTnwukeLwafgpiosx++y30fCAqhxNrfr7UiEYDTKFvXr2
 dqkQ+2Ld7LKQhj2ZzLXZejyt4Gq4hF4mWUougONkFY4DVy5NPITwb4kBmKAwwOQU6jCS
 TrXao+msXwv0tXe0VFsDyhbi2/VrcLkNZA/Zg8EGlLXevzJnbH51b45b8ax4LMNkWFOS
 5JhMONx+HcEtJwUORLuXLTA3HKm6vfMZfEJqpBIWJr0rKaIiwF5PZsUGvLMAlTf9WRFZ
 1clg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uBGvDrKwcptU4eI40KiqTkmrFiw969jPWA+k2q+CekM=;
 b=FP1/c83fT5Z5vG1uFtzF2jQi1sRtxAGqHtGgbyOael3Wyveh+6hLNXOHtdzGM4ZLYw
 /6+B47jDHrLN2J08SNagvMs2bL9qwuqRaJMeNkkIYsK4G+M66hZYkwedV66fKVj9NiMz
 ZXbH52gXQSNGnQU6IBheRZovCYCZqL2mWfiPpQSZi+u+XWyg2ZotWYiil/O+I2RCCRZT
 QcGwE53brwEGBOp6wc3x50ObsnThLodbrrlwDWClWWgrGWO85Y563VG2dX5/kGvPbuYR
 Vuz2Zd45AnoWhG6VfSf/527MokFwzwBjVOkPaAXAPjH+QTZIoBwCca9ANpWoNNTABb6Z
 mGUg==
X-Gm-Message-State: AOAM531dHbn9QnZqLbTo8QYgEuijmbdaPFlaF52M04PzM7KnNyxd7YNK
 zLO+gsdpkP68IzPnEy0H2UB68QyDZJsmiw==
X-Google-Smtp-Source: ABdhPJwGKr4kXuL4EeyTRjdfibpMy6P+YgIwbVDl7RF3M2FKtZcBxPa+YY9mfpLYTvKBD5tas4xFWg==
X-Received: by 2002:a17:902:6bc8:b029:117:6a8a:f7af with SMTP id
 m8-20020a1709026bc8b02901176a8af7afmr375795plt.51.1628153827200; 
 Thu, 05 Aug 2021 01:57:07 -0700 (PDT)
Received: from [192.168.1.22] (amarseille-551-1-7-65.w92-145.abo.wanadoo.fr.
 [92.145.152.65])
 by smtp.gmail.com with ESMTPSA id h20sm5911451pfn.173.2021.08.05.01.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 01:57:06 -0700 (PDT)
Subject: Re: [PATCH v4 0/4] ARM: dts: NSP: add Meraki MX64/MX65 series
To: Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sam Ravnborg
 <sam@ravnborg.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20210625095000.3358973-1-mnhagan88@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <fefad5f1-a2be-0feb-6170-d1bf5a1d86a2@gmail.com>
Date: Thu, 5 Aug 2021 01:57:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210625095000.3358973-1-mnhagan88@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_015709_415658_4DA7881E 
X-CRM114-Status: GOOD (  17.31  )
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
Message-ID: <20210805085701.s2K_XKLN77PQYWrmWUYsgAO7v1CxcNAcSxNmWSsKySA@z>



On 6/25/2021 2:49 AM, Matthew Hagan wrote:
> Changes from v2:
>   - Introduce boards to Makefile in same patch as the board dts is added
>     (Vladimir Oltean)
>   - Use alphabetical ordering for labels (Vladimir Oltean)
>   - Remove address-cells and size-cells in qca8337 switch nodes (Vladimir
>     Oltean)
>   - Remove "cpu" labels from switch nodes' CPU ports (Vladimir Oltean)
>   - Various LED fixes, utilising dt-bindings/leds/common.h and correctly
>     specifying LEDs in the form "led-N" and with the color/function/
>     function-enumerator properties.
>   - Fix PWM LEDs and corresponding pinctrl bindings. (Vladimir Oltean)
> 
> The following changes were submitted as a separate series:
>   - Introduce patches to disable QSPI by default and enable where used
>     (Vladimir Oltean)
>   - Move mdio@18032000 node from board related file to SoC (Vladimir
>     Oltean)
>   - In addition to above, relocate mdio-mux to bcm-nsp.dtsi and fix
>     the resulting usb3_phy issues
> 
> Changes from v3:
>   - Sort labels on mx64 a0 dts files into alphabetical order as well
>   - move include directives for input/input.h and leds/common.h to
>     bcm958625-mx6x-common.dtsi
>   - Whitespace fixes in bcm958625-mx6x-common.dtsi
>   - rename "senao_nvram" partition to "nvram"
> 
> Matthew Hagan (4):
>    ARM: dts: NSP: Add common bindings for MX64/MX65
>    ARM: dts: NSP: Add DT files for Meraki MX64 series
>    ARM: dts: NSP: Add DT files for Meraki MX65 series
>    dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65

Matt, should I be expecting a v5 based on Arnd's comments?
-- 
Florian

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
